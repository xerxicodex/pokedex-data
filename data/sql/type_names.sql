CREATE TABLE IF NOT EXISTS type_names (
  `type_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
);

CREATE INDEX IF NOT EXISTS `idx_type_names_type_id` ON `type_names` (`type_id`);

CREATE INDEX IF NOT EXISTS `idx_type_names_local_language_id` ON `type_names` (`local_language_id`);
