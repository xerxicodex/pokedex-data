CREATE TABLE IF NOT EXISTS encounter_condition_prose (
  `encounter_condition_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
);

CREATE INDEX IF NOT EXISTS `idx_encounter_condition_prose_encounter_condition_id` ON `encounter_condition_prose` (`encounter_condition_id`);

CREATE INDEX IF NOT EXISTS `idx_encounter_condition_prose_local_language_id` ON `encounter_condition_prose` (`local_language_id`);
