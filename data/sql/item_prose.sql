CREATE TABLE IF NOT EXISTS item_prose (
  `item_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `short_effect` TEXT,
  `effect` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_item_prose_item_id` ON `item_prose` (`item_id`);

CREATE INDEX IF NOT EXISTS `idx_item_prose_local_language_id` ON `item_prose` (`local_language_id`);
