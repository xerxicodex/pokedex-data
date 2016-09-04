CREATE TABLE IF NOT EXISTS ability_changelog (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `ability_id` INTEGER unsigned,
  `changed_in_version_group_id` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_ability_changelog_ability_id` ON `ability_changelog` (`ability_id`);

CREATE INDEX IF NOT EXISTS `idx_ability_changelog_changed_in_version_group_id` ON `ability_changelog` (`changed_in_version_group_id`);
