CREATE TABLE IF NOT EXISTS growth_rate_prose (
  `growth_rate_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255),
  PRIMARY KEY  (`growth_rate_id`,`local_language_id`)
);

CREATE INDEX IF NOT EXISTS `idx_growth_rate_prose_growth_rate_id` ON `growth_rate_prose` (`growth_rate_id`);

CREATE INDEX IF NOT EXISTS `idx_growth_rate_prose_local_language_id` ON `growth_rate_prose` (`local_language_id`);
