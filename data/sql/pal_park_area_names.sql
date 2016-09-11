CREATE TABLE IF NOT EXISTS pal_park_area_names (
  `pal_park_area_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pal_park_area_names_pal_park_area_id` ON `pal_park_area_names` (`pal_park_area_id`);

CREATE INDEX IF NOT EXISTS `idx_pal_park_area_names_local_language_id` ON `pal_park_area_names` (`local_language_id`);
