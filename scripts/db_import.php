<?php

use metaunicorn\Pokedata\Csv\DbImporter;
use metaunicorn\Pokedata\Orm\Db;

/** @var \metaunicorn\Pokedata\App $app */
$app = include __DIR__ . DIRECTORY_SEPARATOR . '../bootstrap.php';

try {
    if ($app->getCli()->getOption('tmp') === true) {
        // IMPORTING ORIGINAL CSVs into the temporary DB
        $app->setDb(Db::getInstance('tmp_db'));
        $mute        = false;
        $message     = "Importing original CSV files into a temporary SQLite database...";
        $csvPath     = $app->getPath('tmp_csv');
        $sqlPath     = $app->getPath('tmp_sql');
        $columnRules = $app->getConfig('csv_import_rules', []);
    } else {
        // IMPORTING migrated CSVs into a new DB
        $app->setDb(Db::getInstance('db'));
        $mute        = true;
        $message     = "Importing migrated CSV files into a new SQLite database...";
        $csvPath     = $app->getPath('csv');
        $sqlPath     = $app->getPath('sql');
        $columnRules = [];
    }
    $app->getCli()->writeLn($message);
    $app->getCli()->setQuiet($mute);

    // Set proper encoding before writing anything to the SQLite DB
    $app->getDb()->execute('PRAGMA encoding = "UTF-8";');

    $maxBulkInserts = 10;
    $dbImporter = new DbImporter($csvPath, $sqlPath, $app->getDb());
    $dbImporter->getCli()->setQuiet($mute);
    $dbImporter->import(null, $columnRules, $maxBulkInserts);
    $app->getCli()->writeLn("DONE!");
} catch (\Exception $e) {
    $app->getCli()->setQuiet(false);
    $app->getCli()->writeLn("UNCAUGHT EXCEPTION:" . $e->getMessage());
    exit(1);
}

exit(0);