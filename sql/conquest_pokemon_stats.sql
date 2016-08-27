CREATE TABLE IF NOT EXISTS conquest_pokemon_stats (
  `pokemon_species_id` INTEGER unsigned,
  `conquest_stat_id` INTEGER unsigned,
  `base_stat` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_pokemon_stats_pokemon_species_id` ON `conquest_pokemon_stats` (`pokemon_species_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_pokemon_stats_conquest_stat_id` ON `conquest_pokemon_stats` (`conquest_stat_id`);
