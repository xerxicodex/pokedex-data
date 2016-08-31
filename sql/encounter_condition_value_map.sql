CREATE TABLE IF NOT EXISTS encounter_condition_value_map (
  `encounter_id` INTEGER unsigned,
  `encounter_condition_value_id` INTEGER unsigned,
  PRIMARY KEY  (`encounter_id`,`encounter_condition_value_id`)
);

CREATE INDEX IF NOT EXISTS `idx_encounter_condition_value_map_encounter_id` ON `encounter_condition_value_map` (`encounter_id`);

CREATE INDEX IF NOT EXISTS `idx_encounter_condition_value_map_encounter_condition_value_id` ON `encounter_condition_value_map` (`encounter_condition_value_id`);
