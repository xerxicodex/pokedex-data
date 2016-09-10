-- Removes the non main-series abilities from the database

DELETE FROM pokemon_abilities WHERE ability_id IN (SELECT id FROM abilities WHERE is_main_series=0);

DELETE FROM ability_changelog WHERE ability_id IN (SELECT id FROM abilities WHERE is_main_series=0);
DELETE FROM ability_flavor_text WHERE ability_id IN (SELECT id FROM abilities WHERE is_main_series=0);
DELETE FROM ability_names WHERE ability_id IN (SELECT id FROM abilities WHERE is_main_series=0);
DELETE FROM ability_prose WHERE ability_id IN (SELECT id FROM abilities WHERE is_main_series=0);

-- This should be the last thing to be deleted, because of the previously required sub-queries
DELETE FROM abilities WHERE is_main_series=0;