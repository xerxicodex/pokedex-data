CREATE TABLE IF NOT EXISTS natures (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `codename` VARCHAR(255),
  `decreased_stat_id` INTEGER unsigned,
  `increased_stat_id` INTEGER unsigned,
  `hates_flavor_id` INTEGER unsigned,
  `likes_flavor_id` INTEGER unsigned,
  `game_index` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_natures_decreased_stat_id` ON `natures` (`decreased_stat_id`);

CREATE INDEX IF NOT EXISTS `idx_natures_increased_stat_id` ON `natures` (`increased_stat_id`);

CREATE INDEX IF NOT EXISTS `idx_natures_hates_flavor_id` ON `natures` (`hates_flavor_id`);

CREATE INDEX IF NOT EXISTS `idx_natures_likes_flavor_id` ON `natures` (`likes_flavor_id`);
