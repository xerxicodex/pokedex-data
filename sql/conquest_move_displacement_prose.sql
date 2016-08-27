CREATE TABLE IF NOT EXISTS conquest_move_displacement_prose (
  `move_displacement_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255),
  `short_effect` VARCHAR (255),
  `effect` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_move_displacement_prose_move_displacement_id` ON `conquest_move_displacement_prose` (`move_displacement_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_move_displacement_prose_local_language_id` ON `conquest_move_displacement_prose` (`local_language_id`);
