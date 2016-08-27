CREATE TABLE IF NOT EXISTS conquest_warrior_skill_names (
  `skill_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_skill_names_skill_id` ON `conquest_warrior_skill_names` (`skill_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_skill_names_local_language_id` ON `conquest_warrior_skill_names` (`local_language_id`);
