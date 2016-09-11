<?php

namespace metaunicorn\Pokedata\Csv;

/**
 * Exports a SQL table into CSV files
 */
class DbExporter extends BaseDbHelper
{
    /**
     * @param array $tables List of tables to be exported (with the table prefix if any)
     *
     * @throws \Exception
     */
    public function export(array $tables = null)
    {
        $tablePrefix = $this->getDb()->getTablePrefix();
        if (is_null($tables)) {
            $tables = array_map(function ($row) {
                return $row['name'];
            },
                $this->getDb()
                     ->query('SELECT name FROM sqlite_master WHERE type = "table"')
                     ->fetchAll(\PDO::FETCH_ASSOC)
            );
        }
        foreach ($tables as $tableName) {
            if ($this->getDb()->isTableEmpty($tableName)) {
                $this->getCli()->writeLn("Skipping export of empty table ${tableName} ...");
                continue;
            }

            $filename = $tablePrefix ? preg_replace('/^/' . $tablePrefix, '', $tableName, 1) : $tableName;
            $csvFile  = rtrim($this->getCsvPath(),
                    DIRECTORY_SEPARATOR . '\\') . DIRECTORY_SEPARATOR . $filename . '.csv';
            if (file_exists($csvFile)) {
                // Empty the file if exists
                file_put_contents($csvFile, '');
            }

            $this->getCli()->writeLn("Exporting table ${tableName} to CSV...");
            $fileHandler = fopen($csvFile, 'w');
            $rowCount    = 0;
            try {
                $query = $this->getDb()->query("SELECT * FROM `${tableName}`");
                while ($row = $query->fetch(\PDO::FETCH_ASSOC)) {
                    if ($rowCount === 0) {
                        fputcsv($fileHandler, array_keys($row));
                    }
                    fputcsv($fileHandler, array_values($row));
                    $rowCount++;
                }
            } catch (\Exception $exception) {
                fclose($fileHandler);
                throw $exception;
            }

        }
    }
}