CREATE TABLE IF NOT EXISTS pokemon_items (
  `pokemon_id` INTEGER unsigned,
  `version_id` INTEGER unsigned,
  `item_id` INTEGER unsigned,
  `rarity` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokemon_items_pokemon_id` ON `pokemon_items` (`pokemon_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_items_version_id` ON `pokemon_items` (`version_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_items_item_id` ON `pokemon_items` (`item_id`);
