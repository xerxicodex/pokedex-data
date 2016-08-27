CREATE TABLE IF NOT EXISTS conquest_warrior_ranks (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `warrior_id` INTEGER unsigned,
  `rank` VARCHAR (255),
  `skill_id` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_ranks_warrior_id` ON `conquest_warrior_ranks` (`warrior_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_ranks_skill_id` ON `conquest_warrior_ranks` (`skill_id`);
