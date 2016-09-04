CREATE TABLE IF NOT EXISTS nature_names (
  `nature_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
);

CREATE INDEX IF NOT EXISTS `idx_nature_names_nature_id` ON `nature_names` (`nature_id`);

CREATE INDEX IF NOT EXISTS `idx_nature_names_local_language_id` ON `nature_names` (`local_language_id`);
