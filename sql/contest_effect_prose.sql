CREATE TABLE IF NOT EXISTS contest_effect_prose (
  `contest_effect_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `flavor_text` VARCHAR (255),
  `effect` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_contest_effect_prose_contest_effect_id` ON `contest_effect_prose` (`contest_effect_id`);

CREATE INDEX IF NOT EXISTS `idx_contest_effect_prose_local_language_id` ON `contest_effect_prose` (`local_language_id`);
