CREATE TABLE IF NOT EXISTS pokemon_species_flavor_text (
  `species_id` INTEGER unsigned,
  `version_id` INTEGER unsigned,
  `language_id` INTEGER unsigned,
  `flavor_text` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokemon_species_flavor_text_species_id` ON `pokemon_species_flavor_text` (`species_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_flavor_text_version_id` ON `pokemon_species_flavor_text` (`version_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_flavor_text_language_id` ON `pokemon_species_flavor_text` (`language_id`);
