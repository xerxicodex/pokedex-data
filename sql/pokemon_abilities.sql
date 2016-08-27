CREATE TABLE IF NOT EXISTS pokemon_abilities (
  `pokemon_id` INTEGER unsigned,
  `ability_id` INTEGER unsigned,
  `is_hidden` VARCHAR (255),
  `slot` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_abilities_pokemon_id` ON `pokemon_abilities` (`pokemon_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_abilities_ability_id` ON `pokemon_abilities` (`ability_id`);
