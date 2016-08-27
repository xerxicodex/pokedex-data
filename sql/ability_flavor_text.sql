CREATE TABLE IF NOT EXISTS ability_flavor_text (
  `ability_id` INTEGER unsigned,
  `version_group_id` INTEGER unsigned,
  `language_id` INTEGER unsigned,
  `flavor_text` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_ability_flavor_text_ability_id` ON `ability_flavor_text` (`ability_id`);

CREATE INDEX IF NOT EXISTS `idx_ability_flavor_text_version_group_id` ON `ability_flavor_text` (`version_group_id`);

CREATE INDEX IF NOT EXISTS `idx_ability_flavor_text_language_id` ON `ability_flavor_text` (`language_id`);
