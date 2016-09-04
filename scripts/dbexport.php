<?php

use metaunicorn\Pokedata\TableCsvExporter;

include_once __DIR__ . DIRECTORY_SEPARATOR . '_paths.php';

try {
    require_once $srcPath . $ds . "autoload.php";

    echo "Exporting temporary database into CSV files...\n";

    $pdo = new \PDO(
        'sqlite:' . $dbTmpFile, null, null,
        [\PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC]
    );

    $dbExporter = new TableCsvExporter($csvExportPath, $pdo);
    $dbExporter->export(null, $tablePrefix);

    echo "DONE!\n";
} catch (\Exception $e) {
    echo "UNCAUGHT EXCEPTION:" . $e->getMessage();
    exit(1);
}

exit(0);