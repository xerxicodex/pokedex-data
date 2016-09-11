CREATE TABLE IF NOT EXISTS pokemon_dex_numbers (
  `species_id` INTEGER unsigned,
  `pokedex_id` INTEGER unsigned,
  `pokedex_number` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokemon_dex_numbers_species_id` ON `pokemon_dex_numbers` (`species_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_dex_numbers_pokedex_id` ON `pokemon_dex_numbers` (`pokedex_id`);
