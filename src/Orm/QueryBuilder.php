<?php

namespace Pokedex\Db;

class QueryBuilder
{

    /**
     * @var array
     */
    protected $clauses = [];

    /**
     * String escaping mechanism
     *
     * @var \Closure
     */
    protected $escapeClosure;

    /**
     * @param \Closure $escapeClosure String escaping mechanism
     */
    public function __construct(\Closure $escapeClosure = null)
    {
        $this->escapeClosure = $escapeClosure;
    }

    /**
     * @param string $statement
     *
     * @param bool $reset By default, the query is reset, but in some cases you may want to append a raw query.
     *
     * @return static
     */
    public function raw($statement, $reset = true)
    {
        if ($reset) {
            $this->resetQuery();
        }

        return $this->addClause(null, $statement);
    }

    /**
     * @param string $value
     *
     * @return string
     */
    public function escape($value)
    {
        $fn = $this->escapeClosure;

        return $fn($value);
    }

    /**
     * @param string $selection Select expression
     * @param string $from Table name and/or join expression
     *
     * @return static
     */
    public function select($selection, $from)
    {
        $this->resetQuery();

        return $this->addClause('SELECT', null, ['selection' => $selection, 'from' => $from]);
    }

    /**
     * @param string $from Table name and/or join expression
     * @param string $what What to count
     * @param string $extraSelection Select expression, appended to the Count
     *
     * @return static
     */
    public function selectCount($from, $what = '*', $extraSelection = null)
    {
        $this->resetQuery();

        $selection = "COUNT(${what}) as RowCount" . (strlen($extraSelection) ? ", ${extraSelection}" : "");

        return $this->addClause('SELECT', null, ['selection' => $selection, 'from' => $from]);
    }

    /**
     * @param string $into Table name
     * @param array $data Key-value pair of columns and values
     *
     * @return static
     */
    public function insert($into, array $data)
    {
        $this->resetQuery();

        return $this->addClause('INSERT', null, ['into' => $into, 'data' => $data]);
    }

    /**
     * @param array $data Key-value pair of columns and values
     * @param string $action Action on duplicated key
     *
     * @return static
     */
    public function onDuplicateKey(array $data, $action = 'UPDATE')
    {
        return $this->addClause('ON DUPLICATE KEY', null, ['data' => $data, 'action' => strtoupper($action)]);
    }

    /**
     * @param string $into Table name
     * @param array $data Key-value pair of columns and values
     *
     * @return static
     */
    public function replace($into, array $data)
    {
        $this->resetQuery();

        return $this->addClause('REPLACE', null, ['into' => $into, 'data' => $data]);
    }

    /**
     * @param string $table Table name
     * @param array $data Key-value pair of columns and values
     *
     * @return static
     */
    public function update($table, array $data)
    {
        $this->resetQuery();

        return $this->addClause('UPDATE', null, ['table' => $table, 'data' => $data]);
    }

    /**
     * @param string $from
     *
     * @return static
     */
    public function delete($from)
    {
        $this->resetQuery();

        return $this->addClause('DELETE', null, ['from' => $from]);
    }

    /**
     * @param string $column
     * @param mixed $value
     * @param string $columnOperator
     * @param string $statementOperator
     *
     * @return static
     */
    public function where($column, $value, $columnOperator = '=', $statementOperator = 'AND')
    {
        $columnOperator    = strtoupper($columnOperator);
        $statementOperator = strtoupper($statementOperator);

        if (in_array($columnOperator, ['IN', 'NOT IN'])) {
            $formattedValue = '(' . implode(', ', array_map([$this, 'format'], (array)$value)) . ')';
        } else {
            $formattedValue = $this->format($value);
        }
        $statement = "${column} ${columnOperator} ${formattedValue}";

        switch ($statementOperator) {
            case 'AND':
                $this->addClause('WHERE', $statement, ['operator' => 'AND']);
                break;
            case 'OR':
                $this->addClause('WHERE', $statement, ['operator' => 'OR']);
                break;
        }

        return $this;
    }

