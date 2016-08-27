CREATE TABLE IF NOT EXISTS conquest_kingdom_names (
  `kingdom_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_kingdom_names_kingdom_id` ON `conquest_kingdom_names` (`kingdom_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_kingdom_names_local_language_id` ON `conquest_kingdom_names` (`local_language_id`);
