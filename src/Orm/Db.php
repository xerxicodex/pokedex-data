<?php

namespace metaunicorn\Pokedata\Orm;

class Db
{
    /**
     * @var \PDO
     */
    private $pdo;

    /**
     * @var string
     */
    private $tablePrefix;

    /**
     * @var string
     */
    private $driverName;

    /**
     * @var self[]
     */
    private static $instances = [];

    /**
     *
     * @param \PDO $pdo
     * @param string $driverName
     * @param string $tablePrefix
     */
    private function __construct(\PDO $pdo, $driverName, $tablePrefix = '')
    {
        $this->pdo         = $pdo;
        $this->driverName  = $driverName;
        $this->tablePrefix = $tablePrefix;

        $pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    }

    /**
     * @param string $dsn
     * @param string|null $username
     * @param string|null $password
     * @param array $options
     * @param string $tablePrefix
     *
     * @return static
     */
    public static function createInstance(
        $dsn,
        $username = null,
        $password = null,
        array $options = [],
        $tablePrefix = ''
    ) {
        $pdo    = new \PDO($dsn, $username, $password, $options);
        $driver = explode(':', $dsn, 2);
        $driver = strtolower(array_shift($driver));
        //$driverClass = __NAMESPACE__ . '\\Adapters\\' . ucfirst($driver) . 'DbalAdapter';
        $instance = new static($pdo, $driver, $tablePrefix);

        return $instance;
    }

    /**
     * @param string $connectionName
     *
     * @return static
     */
    public static function getInstance($connectionName = 'default')
    {
        return static::$instances[$connectionName];
    }

    /**
     * @param Db $instance
     * @param string $connectionName
     */
    public static function setInstance(Db $instance, $connectionName = 'default')
    {
        static::$instances[$connectionName] = $instance;
    }

    /**
     * Creates a prepared query
     *
     * @param string $statement
     * @param array $params
     *
     * @return \PDOStatement|false Returns the PDOStatement used internally or FALSE on failure
     */
    public function query($statement, array $params = null)
    {
        $statement = $this->getPdo()->prepare($statement);
        if ($params) {
            $this->bind($statement, $params);
        }
        $successful = ($statement->execute() !== false);

        return $successful ? $statement : false;
    }

    /**
     * Executes raw SQL directly
     *
     * @param string $statement
     *
     * @return int|false Number of affected rows or FALSE on failure
     */
    public function execute($statement)
    {
        if ( ! $statement) {
            return false;
        }

        return $this->getPdo()->exec($statement);
    }

    /**
     * @param string $selection
     * @param string $from
     * @param string $statement other extra clauses (where, order by, etc)
     * @param array $params
     *
     * @return \PDOStatement
     */
    public function select($selection, $from, $statement, array $params = null)
    {
        $from      = $this->quoteIdentifier($this->getTablePrefix() . $from);
        $statement = $this->getPdo()->prepare("SELECT ${selection} FROM ${from}" . $statement);
        if ($params) {
            $this->bind($statement, $params);
        }
        $statement->execute();

        return $statement;
    }

    /**
     * Inserts a row or multiple in the same query depending
     * if $data is an array of arrays (collection) or a single-level array.
     *
     * All data is prepared an bound with PDO.
     *
     * @param string $into Table name
     * @param array $data It can be either an array representing a single row or an array of rows (aka. collection)
     *
     * @return bool The return value of PDOStatement::execute
     */
    public function insert($into, array $data)
    {
        if (empty($data)) {
            return false;
        }

        // Support multiple inserts in the same query
        $firstElement = reset($data);
        if ( ! is_array($firstElement)) {
            $data = [$data];
        }

        $placeholders = [];
        $columns      = null;
        $values       = [];

        foreach ($data as $d) {
            if (is_null($columns)) {
                // Here you have to trust your field names!
                // But it's not the task of this class to validate them.
                $columns = array_keys($d);
            }
            $placeholders[] = '(' . trim(str_repeat("?,", count($d)), ',') . ')';
            $values         = array_merge($values, array_values($d));
        }

        $into = $this->quoteIdentifier($this->getTablePrefix() . $into);
        $sql  = "INSERT INTO " . $into . " (" . implode(',', $this->quoteIdentifier($columns))
                . ") VALUES " . implode(',', $placeholders);

        $q = $this->getPdo()->prepare($sql);

        $this->bind($q, $this->prepareValues($values));

        return $q->execute();
    }

    /**
     * @param string $table Table name
     * @param array $data
     * @param string $where
     * @param array|null $whereParams
     *
     * @return int|false Affected rows or FALSE in case of failure
     */
    public function update($table, array $data, $where, array $whereParams = null)
    {
        if (empty($data)) {
            return false;
        }
        $table = $this->quoteIdentifier($this->getTablePrefix() . $table);

        $assignments = array_map(function ($column) {
            return $this->quoteIdentifier($column) . ' = ?';
        }, array_keys($data));

        $values = array_values($data);

        $where = ($where ? " WHERE $where " : "");
        $sql   = "UPDATE " . $table . " SET " . implode(', ', $assignments) . " $where";
        if ($whereParams) {
            $values = array_merge($values, $whereParams);
        }

        $q = $this->getPdo()->prepare($sql);

        $this->bind($q, $this->prepareValues($values));

        return $q->execute();
    }


    /**
     * @param string $from Table name
     * @param string $where
     * @param array|null $whereParams
     *
     * @return int|false Affected rows or FALSE in case of failure
     */
    public function delete($from, $where, array $whereParams = null)
    {
        $from  = $this->quoteIdentifier($this->getTablePrefix() . $from);
        $where = ($where ? " WHERE $where " : "");
        $sql   = "DELETE FROM " . $from . "$where";
        $q     = $this->getPdo()->prepare($sql);

        if ($whereParams) {
            $this->bind($q, $this->prepareValues($whereParams));
        }

        return $q->execute();
    }

