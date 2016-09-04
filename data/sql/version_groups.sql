CREATE TABLE IF NOT EXISTS version_groups (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `codename` VARCHAR(255),
  `generation_id` INTEGER unsigned,
  `order` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_version_groups_generation_id` ON `version_groups` (`generation_id`);
