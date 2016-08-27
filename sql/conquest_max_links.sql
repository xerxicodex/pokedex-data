CREATE TABLE IF NOT EXISTS conquest_max_links (
  `warrior_rank_id` INTEGER unsigned,
  `pokemon_species_id` INTEGER unsigned,
  `max_link` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_max_links_warrior_rank_id` ON `conquest_max_links` (`warrior_rank_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_max_links_pokemon_species_id` ON `conquest_max_links` (`pokemon_species_id`);
