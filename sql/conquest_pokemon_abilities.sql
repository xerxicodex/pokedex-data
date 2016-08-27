CREATE TABLE IF NOT EXISTS conquest_pokemon_abilities (
  `pokemon_species_id` INTEGER unsigned,
  `slot` VARCHAR (255),
  `ability_id` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_conquest_pokemon_abilities_pokemon_species_id` ON `conquest_pokemon_abilities` (`pokemon_species_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_pokemon_abilities_ability_id` ON `conquest_pokemon_abilities` (`ability_id`);
