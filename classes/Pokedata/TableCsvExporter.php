<?php

namespace metaunicorn\Pokedata;

/**
 * Exports a SQL table into CSV files
 */
class TableCsvExporter extends TableCsvHelper
{

    /**
     * @param array $tables List of tables to be exported (with the $tablePrefix if any)
     * @param string $tablePrefix Table prefix to be excluded from the resulting CSV filename
     * @throws \Exception
     */
    public function export(array $tables = null, $tablePrefix = '')
    {
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
            $filename = $tablePrefix ? preg_replace('/^/' . $tablePrefix, '', $tableName, 1) : $tableName;
            $csvFile = rtrim($this->getPath(), DIRECTORY_SEPARATOR . '\\') . DIRECTORY_SEPARATOR . $filename . '.csv';
            if (file_exists($csvFile)) {
                // Empty the file if exists
                file_put_contents($csvFile, '');
            } else {
                touch($csvFile);
            }

            $this->log("Exporting table ${tableName} to CSV...");
            $fileHandler = fopen($csvFile, 'w');
            $rowCount = 0;
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