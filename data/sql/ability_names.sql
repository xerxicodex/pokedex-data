CREATE TABLE IF NOT EXISTS ability_names (
  `ability_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
);

CREATE INDEX IF NOT EXISTS `idx_ability_names_ability_id` ON `ability_names` (`ability_id`);

CREATE INDEX IF NOT EXISTS `idx_ability_names_local_language_id` ON `ability_names` (`local_language_id`);
