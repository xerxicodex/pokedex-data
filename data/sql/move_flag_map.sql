CREATE TABLE IF NOT EXISTS move_flag_map (
  `move_id` INTEGER unsigned,
  `move_flag_id` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_move_flag_map_move_id` ON `move_flag_map` (`move_id`);

CREATE INDEX IF NOT EXISTS `idx_move_flag_map_move_flag_id` ON `move_flag_map` (`move_flag_id`);
