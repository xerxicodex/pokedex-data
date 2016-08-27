CREATE TABLE IF NOT EXISTS conquest_pokemon_moves (
  `pokemon_species_id` INTEGER unsigned,
  `move_id` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_conquest_pokemon_moves_pokemon_species_id` ON `conquest_pokemon_moves` (`pokemon_species_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_pokemon_moves_move_id` ON `conquest_pokemon_moves` (`move_id`);
