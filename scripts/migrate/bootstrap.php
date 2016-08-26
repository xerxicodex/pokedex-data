<?php

$ds = DIRECTORY_SEPARATOR;

require_once __DIR__ . $ds . 'autoload.php';

$rootPath = realpath(__DIR__ . $ds . '..' . $ds . '..');
$tmpPath = $rootPath . $ds . 'tmp';
$csvPath = $rootPath . $ds . 'csv';
$sqlPath = $rootPath . $ds . 'sql';

if(!is_dir($tmpPath)){
    echo "ERROR: The 'tmp' path does not exist. Run the 'reload' script first.\n";
    exit(1);
}

if(!is_dir($csvPath)){
    echo "ERROR: The 'csv' path does not exist. Run the 'reload' script first.\n";
    exit(1);
}

if(!is_dir($sqlPath)){
    echo "ERROR: The 'sql' path does not exist. Run the 'reload' script first.\n";
    exit(1);
}

$pdo = new \PDO(
    'sqlite:' . $tmpPath . $ds . 'database.sqlite', null, null,
    [\PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC]
);

return $pdo;