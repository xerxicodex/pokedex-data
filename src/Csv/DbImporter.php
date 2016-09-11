<?php

namespace metaunicorn\Pokedata\Csv;

use metaunicorn\Pokedata\Orm\Db;

/**
 * Imports CSV files into a SQL database
 */
class DbImporter extends BaseDbHelper
{
    /**
     * @var bool|false|string
     */
    private $sqlPath;

    /**
     * CsvDbImporter constructor.
     *
     * @param string $csvPath
     * @param bool|false|string $sqlPath if FALSE the SQL schema cache will be disabled
     * @param Db $db
     */
    public function __construct($csvPath, $sqlPath = false, Db $db)
    {
        $this->setSqlPath($sqlPath);
        parent::__construct($csvPath, $db);
    }

    public function isCacheEnabled()
    {
        return ($this->sqlPath !== false);
    }

    public function import(array $files = null, array $columnRules, $maxBulkInserts = 200)
    {
        $tablePrefix = $this->getDb()->getTablePrefix();

        if (is_null($files)) {
            $files = $this->getCsvFiles();
        }

        foreach ($files as $i => $filename) {
            $csvFile            = $this->getCsvPath() . DIRECTORY_SEPARATOR . $filename;

            if(!file_exists($csvFile)){
                $this->getCli()->writeLn('File "' . $filename . '" does not exist. ' .
                                         'Skipping import for this file...');
               continue;
            }
            $tableNameNoPrefix  = basename($filename, '.csv');
            $tableName          = $tablePrefix . $tableNameNoPrefix;
            $currentColumnRules = array_merge(
                (isset($columnRules['*']) ? $columnRules['*'] : []),
                (isset($columnRules[$tableNameNoPrefix]) ? $columnRules[$tableNameNoPrefix] : [])
            );
            $columns            = $this->getCsvColumns($filename);
            $newColumns         = (empty($currentColumnRules) ? $columns :
                array_keys($this->applyColumnRules(array_combine($columns, $columns), $currentColumnRules)));
            $inserts            = [];
            $csvLine            = 0;
            $numInserts         = 0;
            $tableSql           = false;

            if (empty($columns) || empty($newColumns)) {
                $this->getCli()->writeLn('Something went wrong parsing "' . $filename . '" column names. ' .
                                         'Skipping import for this file... The columns where: ');
                $this->getCli()->writeLn([
                    'columns' => $columns,
                    'newColumns' => $newColumns,
                ]);
                continue;
            }

            if ( ! $this->getDb()->hasTable($tableName)) {
                // The table does not exist yet
                $this->getCli()->writeLn('Creating table "' . $tableName . '"...');
                $tableSql = $this->getTableCreationSql($tableNameNoPrefix, $tableName, $newColumns);
            } elseif ( ! $this->getDb()->isTableEmpty($tableName)) {
                // The table is not empty
                $this->getCli()->writeLn('Skipping seeding of not empty table "' . $tableName . '"');
                continue;
            }

            if (($handle = fopen($csvFile, 'r')) !== false) {
                $this->getDb()->beginTransaction();
                try {
                    if ($tableSql != false) {
                        $this->getDb()->execute($tableSql);
                        $tableSql = false;
                    }

                    $this->getCli()->writeLn('Seeding table "' . $tableName . '"');
                    while (($row = fgetcsv($handle, null, ',')) !== false) {
                        if ($csvLine > 0) {
                            $rowAssoc = array_combine($columns, array_values($row));
                            $rowAssoc = (empty($currentColumnRules) ? $rowAssoc : $this->applyColumnRules($rowAssoc,
                                $currentColumnRules));

                            $inserts[] = $rowAssoc;
                            if (count($inserts) >= $maxBulkInserts) {
                                $numInserts += count($inserts);
                                $this->getDb()->insert($tableName, $inserts);
                                $inserts = [];
                            }
                        }
                        $csvLine++;
                    }
                    fclose($handle);
                    if (count($inserts) > 0) { // if there is some bulk insert left
                        $numInserts += count($inserts);
                        $this->getDb()->insert($tableName, $inserts);
                        $inserts = [];
                    }
                    $this->getDb()->commit();
                } catch (\Exception $e) {
                    $this->getCli()->writeLn("WARNING: An SQL error occurred and the transaction will be rolled back.");
                    $this->getDb()->rollback();
                    throw $e;
                }
            }
            if ($numInserts > 0) {
                $this->getCli()->writeLn("$numInserts rows inserted in \"$tableName\"");
            } else {
                $this->getCli()->writeLn("No rows inserted in \"$tableName\"");
            }
        }
    }

