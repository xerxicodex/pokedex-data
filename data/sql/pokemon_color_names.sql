CREATE TABLE IF NOT EXISTS pokemon_color_names (
  `pokemon_color_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_color_names_pokemon_color_id` ON `pokemon_color_names` (`pokemon_color_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_color_names_local_language_id` ON `pokemon_color_names` (`local_language_id`);
