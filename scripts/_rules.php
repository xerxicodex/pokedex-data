<?php

/*
CSV column rules
'colName' => false --> exclude
'colName' => 'newColName' --> rename
*/

return [
    '*' => [ // global, for all tables
        'identifier' => 'codename'
    ],
    'pokemon_species' => [
        'conquest_order' => false
    ]
];