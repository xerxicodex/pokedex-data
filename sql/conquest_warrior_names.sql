CREATE TABLE IF NOT EXISTS conquest_warrior_names (
  `warrior_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_names_warrior_id` ON `conquest_warrior_names` (`warrior_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_names_local_language_id` ON `conquest_warrior_names` (`local_language_id`);
