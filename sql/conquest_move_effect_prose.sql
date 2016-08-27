CREATE TABLE IF NOT EXISTS conquest_move_effect_prose (
  `conquest_move_effect_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `short_effect` VARCHAR (255),
  `effect` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_move_effect_prose_conquest_move_effect_id` ON `conquest_move_effect_prose` (`conquest_move_effect_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_move_effect_prose_local_language_id` ON `conquest_move_effect_prose` (`local_language_id`);
