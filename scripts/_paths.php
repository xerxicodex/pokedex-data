<?php

$ds = DIRECTORY_SEPARATOR;

$tablePrefix = '';

$rootPath = realpath(__DIR__ . $ds . '..');
$srcPath = $rootPath . $ds . 'classes';

$tmpPath = $rootPath . $ds . 'tmp';
$dataPath = $rootPath . $ds . 'data';

$csvTmpPath = $tmpPath . $ds . 'csv';
$csvExportPath = $dataPath . $ds . 'csv';

$sqlTmpPath = false;
$sqlExportPath = $dataPath . $ds . 'sql';

$dbTmpFile = $tmpPath . $ds . 'database.sqlite';
$dbExportFile = $dataPath . $ds . 'database.sqlite';

$paths = [
    $tmpPath,
    $dataPath,
    $csvTmpPath,
    $csvExportPath,
    $sqlExportPath
];

foreach ($paths as $path) {
    if (!is_dir($path)) {
        mkdir($path, 0755, true);
    }
}