<?php

use metaunicorn\Pokedata\Migrator;

include_once __DIR__ . DIRECTORY_SEPARATOR . '_paths.php';

try {
    require_once $srcPath . $ds . "autoload.php";

    $pdo = new \PDO(
        'sqlite:' . $dbTmpFile, null, null,
        [\PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC]
    );

    echo "Optimizing and migrating the temporary SQLite database tables...\n";

    $migrator = new Migrator($pdo);

    $migrationsDir = __DIR__ . DIRECTORY_SEPARATOR . 'migrations';
    $migrationScripts = $migrator->findMigrations(__DIR__ . DIRECTORY_SEPARATOR . 'migrations');

    if ($migrator->migrate($migrationScripts, $migrationsDir)) {
        echo "DONE!\n";
    }else{
        echo "\n";
    }
} catch (\Exception $e) {
    echo "UNCAUGHT EXCEPTION:" . $e->getMessage();
    exit(1);
}

exit(0);