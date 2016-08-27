CREATE TABLE IF NOT EXISTS move_target_prose (
  `move_target_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255),
  `description` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_move_target_prose_move_target_id` ON `move_target_prose` (`move_target_id`);

CREATE INDEX IF NOT EXISTS `idx_move_target_prose_local_language_id` ON `move_target_prose` (`local_language_id`);
