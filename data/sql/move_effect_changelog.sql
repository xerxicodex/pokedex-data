CREATE TABLE IF NOT EXISTS move_effect_changelog (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `effect_id` INTEGER unsigned,
  `changed_in_version_group_id` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_move_effect_changelog_effect_id` ON `move_effect_changelog` (`effect_id`);

CREATE INDEX IF NOT EXISTS `idx_move_effect_changelog_changed_in_version_group_id` ON `move_effect_changelog` (`changed_in_version_group_id`);
