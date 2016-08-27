CREATE TABLE IF NOT EXISTS location_area_prose (
  `location_area_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_location_area_prose_location_area_id` ON `location_area_prose` (`location_area_id`);

CREATE INDEX IF NOT EXISTS `idx_location_area_prose_local_language_id` ON `location_area_prose` (`local_language_id`);
