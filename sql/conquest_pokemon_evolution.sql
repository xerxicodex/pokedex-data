CREATE TABLE IF NOT EXISTS conquest_pokemon_evolution (
  `evolved_species_id` INTEGER unsigned,
  `required_stat_id` INTEGER unsigned,
  `minimum_stat` VARCHAR (255),
  `minimum_link` VARCHAR (255),
  `kingdom_id` INTEGER unsigned,
  `warrior_gender_id` INTEGER unsigned,
  `item_id` INTEGER unsigned,
  `recruiting_ko_required` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_pokemon_evolution_evolved_species_id` ON `conquest_pokemon_evolution` (`evolved_species_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_pokemon_evolution_required_stat_id` ON `conquest_pokemon_evolution` (`required_stat_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_pokemon_evolution_kingdom_id` ON `conquest_pokemon_evolution` (`kingdom_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_pokemon_evolution_warrior_gender_id` ON `conquest_pokemon_evolution` (`warrior_gender_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_pokemon_evolution_item_id` ON `conquest_pokemon_evolution` (`item_id`);
