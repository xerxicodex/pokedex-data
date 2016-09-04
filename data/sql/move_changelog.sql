CREATE TABLE IF NOT EXISTS move_changelog (
  `move_id` INTEGER unsigned,
  `changed_in_version_group_id` INTEGER unsigned,
  `type_id` INTEGER unsigned,
  `power` TEXT,
  `pp` TEXT,
  `accuracy` TEXT,
  `effect_id` INTEGER unsigned,
  `effect_chance` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_move_changelog_move_id` ON `move_changelog` (`move_id`);

CREATE INDEX IF NOT EXISTS `idx_move_changelog_changed_in_version_group_id` ON `move_changelog` (`changed_in_version_group_id`);

CREATE INDEX IF NOT EXISTS `idx_move_changelog_type_id` ON `move_changelog` (`type_id`);

CREATE INDEX IF NOT EXISTS `idx_move_changelog_effect_id` ON `move_changelog` (`effect_id`);
