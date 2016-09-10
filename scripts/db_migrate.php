<?php

use metaunicorn\Pokedata\Orm\Migrations\Migrator;
use metaunicorn\Pokedata\Orm\Db;

/** @var \metaunicorn\Pokedata\App $app */
$app = include __DIR__ . DIRECTORY_SEPARATOR . '../bootstrap.php';

try {
    $app->getCli()->writeLn("Optimizing and migrating the temporary SQLite database tables...");

    // We need to migrate/transform the temporary DB for later exporting it as cleaned up CSV
    $app->setDb(Db::getInstance('tmp_db'));

    $migrator         = new Migrator($app->getDb(), $app->getCli());
    $migrationsDir    = $app->getPath('migrations');
    $migrationScripts = $migrator->findMigrations($migrationsDir);

    if ($migrator->migrate($migrationScripts, $migrationsDir)) {
        $app->getCli()->writeLn("DONE!");
    } else {
        $app->getCli()->writeLn("");
    }
} catch (\Exception $e) {
    $app->getCli()->writeLn("UNCAUGHT EXCEPTION:" . $e->getMessage());
    exit(1);
}

exit(0);