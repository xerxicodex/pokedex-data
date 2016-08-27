CREATE TABLE IF NOT EXISTS conquest_stat_names (
  `conquest_stat_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_stat_names_conquest_stat_id` ON `conquest_stat_names` (`conquest_stat_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_stat_names_local_language_id` ON `conquest_stat_names` (`local_language_id`);
