CREATE TABLE IF NOT EXISTS pokemon_types (
  `pokemon_id` INTEGER unsigned,
  `type_id` INTEGER unsigned,
  `slot` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokemon_types_pokemon_id` ON `pokemon_types` (`pokemon_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_types_type_id` ON `pokemon_types` (`type_id`);
