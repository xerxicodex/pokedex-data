CREATE TABLE IF NOT EXISTS move_names (
  `move_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_move_names_move_id` ON `move_names` (`move_id`);

CREATE INDEX IF NOT EXISTS `idx_move_names_local_language_id` ON `move_names` (`local_language_id`);
