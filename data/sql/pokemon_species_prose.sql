CREATE TABLE IF NOT EXISTS pokemon_species_prose (
  `pokemon_species_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `form_description` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokemon_species_prose_pokemon_species_id` ON `pokemon_species_prose` (`pokemon_species_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_prose_local_language_id` ON `pokemon_species_prose` (`local_language_id`);
