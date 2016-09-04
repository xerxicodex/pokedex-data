CREATE TABLE IF NOT EXISTS move_battle_style_prose (
  `move_battle_style_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
);

CREATE INDEX IF NOT EXISTS `idx_move_battle_style_prose_move_battle_style_id` ON `move_battle_style_prose` (`move_battle_style_id`);

CREATE INDEX IF NOT EXISTS `idx_move_battle_style_prose_local_language_id` ON `move_battle_style_prose` (`local_language_id`);
