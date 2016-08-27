CREATE TABLE IF NOT EXISTS encounter_method_prose (
  `encounter_method_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_encounter_method_prose_encounter_method_id` ON `encounter_method_prose` (`encounter_method_id`);

CREATE INDEX IF NOT EXISTS `idx_encounter_method_prose_local_language_id` ON `encounter_method_prose` (`local_language_id`);
