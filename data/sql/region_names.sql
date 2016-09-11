CREATE TABLE IF NOT EXISTS region_names (
  `region_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_region_names_region_id` ON `region_names` (`region_id`);

CREATE INDEX IF NOT EXISTS `idx_region_names_local_language_id` ON `region_names` (`local_language_id`);
