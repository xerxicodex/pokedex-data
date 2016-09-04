<?php

namespace metaunicorn\Pokedata;

/**
 * Base class for managing a directory containing CSV files with a DB
 */
class PdoHelper
{

    /**
     * @var \PDO
     */
    private $db;

    public function __construct(\PDO $db)
    {
        $this->setDb($db);
    }

    /**
     * @param \PDO $db
     */
    public function setDb(\PDO $db)
    {
        $this->db = $db;
    }

    /**
     * @return \PDO
     */
    public function getDb()
    {
        return $this->db;
    }

    public function isTableEmpty($tableName)
    {
        $tableName = $this->quoteTableName($tableName);
        return ($this->getDb()->query("SELECT * FROM $tableName LIMIT 1")->fetch() == false);
    }

    /**
     * Inserts a row or multiple in the same query depending
     * if $data is an array of arrays (collection) or a single-level array.
     *
     * All data is prepared an bound with PDO.
     *
     * @param string $into
     * @param array $data It can be either an array representing a single row or an array of them (or collection)
     * @return bool The return value of PDOStatement::execute
     */
    public function insert($into, array $data)
    {
        if (empty($data)) {
            return false;
        }

        // Support multiple inserts in the same query
        $firstElement = reset($data);
        if (!is_array($firstElement)) {
            $data = [$data];
        }

        $placeholders = [];
        $columns = null;
        $values = [];

        foreach ($data as $d) {
            if (is_null($columns)) {
                // Here you have to trust your field names!
                // But it's not the task of this class to validate them.
                $columns = array_keys($d);
            }
            $placeholders[] = '(' . trim(str_repeat("?,", count($d)), ',') . ')';
            $values = array_merge($values, array_values($d));
        }

        $into = $this->quoteTableName($into);
        $sql = "INSERT INTO " . $into . " (" . implode(',', $this->quoteColumnNames($columns))
            . ") VALUES " . implode(',', $placeholders);

        $q = $this->getDb()->prepare($sql);

        return $q->execute($values);
    }

    /**
     * Check if a table exists in the current database.
     *
     * @param string $table Table to search for.
     * @return bool TRUE if table exists, FALSE if no table found.
     */
    public function hasTable($table)
    {
        $table = $this->quoteTableName($table);

        // Try a select statement against the table
        // Run it in try/catch in case PDO is in ERRMODE_EXCEPTION.
        try {
            $result = $this->getDb()->query("SELECT 1 FROM $table LIMIT 1");
        } catch (\Exception $e) {
            // We got an exception == table not found
            return false;
        }

        // Result is either boolean FALSE (no table found) or PDOStatement Object (table found)
        return $result !== false;
    }

    /**
     * @param string $tableName
     * @return string
     */
    public function quoteTableName($tableName)
    {
        return ((strpos($tableName, '`') || strpos($tableName, '.')) ? $tableName : "`$tableName`");
    }

    /**
     * @param array $columnNames
     * @return array
     */
    public function quoteColumnNames(array $columnNames)
    {
        return array_map(function ($colName) {
            return (strpos($colName, '`') ? $colName : "`$colName`");
        }, $columnNames);
    }
}