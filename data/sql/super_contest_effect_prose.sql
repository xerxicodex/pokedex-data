CREATE TABLE IF NOT EXISTS super_contest_effect_prose (
  `super_contest_effect_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `flavor_text` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_super_contest_effect_prose_super_contest_effect_id` ON `super_contest_effect_prose` (`super_contest_effect_id`);

CREATE INDEX IF NOT EXISTS `idx_super_contest_effect_prose_local_language_id` ON `super_contest_effect_prose` (`local_language_id`);
