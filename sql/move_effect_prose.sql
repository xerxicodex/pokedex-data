CREATE TABLE IF NOT EXISTS move_effect_prose (
  `move_effect_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `short_effect` VARCHAR (255),
  `effect` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_move_effect_prose_move_effect_id` ON `move_effect_prose` (`move_effect_id`);

CREATE INDEX IF NOT EXISTS `idx_move_effect_prose_local_language_id` ON `move_effect_prose` (`local_language_id`);
