<?php

/*
 * This script optimizes the original veekun/pokedex CSV data structure
 * by changing some of the CSV structures
 * so the databases importing the data directly will have better performance.
 */

use metaunicorn\Pokedata\CsvDbExporter;
use metaunicorn\Pokedata\CsvDbImporter;

$ds = DIRECTORY_SEPARATOR;

try {
    $pdo = include __DIR__ . $ds . 'migrate' . $ds . 'bootstrap.php';

    echo "Importing CSV into a temporary SQLite database...\n";
    $dbImporter = new CsvDbImporter($csvPath, $pdo);
    $dbImporter->import();

    echo "Optimizing data structure of CSV files...\n";
    $dbExporter = new CsvDbExporter($csvPath, $pdo);
    $dbExporter->export();

    echo "DONE!\n";
} catch (\Exception $e) {
    echo "UNCAUGHT EXCEPTION:" . $e->getMessage();
    exit(1);
}

exit(0);