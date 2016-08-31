CREATE TABLE IF NOT EXISTS evolution_trigger_prose (
  `evolution_trigger_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255),
  PRIMARY KEY  (`evolution_trigger_id`,`local_language_id`)
);

CREATE INDEX IF NOT EXISTS `idx_evolution_trigger_prose_evolution_trigger_id` ON `evolution_trigger_prose` (`evolution_trigger_id`);

CREATE INDEX IF NOT EXISTS `idx_evolution_trigger_prose_local_language_id` ON `evolution_trigger_prose` (`local_language_id`);
