CREATE TABLE IF NOT EXISTS conquest_episode_names (
  `episode_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_episode_names_episode_id` ON `conquest_episode_names` (`episode_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_episode_names_local_language_id` ON `conquest_episode_names` (`local_language_id`);
