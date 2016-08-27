CREATE TABLE IF NOT EXISTS conquest_transformation_pokemon (
  `transformation_id` INTEGER unsigned,
  `pokemon_species_id` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_conquest_transformation_pokemon_transformation_id` ON `conquest_transformation_pokemon` (`transformation_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_transformation_pokemon_pokemon_species_id` ON `conquest_transformation_pokemon` (`pokemon_species_id`);
