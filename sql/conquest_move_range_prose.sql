CREATE TABLE IF NOT EXISTS conquest_move_range_prose (
  `conquest_move_range_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255),
  `description` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_move_range_prose_conquest_move_range_id` ON `conquest_move_range_prose` (`conquest_move_range_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_move_range_prose_local_language_id` ON `conquest_move_range_prose` (`local_language_id`);
