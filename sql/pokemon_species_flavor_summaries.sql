CREATE TABLE IF NOT EXISTS pokemon_species_flavor_summaries (
  `pokemon_species_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `flavor_summary` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_flavor_summaries_pokemon_species_id` ON `pokemon_species_flavor_summaries` (`pokemon_species_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_flavor_summaries_local_language_id` ON `pokemon_species_flavor_summaries` (`local_language_id`);
