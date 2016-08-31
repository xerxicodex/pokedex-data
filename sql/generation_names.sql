CREATE TABLE IF NOT EXISTS generation_names (
  `generation_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255),
  PRIMARY KEY  (`generation_id`,`local_language_id`)
);

CREATE INDEX IF NOT EXISTS `idx_generation_names_generation_id` ON `generation_names` (`generation_id`);

CREATE INDEX IF NOT EXISTS `idx_generation_names_local_language_id` ON `generation_names` (`local_language_id`);
