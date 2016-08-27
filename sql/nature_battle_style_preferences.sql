CREATE TABLE IF NOT EXISTS nature_battle_style_preferences (
  `nature_id` INTEGER unsigned,
  `move_battle_style_id` INTEGER unsigned,
  `low_hp_preference` VARCHAR (255),
  `high_hp_preference` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_nature_battle_style_preferences_nature_id` ON `nature_battle_style_preferences` (`nature_id`);

CREATE INDEX IF NOT EXISTS `idx_nature_battle_style_preferences_move_battle_style_id` ON `nature_battle_style_preferences` (`move_battle_style_id`);
