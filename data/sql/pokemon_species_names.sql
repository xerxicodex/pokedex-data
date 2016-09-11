CREATE TABLE IF NOT EXISTS pokemon_species_names (
  `pokemon_species_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255),
  `genus` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokemon_species_names_pokemon_species_id` ON `pokemon_species_names` (`pokemon_species_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_names_local_language_id` ON `pokemon_species_names` (`local_language_id`);
