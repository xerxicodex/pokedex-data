CREATE TABLE IF NOT EXISTS pokemon_move_method_prose (
  `pokemon_move_method_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255),
  `description` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_move_method_prose_pokemon_move_method_id` ON `pokemon_move_method_prose` (`pokemon_move_method_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_move_method_prose_local_language_id` ON `pokemon_move_method_prose` (`local_language_id`);
