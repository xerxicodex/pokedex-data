CREATE TABLE IF NOT EXISTS pokemon_shape_prose (
  `pokemon_shape_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255),
  `awesome_name` VARCHAR(255),
  `description` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokemon_shape_prose_pokemon_shape_id` ON `pokemon_shape_prose` (`pokemon_shape_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_shape_prose_local_language_id` ON `pokemon_shape_prose` (`local_language_id`);
