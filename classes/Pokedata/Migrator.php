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

    public function migrate(array $migrationFiles, $migrationsDir)
    {
        $migrationsDir = rtrim($migrationsDir, DIRECTORY_SEPARATOR);
        $migrations = $this->prepareMigrations($migrationFiles);
        $sandboxThis = new \stdClass();

        if (empty($migrations)) {
            $this->log("Nothing to migrate. Skipping...");
            return false;
        }

        $numMigrations = count($migrations);
        $currentMigrationNum = 0;

        foreach ($migrations as $migrationName => $migration) {
            $currentMigrationNum++;
            $migrationTitle = explode('_', $migrationName, 2);
            $migrationTitle = ucwords(implode(' ', preg_split('/(?=[A-Z])/', array_pop($migrationTitle))));

            if ($migration['sql'] !== false) {
                $sqlFile = $migrationsDir . DIRECTORY_SEPARATOR . $migration['sql'];
                $sqlScript = trim(file_get_contents($sqlFile));
                if (strlen($sqlScript)) {
                    $this->log("RUNNING '${migrationTitle}' SQL migration script...", false);
                    $result = $this->getDb()->exec($sqlScript);
                    if ($result === false) {
                        $this->log(PHP_EOL . "ERROR in '${migrationTitle}' SQL migration script... ABORTING.");
                        exit(1);
                    } elseif (is_int($result)) {
                        $this->log("Affected rows: " . strval($result));
                    }
                } else {
                    $this->log("SKIPPING empty '${migrationTitle}' SQL migration script...");
                }
            }
            if ($migration['php'] !== false) {
                $phpFile = $migrationsDir . DIRECTORY_SEPARATOR . $migration['php'];
                $this->log("RUNNING '${migrationTitle}' PHP migration script...");

                // Isolate the script execution, but expose the PDO connection
                $sandbox = function ($pdo, $script) {
                    include $script;
                };
                $sandbox->call($sandboxThis, $this->getDb(), $phpFile);
            }
            $this->log('[' . (($currentMigrationNum * 100) / $numMigrations) . '%]');
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

            $migrationType = preg_match('/\.php$/', $file) ? 'php' : (preg_match('/\.sql$/', $file) ? 'sql' : null);
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