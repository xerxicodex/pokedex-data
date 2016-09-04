CREATE TABLE IF NOT EXISTS pokemon_stats (
  `pokemon_id` INTEGER unsigned,
  `stat_id` INTEGER unsigned,
  `base_stat` TEXT,
  `effort` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_stats_pokemon_id` ON `pokemon_stats` (`pokemon_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_stats_stat_id` ON `pokemon_stats` (`stat_id`);
