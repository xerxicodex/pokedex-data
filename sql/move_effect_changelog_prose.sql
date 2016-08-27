CREATE TABLE IF NOT EXISTS move_effect_changelog_prose (
  `move_effect_changelog_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `effect` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_move_effect_changelog_prose_move_effect_changelog_id` ON `move_effect_changelog_prose` (`move_effect_changelog_id`);

CREATE INDEX IF NOT EXISTS `idx_move_effect_changelog_prose_local_language_id` ON `move_effect_changelog_prose` (`local_language_id`);
