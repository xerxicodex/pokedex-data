CREATE TABLE IF NOT EXISTS conquest_episode_warriors (
  `episode_id` INTEGER unsigned,
  `warrior_id` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_conquest_episode_warriors_episode_id` ON `conquest_episode_warriors` (`episode_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_episode_warriors_warrior_id` ON `conquest_episode_warriors` (`warrior_id`);
