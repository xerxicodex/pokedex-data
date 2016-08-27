CREATE TABLE IF NOT EXISTS conquest_move_data (
  `move_id` INTEGER unsigned,
  `power` VARCHAR (255),
  `accuracy` VARCHAR (255),
  `effect_chance` VARCHAR (255),
  `effect_id` INTEGER unsigned,
  `range_id` INTEGER unsigned,
  `displacement_id` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_conquest_move_data_move_id` ON `conquest_move_data` (`move_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_move_data_effect_id` ON `conquest_move_data` (`effect_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_move_data_range_id` ON `conquest_move_data` (`range_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_move_data_displacement_id` ON `conquest_move_data` (`displacement_id`);
