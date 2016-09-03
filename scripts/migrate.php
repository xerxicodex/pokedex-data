<?php

/*
 * This script optimizes the original veekun/pokedex CSV data structure
 * by changing some of the CSV structures
 * so the databases importing the data directly will have better performance.
 */

use metaunicorn\Pokedata\CsvDbExporter;
use metaunicorn\Pokedata\CsvDbImporter;

$ds = DIRECTORY_SEPARATOR;

$rootPath = realpath(__DIR__ . $ds . '..');
$srcPath = $rootPath . $ds . 'src';

$tmpPath = $rootPath . $ds . 'tmp';
$originalCsvPath = $tmpPath . $ds . 'csv';
$csvExportPath = $rootPath . $ds . 'csv';
$sqlExportPath = $rootPath . $ds . 'sql';

$paths = [
    $tmpPath,
    $originalCsvPath,
    $csvExportPath,
    $sqlExportPath
];

foreach ($paths as $path) {
    if (!is_dir($path)) {
        mkdir($path, 0755, true);
    }
}

try {
    require_once $srcPath . $ds . "autoload.php";

    $pdo_tmp = new \PDO(
        'sqlite:' . $tmpPath . $ds . 'tmp_database.sqlite', null, null,
        [\PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC]
    );

    echo "Importing CSV into a temporary SQLite database...\n";
    $dbImporter = new CsvDbImporter($originalCsvPath, false, $pdo_tmp);
    $dbImporter->import();

    /*
    echo "Optimizing and migrating CSV data structure...\n";
    $dbExporter = new CsvDbExporter($csvExportPath, $pdo_tmp);
    $dbExporter->export();
    */

    /*
    $pdo = new \PDO(
        'sqlite:' . $tmpPath . $ds . 'database.sqlite', null, null,
        [\PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC]
    );

    echo "Importing the new CSV files...\n";
    $dbImporter = new CsvDbImporter($csvExportPath, $sqlExportPath, $pdo);
    $dbImporter->import();
    */

    echo "DONE!\n";
} catch (\Exception $e) {
    echo "UNCAUGHT EXCEPTION:" . $e->getMessage();
    exit(1);
}

exit(0);