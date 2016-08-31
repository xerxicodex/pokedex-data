CREATE TABLE IF NOT EXISTS item_flavor_summaries (
  `item_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `flavor_summary` VARCHAR (255),
  PRIMARY KEY  (`item_id`,`local_language_id`)
);

CREATE INDEX IF NOT EXISTS `idx_item_flavor_summaries_item_id` ON `item_flavor_summaries` (`item_id`);

CREATE INDEX IF NOT EXISTS `idx_item_flavor_summaries_local_language_id` ON `item_flavor_summaries` (`local_language_id`);
