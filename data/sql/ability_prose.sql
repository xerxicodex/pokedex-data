CREATE TABLE IF NOT EXISTS ability_prose (
  `ability_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `short_effect` TEXT,
  `effect` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_ability_prose_ability_id` ON `ability_prose` (`ability_id`);

CREATE INDEX IF NOT EXISTS `idx_ability_prose_local_language_id` ON `ability_prose` (`local_language_id`);
