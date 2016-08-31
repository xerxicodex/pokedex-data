CREATE TABLE IF NOT EXISTS encounter_condition_values (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `encounter_condition_id` INTEGER unsigned,
  `identifier` VARCHAR (255),
  `is_default` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_encounter_condition_values_encounter_condition_id` ON `encounter_condition_values` (`encounter_condition_id`);
