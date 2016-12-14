<?php

$config = [
    'table_prefix' => '',
    'paths'        => [
        /* new or overridden paths */
    ]
];

/*
CSV column rules
'colName' => false --> exclude
'colName' => 'newColName' --> rename
*/
$config['csv_import_rules'] = [
    '*'               => [ // * = global, for all tables
        // Example: 'identifier' => 'shortname'
    ],
    'pokemon_species' => [
        'conquest_order' => false
    ]
];

return $config;