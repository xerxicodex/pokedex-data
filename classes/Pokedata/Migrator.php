<?php

namespace metaunicorn\Pokedata;

/**
 * Exports a SQL table into CSV files
 */
class Migrator extends TableCsvHelper
{

    /**
     * @param \PDO $db
     */
    public function __construct(\PDO $db)
    {
        $this->setDb($db);
    }

    public function findMigrations($directory)
    {
        $files = array_values(array_filter(scandir($directory), function ($path) use ($directory) {
            return (
                // Check it's not a dir
                (
                    ($path != '.')
                    && ($path != '..')
                    && !is_dir($directory . DIRECTORY_SEPARATOR . $path)
                )
                // Check extension
                && preg_match('/(\.php|\.sql)$/', $path)
            );
        }));
        sort($files);
        return $files;
    }

    public function migrate(array $migrationFiles)
    {
        $migrations = $this->prepareMigrations($migrationFiles);
        $sandboxThis = new \stdClass();

        if (empty($migrations)) {
            $this->log("Nothing to migrate. Skipping...");
            return false;
        }
        foreach ($migrations as $migrationName => $migration) {
            if ($migration['sql'] !== false) {
                $this->log("Running ${migrationName} migration SQL script...");
                $this->getDb()->exec(file_get_contents($migration['sql']));
            }
            if ($migration['php'] !== false) {
                $this->log("Running ${migrationName} migration PHP script...");

                // Isolate the script execution, but expose the PDO connection
                $sandbox = function ($pdo, $script) {
                    include $script;
                };
                $sandbox->call($sandboxThis, $this->getDb(), $migration['php']);
            }
        }
        return true;
    }

    private function prepareMigrations(array $migrationFiles)
    {
        if (empty($migrationFiles)) {
            return [];
        }
        sort($migrationFiles);
        $migrationFiles = array_unique($migrationFiles);

        $migrations = [];

        foreach ($migrationFiles as $file) {
            $migrationName = preg_replace('/(\.php|\.sql)$/', '', $file);
            $migrationName = explode(DIRECTORY_SEPARATOR, $migrationName);
            $migrationName = array_pop($migrationName);

            $migrationType = preg_match('/\.php$/', '', $file) ? 'php' : (preg_match('/\.sql$/', '',
                $file) ? 'sql' : null);
            if (!isset($migrations[$migrationName])) {
                $migrations[$migrationName] = [
                    'sql' => false,
                    'php' => false
                ];
            }
            $migrations[$migrationName][$migrationType] = $file;
        }

        return $migrations;
    }
}