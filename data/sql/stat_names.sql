CREATE TABLE IF NOT EXISTS stat_names (
  `stat_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_stat_names_stat_id` ON `stat_names` (`stat_id`);

CREATE INDEX IF NOT EXISTS `idx_stat_names_local_language_id` ON `stat_names` (`local_language_id`);
