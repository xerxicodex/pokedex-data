CREATE TABLE IF NOT EXISTS move_flavor_text (
  `move_id` INTEGER unsigned,
  `version_group_id` INTEGER unsigned,
  `language_id` INTEGER unsigned,
  `flavor_text` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_move_flavor_text_move_id` ON `move_flavor_text` (`move_id`);

CREATE INDEX IF NOT EXISTS `idx_move_flavor_text_version_group_id` ON `move_flavor_text` (`version_group_id`);

CREATE INDEX IF NOT EXISTS `idx_move_flavor_text_language_id` ON `move_flavor_text` (`language_id`);
