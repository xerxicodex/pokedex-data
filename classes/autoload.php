<?php

$src_dir = __DIR__ . DIRECTORY_SEPARATOR . 'Pokedata' . DIRECTORY_SEPARATOR;

// PHP autoloader for classes under $src_dir
spl_autoload_register(function ($class) use ($src_dir) {
    $baseNamespace = "metaunicorn\\Pokedata\\";
    $namespaceRegex = "/^" . preg_quote($baseNamespace) . "/";
    if (preg_match($namespaceRegex, $class)) {
        $classFile = $src_dir .
            str_replace('\\', DIRECTORY_SEPARATOR, trim(preg_replace($namespaceRegex, '', $class), '\\')) . '.php';
        if (file_exists($classFile)) {
            require $classFile;
        }
    }
}, true, true);