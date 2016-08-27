CREATE TABLE IF NOT EXISTS item_names (
  `item_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_item_names_item_id` ON `item_names` (`item_id`);

CREATE INDEX IF NOT EXISTS `idx_item_names_local_language_id` ON `item_names` (`local_language_id`);
