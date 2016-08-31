CREATE TABLE IF NOT EXISTS item_prose (
  `item_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `short_effect` VARCHAR (255),
  `effect` VARCHAR (255),
  PRIMARY KEY  (`item_id`,`local_language_id`)
);

CREATE INDEX IF NOT EXISTS `idx_item_prose_item_id` ON `item_prose` (`item_id`);

CREATE INDEX IF NOT EXISTS `idx_item_prose_local_language_id` ON `item_prose` (`local_language_id`);