    /**
     * @param string $column
     * @param mixed $value
     * @param string $operator
     *
     * @return static
     */
    public function andWhere($column, $value, $operator = '=')
    {
        return $this->where($column, $value, $operator, 'AND');
    }

    /**
     * @param $column
     * @param array $values
     *
     * @return static
     */
    public function whereIn($column, array $values)
    {
        return $this->where($column, $values, 'IN');
    }

    /**
     * @param $column
     * @param string $subquery
     *
     * @return static
     */
    public function whereInSubquery($column, $subquery)
    {
        return $this->raw('WHERE ' . $column . ' IN (' . $subquery . ')', false);
    }

    /**
     * @param $column
     * @param array $values
     *
     * @return static
     */
    public function whereNotIn($column, array $values)
    {
        return $this->where($column, $values, 'NOT IN');
    }

    /**
     * @param array $values
     * @param $comparisonColumn
     * @param $groupColumn
     *
     * @return static
     */
    public function whereAll(array $values, $comparisonColumn, $groupColumn)
    {
        return $this->where($comparisonColumn, $values, 'IN')
                    ->groupBy($groupColumn)
                    ->having('COUNT(DISTINCT ' . $comparisonColumn . ') = ' . count($values));

    }

    /**
     * @param string $column
     * @param mixed $value
     * @param string $operator
     *
     * @return static
     */
    public function orWhere($column, $value, $operator = '=')
    {
        return $this->where($column, $value, $operator, 'OR');
    }

    /**
     * @param string $statement
     *
     * @return static
     */
    public function groupBy($statement)
    {
        if ($statement !== null) {
            $this->addClause('GROUP BY', $statement);
        }

        return $this;
    }

    /**
     * @param string $statement
     *
     * @return static
     */
    public function having($statement)
    {
        if ($statement !== null) {
            $this->addClause('HAVING', $statement);
        }

        return $this;
    }

    /**
     * @param string $statement
     *
     * @return static
     */
    public function orderBy($statement)
    {
        if ($statement !== null) {
            $this->addClause('ORDER BY', $statement);
        }

        return $this;
    }

    /**
     * @param int $length
     * @param int $offset
     *
     * @return static
     */
    public function limit($length, $offset = null)
    {
        if ($length !== null) {
            $this->addClause('LIMIT', null, ['length' => $length, 'offset' => $offset]);
        }

        return $this;
    }

    /**
     * Generates the query string
     *
     * @param bool $reset If true, empties all clauses
     *
     * @return string
     */
    public function toSql($reset = true)
    {
        if (empty($this->clauses)) {
            return '';
        }
        $query    = [];
        $hasWhere = false;

        foreach ($this->clauses as $c) {
            switch ($c['name']) {
                case null:
                    $query[] = rtrim($c['statement'], '; ');
                    break;
                case 'GROUP BY':
                case 'HAVING':
                case 'ORDER BY':
                    $query[] = $c['name'] . ' ' . $c['statement'];
                    break;
                case 'SELECT':
                    $query[] = 'SELECT ' . $c['params']['selection'] . ' FROM ' . $c['params']['from'];
                    break;
                case 'INSERT':
                case 'REPLACE':
                case 'UPDATE':
                case 'ON DUPLICATE KEY': {
                    $q = $c['name'] . ' ';

                    $data = $c['params']['data'];
                    if (is_object($data)) {
                        $data = get_object_vars($data);
                    }
                    $cols            = array_keys($data);
                    $valueAssignment = function ($var, $col) {
                        return $col . ' = ' . $this->format($var);
                    };

                    if ($c['name'] == 'UPDATE') {
                        $q .= $c['params']['table'] . ' SET ' . implode(', ',
                                array_map($valueAssignment, $data, $cols));
                    } elseif ($c['name'] == 'ON DUPLICATE KEY') {
                        $q .= $c['params']['action'] . ' ' . implode(', ', array_map($valueAssignment, $data, $cols));
                    } else {
                        $values = implode(', ', array_map(function ($var) {
                            return $this->format($var);
                        }, $data));

                        $q .= 'INTO ' . $c['params']['into'] . ' (' . implode(', ',
                                $cols) . ') VALUES (' . $values . ')';
                    }
                    $query[] = $q;
                }
                    break;
                case 'DELETE':
                    $query[] = 'DELETE FROM ' . $c['params']['from'];
                    break;
                case 'WHERE': {
                    $q        = $hasWhere ? $c['params']['operator'] : 'WHERE';
                    $hasWhere = true;
                    $query[]  = $q . ' (' . $c['statement'] . ')';
                }
                    break;
                case 'LIMIT': {
                    $offset  = $c['params']['offset'];
                    $query[] = 'LIMIT ' . (($offset === null) ? '' : ($offset . ',')) . $c['params']['length'];
                }
                    break;
            }
        }
        if ($reset) {
            $this->resetQuery();
        }

        $sql = trim(implode(' ', $query));

        //echo PHP_EOL.$sql.PHP_EOL;
        return $sql;
    }

