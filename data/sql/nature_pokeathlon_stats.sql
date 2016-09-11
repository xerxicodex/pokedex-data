CREATE TABLE IF NOT EXISTS nature_pokeathlon_stats (
  `nature_id` INTEGER unsigned,
  `pokeathlon_stat_id` INTEGER unsigned,
  `max_change` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_nature_pokeathlon_stats_nature_id` ON `nature_pokeathlon_stats` (`nature_id`);

CREATE INDEX IF NOT EXISTS `idx_nature_pokeathlon_stats_pokeathlon_stat_id` ON `nature_pokeathlon_stats` (`pokeathlon_stat_id`);
