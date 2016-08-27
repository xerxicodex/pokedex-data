CREATE TABLE IF NOT EXISTS versions (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `version_group_id` INTEGER unsigned,
  `identifier` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_versions_version_group_id` ON `versions` (`version_group_id`);
