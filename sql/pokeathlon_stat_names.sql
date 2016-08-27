CREATE TABLE IF NOT EXISTS pokeathlon_stat_names (
  `pokeathlon_stat_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_pokeathlon_stat_names_pokeathlon_stat_id` ON `pokeathlon_stat_names` (`pokeathlon_stat_id`);

CREATE INDEX IF NOT EXISTS `idx_pokeathlon_stat_names_local_language_id` ON `pokeathlon_stat_names` (`local_language_id`);
