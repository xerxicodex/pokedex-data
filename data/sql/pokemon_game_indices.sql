CREATE TABLE IF NOT EXISTS pokemon_game_indices (
  `pokemon_id` INTEGER unsigned,
  `version_id` INTEGER unsigned,
  `game_index` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_game_indices_pokemon_id` ON `pokemon_game_indices` (`pokemon_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_game_indices_version_id` ON `pokemon_game_indices` (`version_id`);
