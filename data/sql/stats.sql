CREATE TABLE IF NOT EXISTS stats (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `damage_class_id` INTEGER unsigned,
  `codename` VARCHAR(255),
  `is_battle_only` INTEGER unsigned,
  `game_index` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_stats_damage_class_id` ON `stats` (`damage_class_id`);
