<?php

namespace metaunicorn\Pokedata\Orm\Migrations;

use metaunicorn\Pokedata\Behaviors\CliAware;
use metaunicorn\Pokedata\Behaviors\DbAware;
use metaunicorn\Pokedata\Cli;
use metaunicorn\Pokedata\Orm\Db;

/**
 * Runs all migrations under the migrations directory
 * TODO: migrations table to know which ones need to be executed
 * and to detect corrupted/non sequential migrations
 */
class Migrator
{
    use CliAware;
    use DbAware;

    public function __construct(Db $db, Cli $cli = null)
    {
        $this->setDb($db);
        $this->setCli($cli);
    }

    public function migrate(array $migrationFiles, $migrationsDir)
    {
        $migrationsDir = rtrim($migrationsDir, DIRECTORY_SEPARATOR);
        $migrations    = $this->prepareMigrations($migrationFiles);
        $sandboxThis   = new \stdClass();

        if (empty($migrations)) {
            $this->getCli()->writeLn("Nothing to migrate. Skipping...");

            return false;
        }

        $numMigrations       = count($migrations);
        $currentMigrationNum = 0;

        foreach ($migrations as $migrationName => $migration) {
            $currentMigrationNum++;
            $migrationTitle = explode('_', $migrationName, 2);
            $migrationTitle = ucwords(implode(' ', preg_split('/(?=[A-Z])/', array_pop($migrationTitle))));

            if ($migration['sql'] !== false) {
                $sqlFile   = $migrationsDir . DIRECTORY_SEPARATOR . $migration['sql'];
                $sqlScript = trim(file_get_contents($sqlFile));
                if (strlen($sqlScript)) {
                    $this->getCli()->write("RUNNING '${migrationTitle}' SQL migration script...");

                    $result = $this->getDb()->transactional(function () use ($sqlScript) {
                        return $this->getDb()->execute($sqlScript);
                    });

                    if ($result === false) {
                        $this->getCli()->writeLn(PHP_EOL . "ERROR in '${migrationTitle}' SQL migration script... ABORTING.");
                        exit(1);
                    } elseif (is_int($result)) {
                        $this->getCli()->writeLn("Affected rows: " . strval($result));
                    } else {
                        $this->getCli()->writeLn("Unexpected result: " . print_r($result, true));
                    }
                } else {
                    $this->getCli()->writeLn("SKIPPING empty '${migrationTitle}' SQL migration script...");
                }
            }
            if ($migration['php'] !== false) {
                $phpFile = $migrationsDir . DIRECTORY_SEPARATOR . $migration['php'];
                $this->getCli()->writeLn("RUNNING '${migrationTitle}' PHP migration script...");

                // Isolate the script execution, but expose the PDO connection
                $sandbox = function ($db, $script) {
                    include $script;
                };
                $sandbox->call($sandboxThis, $this->getDb(), $phpFile);
            }
            $this->getCli()->writeLn('[' . (($currentMigrationNum * 100) / $numMigrations) . '%]');
        }

        return true;
    }

    public function findMigrations($directory)
    {
        $files = array_values(array_filter(scandir($directory), function ($path) use ($directory) {
            return (
                // Check it's not a dir
                (
                    ($path != '.')
                    && ($path != '..')
                    && ! is_dir($directory . DIRECTORY_SEPARATOR . $path)
                )
                // Check extension
                && preg_match('/(\.php|\.sql)$/', $path)
            );
        }));
        sort($files);

        return $files;
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
            if ( ! isset($migrations[$migrationName])) {
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