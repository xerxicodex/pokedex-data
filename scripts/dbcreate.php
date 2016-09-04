<?php

use metaunicorn\Pokedata\TableCsvImporter;

include_once __DIR__ . DIRECTORY_SEPARATOR . '_paths.php';

if (isset($argv[1]) && strtolower($argv[1]) == '--tmp') {
    $message = "Importing original CSV files into a temporary SQLite database...\n";
    $dbFile = $dbTmpFile;
    $csvPath = $csvTmpPath;
    $sqlPath = $sqlTmpPath; // do not cache table schema SQL files
    $verbose = true;
} else {
    $message = "Importing migrated CSV files into a new SQLite database...\n";
    $dbFile = $dbExportFile;
    $csvPath = $csvExportPath;
    $sqlPath = $sqlExportPath;
    $verbose = false;
}
try {
    require_once $srcPath . $ds . "autoload.php";

    $pdo = new \PDO(
        'sqlite:' . $dbFile, null, null,
        [\PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC]
    );

    echo $message;

    $dbImporter = new TableCsvImporter($csvPath, $sqlPath, $pdo);
    $dbImporter->setVerbose($verbose);
    $dbImporter->import(null, $tablePrefix, 250);

    echo "DONE!\n";
} catch (\Exception $e) {
    echo "UNCAUGHT EXCEPTION:" . $e->getMessage();
    exit(1);
}

exit(0);