CREATE TABLE IF NOT EXISTS move_flag_prose (
  `move_flag_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255),
  `description` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_move_flag_prose_move_flag_id` ON `move_flag_prose` (`move_flag_id`);

CREATE INDEX IF NOT EXISTS `idx_move_flag_prose_local_language_id` ON `move_flag_prose` (`local_language_id`);
