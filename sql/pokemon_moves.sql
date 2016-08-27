CREATE TABLE IF NOT EXISTS pokemon_moves (
  `pokemon_id` INTEGER unsigned,
  `version_group_id` INTEGER unsigned,
  `move_id` INTEGER unsigned,
  `pokemon_move_method_id` INTEGER unsigned,
  `level` VARCHAR (255),
  `order` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_moves_pokemon_id` ON `pokemon_moves` (`pokemon_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_moves_version_group_id` ON `pokemon_moves` (`version_group_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_moves_move_id` ON `pokemon_moves` (`move_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_moves_pokemon_move_method_id` ON `pokemon_moves` (`pokemon_move_method_id`);
