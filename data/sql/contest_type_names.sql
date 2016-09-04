CREATE TABLE IF NOT EXISTS contest_type_names (
  `contest_type_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255),
  `flavor` TEXT,
  `color` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_contest_type_names_contest_type_id` ON `contest_type_names` (`contest_type_id`);

CREATE INDEX IF NOT EXISTS `idx_contest_type_names_local_language_id` ON `contest_type_names` (`local_language_id`);
