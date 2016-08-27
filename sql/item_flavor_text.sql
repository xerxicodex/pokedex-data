CREATE TABLE IF NOT EXISTS item_flavor_text (
  `item_id` INTEGER unsigned,
  `version_group_id` INTEGER unsigned,
  `language_id` INTEGER unsigned,
  `flavor_text` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_item_flavor_text_item_id` ON `item_flavor_text` (`item_id`);

CREATE INDEX IF NOT EXISTS `idx_item_flavor_text_version_group_id` ON `item_flavor_text` (`version_group_id`);

CREATE INDEX IF NOT EXISTS `idx_item_flavor_text_language_id` ON `item_flavor_text` (`language_id`);