    /**
     * Formats a variable as a suitable SQL query value.
     * Strings are quoted but not escaped, so be careful and sanitize them before.
     *
     * @param mixed $value
     *
     * @return mixed
     */
    public function format($value)
    {
        if ($value === false) {
            return 0;
        }
        if ($value === true) {
            return 1;
        }
        if ($value === null) {
            return 'NULL';
        }

        if ($value instanceof \DateTime) {
            $value = $value->format("Y-m-d H:i:s");
        }

        if (is_string($value)) {
            $value = "'" . $this->escape($value) . "'";
        }

        if ( ! is_scalar($value)) {
            throw new \InvalidArgumentException('The given value is not a scalar.');
        }

        return $value;
    }

    /**
     * @return string
     */
    public function __toString()
    {
        return $this->toSql(true);
    }

    /**
     * Resets the query, emptying all clauses
     * @return $this
     */
    public function resetQuery()
    {
        $this->clauses = [];

        return $this;
    }

    public function getClauses()
    {
        return $this->clauses;
    }

    public function hasClauses()
    {
        return ! empty($this->clauses);
    }

    /**
     * @param array $clauses
     *
     * @return QueryBuilder
     */
    public function setClauses(array $clauses)
    {
        $this->clauses = $clauses;

        return $this;
    }

    /**
     * @param string $name
     * @param string $statement
     * @param array $params
     *
     * @return static
     */
    private function addClause($name, $statement, array $params = [])
    {
        $this->clauses[] = [
            'name'      => $name,
            'statement' => $statement,
            'params'    => $params,
        ];

        return $this;
    }

    public function is($clauseName)
    {
        if (is_string($clauseName)) {
            $clauseName = strtoupper($clauseName);
        }

        return $this->hasClauses() && ($this->clauses[0]['name'] === $clauseName);
    }

    public function isRaw()
    {
        return $this->is(null);
    }

    public function isSelect()
    {
        return $this->is('SELECT');
    }

    public function getFrom()
    {
        return $this->is('SELECT') ? $this->clauses[0]['params']['from'] : null;
    }

    public function isInsert()
    {
        return $this->is('INSERT');
    }

    public function isReplace()
    {
        return $this->is('REPLACE');
    }

    public function isUpdate()
    {
        return $this->is('UPDATE');
    }

    public function isDelete()
    {
        return $this->is('DELETE');
    }

    /**
     * @return QueryBuilder
     */
    public function newQuery()
    {
        return (new self())->setEscapeClosure($this->escapeClosure);
    }

    /**
     * @return \Closure
     */
    public function getEscapeClosure()
    {
        return $this->escapeClosure;
    }

    /**
     * @param \Closure $escapeClosure
     *
     * @return $this
     */
    public function setEscapeClosure($escapeClosure)
    {
        $this->escapeClosure = $escapeClosure;
        return $this;
    }

}