    private function applyColumnRules(array $data, array $rules)
    {
        $newData = [];
        foreach ($data as $columnName => $value) {
            if ( ! array_key_exists($columnName, $rules)) {
                // No rules for this column, add it as it is
                $newData[$columnName] = $data[$columnName];
                continue;
            }
            $rule = $rules[$columnName];
            if ( ! $rule) {
                // Exclude column
                continue;
            } else {
                // Rename column
                $newData[$rule] = $data[$columnName];
            }
        }

        return $newData;
    }

    /**
     * Parses the column names of the CSV file (in the first line)
     *
     * @param string $filename CSV file
     *
     * @return \string[] The column names (not quoted)
     */
    public function getCsvColumns($filename)
    {
        $filename = $this->getCsvPath() . DIRECTORY_SEPARATOR . $filename;
        $columns  = [];
        if (($handle = fopen($filename, 'r')) !== false) {
            $columns = fgetcsv($handle, null, ',');
            fclose($handle);
        }

        return $columns;
    }

    private function getTableCreationSql($tableName, $prefixedTableName, array $columnNames)
    {
        if ($this->getDb()->hasTable($prefixedTableName)) {
            $this->getCli()->writeLn('Skipping table creation: Table "' . $prefixedTableName . '" already exists.');

            return false;
        }

        $this->getCli()->writeLn('Creating table "' . $prefixedTableName . '"...');
        $sqlFile = $this->getSqlPath() . DIRECTORY_SEPARATOR . $tableName . '.sql';

        if ($this->isCacheEnabled() && file_exists($sqlFile)) {
            // Load schema file if exists, and continue
            //return file_get_contents($sqlFile);
        }

        $definitions   = [];
        $indexes       = [];
        $hasPrimaryKey = false;
        foreach ($columnNames as $colName) {
            if (
                ! $hasPrimaryKey
                && ($colName == 'id' || ($colName == $tableName . '_id'))
            ) {
                $definitions[] = "`{$colName}` INTEGER unsigned NOT NULL PRIMARY KEY";
                $hasPrimaryKey = true;
            } elseif (
                (preg_match('/^id_/', $colName))
                || (preg_match('/_id$/', $colName))
            ) {
                $definitions[] = "`{$colName}` INTEGER unsigned";
                $indexes[]     = $colName;
            } elseif (
                (preg_match('/^is_/', $colName))
                || (in_array($colName, ['order']))
            ) {
                $definitions[] = "`{$colName}` INTEGER unsigned";
            } elseif (
                (preg_match('/^name_/', $colName))
                || (preg_match('/_name$/', $colName))
                || (in_array($colName, ['identifier', 'codename', 'name', 'slug', 'alias']))
            ) {
                $definitions[] = "`{$colName}` VARCHAR(255)";
            } else {
                $definitions[] = "`{$colName}` TEXT";
            }
        }
        $sql = 'CREATE TABLE IF NOT EXISTS ' . $tableName
               . ' (' . PHP_EOL . '  ' . implode("," . PHP_EOL . '  ', $definitions) . PHP_EOL . ')' . ';' . PHP_EOL;

        foreach ($indexes as $colName) {
            $sql .= PHP_EOL . "CREATE INDEX IF NOT EXISTS `idx_${prefixedTableName}_${colName}`" .
                    " ON `$prefixedTableName` (`${colName}`);" . PHP_EOL;
        }
        $sql = rtrim($sql, PHP_EOL . '; ') . ';' . PHP_EOL;

        if ($this->isCacheEnabled()) {
            if ( ! $this->getSqlPath() || ! is_dir($this->getSqlPath())) {
                throw new \Exception('Cannot export table SQL because the path for storing SQL files
                does not exist. Table creation aborted.');
            }
            file_put_contents($sqlFile, $sql);
        }

        return $sql;
    }

    /**
     * @return bool|false|string
     */
    public function getSqlPath()
    {
        return $this->sqlPath;
    }

    /**
     * @param bool|false|string $sqlPath
     *
     * @return $this
     */
    public function setSqlPath($sqlPath)
    {
        $this->sqlPath = $sqlPath;

        return $this;
    }
}