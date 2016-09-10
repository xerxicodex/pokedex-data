<?php

use metaunicorn\Pokedata\App;
use metaunicorn\Pokedata\Orm\Db;

require_once __DIR__ . DIRECTORY_SEPARATOR . "autoload.php";

$rootPath = realpath(__DIR__);
$config   = include __DIR__ . DIRECTORY_SEPARATOR . 'config.php';

$app = new App($rootPath, $config);

$pdoOptions  = [\PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC];
$tablePrefix = $app->getConfig('table_prefix', '');

Db::setInstance(Db::createInstance(
    'sqlite:' . $app->getPath('db'), null, null,
    $pdoOptions, $tablePrefix
), 'db');

Db::setInstance(Db::createInstance(
    'sqlite:' . $app->getPath('tmp_db'), null, null,
    $pdoOptions, $tablePrefix
), 'tmp_db');

return $app;