CREATE TABLE IF NOT EXISTS stats (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `damage_class_id` INTEGER unsigned,
  `identifier` VARCHAR (255),
  `is_battle_only` VARCHAR (255),
  `game_index` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_stats_damage_class_id` ON `stats` (`damage_class_id`);
