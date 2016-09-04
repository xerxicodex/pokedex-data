CREATE TABLE IF NOT EXISTS location_names (
  `location_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
);

CREATE INDEX IF NOT EXISTS `idx_location_names_location_id` ON `location_names` (`location_id`);

CREATE INDEX IF NOT EXISTS `idx_location_names_local_language_id` ON `location_names` (`local_language_id`);
