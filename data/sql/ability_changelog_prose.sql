CREATE TABLE IF NOT EXISTS ability_changelog_prose (
  `ability_changelog_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `effect` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_ability_changelog_prose_ability_changelog_id` ON `ability_changelog_prose` (`ability_changelog_id`);

CREATE INDEX IF NOT EXISTS `idx_ability_changelog_prose_local_language_id` ON `ability_changelog_prose` (`local_language_id`);
