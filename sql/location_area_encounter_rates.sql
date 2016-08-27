CREATE TABLE IF NOT EXISTS location_area_encounter_rates (
  `location_area_id` INTEGER unsigned,
  `encounter_method_id` INTEGER unsigned,
  `version_id` INTEGER unsigned,
  `rate` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_location_area_encounter_rates_location_area_id` ON `location_area_encounter_rates` (`location_area_id`);

CREATE INDEX IF NOT EXISTS `idx_location_area_encounter_rates_encounter_method_id` ON `location_area_encounter_rates` (`encounter_method_id`);

CREATE INDEX IF NOT EXISTS `idx_location_area_encounter_rates_version_id` ON `location_area_encounter_rates` (`version_id`);
