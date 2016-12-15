<?php

use metaunicorn\Pokedata\Csv\DbExporter;
use metaunicorn\Pokedata\Orm\Db;

/** @var \metaunicorn\Pokedata\App $app */
$app = include __DIR__ . DIRECTORY_SEPARATOR . '../bootstrap.php';

try {
    $app->getCli()->writeLn("Exporting temporary database into CSV files...");

    // We need to use the temporary (previously migrated) DB to export it to cleaned up CSV
    $app->setDb(Db::getInstance('tmp_db'));

    $dbExporter = new DbExporter($app->getPath('csv'), $app->getDb());
    $dbExporter->export();
    $app->getCli()->writeLn("DONE!");
} catch (\Exception $e) {
    $app->getCli()->setQuiet(false);
    $app->getCli()->writeLn("UNCAUGHT EXCEPTION:" . $e->getMessage());
    exit(1);
}

exit(0);