    public function isTableEmpty($tableName)
    {
        $tableName = $this->quoteIdentifier($this->getTablePrefix() . $tableName);

        return ($this->query("SELECT 1 FROM $tableName LIMIT 1")->fetch() == false);
    }

    /**
     * Check if a table exists in the current database.
     *
     * @param string $tableName
     *
     * @return bool TRUE if table exists, FALSE otherwise.
     */
    public function hasTable($tableName)
    {
        $tableName = $this->quoteIdentifier($this->getTablePrefix() . $tableName);

        return $this->tryQuery("SELECT 1 FROM $tableName LIMIT 1") !== false;
    }

    /**
     * Check if a column exists in the given table.
     *
     * @param string $tableName
     * @param string $columnName
     *
     * @return bool TRUE if column exists, FALSE otherwise.
     */
    public function hasColumn($tableName, $columnName)
    {
        $tableName  = $this->quoteIdentifier($this->getTablePrefix() . $tableName);
        $columnName = $this->quoteIdentifier($columnName);

        return $this->tryQuery("SELECT $columnName FROM $tableName LIMIT 1") !== false;
    }

    public function bind(\PDOStatement $statement, array $params)
    {
        $paramPosition = 1;
        foreach ($params as $param) {
            $isArray = is_array($param);

            if ( ! $isArray) {
                $type = $this->getBindType($param);
                $statement->bindValue($paramPosition, $param, $type);
            } elseif ($isArray) {
                call_user_func_array([$statement, 'bindValue'], $param);
            }

            $paramPosition++;
        }
    }

    /**
     * @param \PDO $pdo
     *
     * @return static
     */
    public function setPdo(\PDO $pdo)
    {
        $this->pdo = $pdo;

        return $this;
    }

    /**
     * @return \PDO
     */
    public function getPdo()
    {
        return $this->pdo;
    }

    /**
     * @return string
     */
    public function getDriverName()
    {
        return $this->driverName;
    }

    /**
     * @param string $tablePrefix
     *
     * @return static
     */
    public function setTablePrefix($tablePrefix)
    {
        $this->tablePrefix = $tablePrefix;

        return $this;
    }

    /**
     * @return string
     */
    public function getTablePrefix()
    {
        return $this->tablePrefix;
    }

    /**
     * Executes the callback inside a transaction and a try/catch.
     * If any exception occurs, the transaction is rolled back, otherwise committed.
     *
     * @param \Closure $callback Callback that accepts the current Dbal instance as first argument.
     *
     * @return mixed The return value of the callback
     * @throws \Exception The exception that caused the rollback
     */
    public function transactional(\Closure $callback)
    {
        $result = null;
        $this->beginTransaction();
        try {
            $result = $callback($this);
            $this->commit();
        } catch (\Exception $e) {
            $this->rollback();
            throw $e;
        }

        return $result;
    }

    /**
     * Begins a transaction
     * @return bool
     */
    public function beginTransaction()
    {
        return $this->getPdo()->beginTransaction();
    }

    /**
     * Checks if inside a transaction
     * @return bool
     */
    public function inTransaction()
    {
        return $this->getPdo()->inTransaction();
    }

    /**
     * Commits the current transaction
     * @return bool
     */
    public function commit()
    {
        return $this->getPdo()->commit();
    }

    /**
     * Rolls back the current transaction
     * @return bool
     */
    public function rollback()
    {
        return $this->getPdo()->rollBack();
    }

    /**
     * @param array $values
     *
     * @return array
     */
    private function prepareValues(array $values)
    {
        foreach ($values as $k => $value) {
            if ($value instanceof \DateTime) {
                $values[$k] = $value->format("Y-m-d H:i:s");
            }
            if ( ! is_scalar($value)) {
                throw new \InvalidArgumentException('The given value is not a scalar: ' . print_r($value, true));
            }
        }

        return $values;
    }

    /**
     * Quotes a table or column name with back ticks in case it was not quoted before or it does not contain a dot.
     *
     * @param string|array $identifier or array of identifiers
     *
     * @return string
     */
    private function quoteIdentifier($identifier)
    {
        if (is_array($identifier)) {
            return array_map(function ($id) {
                return $this->quoteIdentifier($id);
            }, $identifier);
        }

        return ((strpos($identifier, '`') || strpos($identifier, '.')) ? $identifier : "`$identifier`");
    }

    /**
     * @param $statement
     *
     * @return bool
     */
    private function tryQuery($statement)
    {
        // Try a select statement against the table
        // Run it in try/catch in case PDO is in ERRMODE_EXCEPTION.
        try {
            $result = $this->getPdo()->query($statement, \PDO::FETCH_ASSOC);
            if ( ! $result) {
                // Not found or failure
                return false;
            } else {
                // Not found
                return $result->fetch() != false;
            }
        } catch (\Exception $e) {
            // We got an exception == query is wrong
            return false;
        }
    }

    private function getBindType($value)
    {
        $type = strtolower(gettype($value));

        switch ($type) {
            case 'string':
            case 'float':
            case 'double':
                return \PDO::PARAM_STR;
            case 'integer':
                return \PDO::PARAM_INT;
            case 'boolean':
                return \PDO::PARAM_BOOL;
            case 'null':
                return \PDO::PARAM_NULL;
            default:
                return \PDO::PARAM_STR;
        }
    }

}