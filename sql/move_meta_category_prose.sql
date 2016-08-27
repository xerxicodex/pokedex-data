CREATE TABLE IF NOT EXISTS move_meta_category_prose (
  `move_meta_category_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `description` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_move_meta_category_prose_move_meta_category_id` ON `move_meta_category_prose` (`move_meta_category_id`);

CREATE INDEX IF NOT EXISTS `idx_move_meta_category_prose_local_language_id` ON `move_meta_category_prose` (`local_language_id`);
