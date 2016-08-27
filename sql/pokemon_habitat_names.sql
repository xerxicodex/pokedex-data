CREATE TABLE IF NOT EXISTS pokemon_habitat_names (
  `pokemon_habitat_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_habitat_names_pokemon_habitat_id` ON `pokemon_habitat_names` (`pokemon_habitat_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_habitat_names_local_language_id` ON `pokemon_habitat_names` (`local_language_id`);
