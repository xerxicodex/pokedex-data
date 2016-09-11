CREATE TABLE IF NOT EXISTS encounter_condition_value_prose (
  `encounter_condition_value_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_encounter_condition_value_prose_encounter_condition_value_id` ON `encounter_condition_value_prose` (`encounter_condition_value_id`);

CREATE INDEX IF NOT EXISTS `idx_encounter_condition_value_prose_local_language_id` ON `encounter_condition_value_prose` (`local_language_id`);
