CREATE TABLE IF NOT EXISTS move_meta_ailment_names (
  `move_meta_ailment_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
);

CREATE INDEX IF NOT EXISTS `idx_move_meta_ailment_names_move_meta_ailment_id` ON `move_meta_ailment_names` (`move_meta_ailment_id`);

CREATE INDEX IF NOT EXISTS `idx_move_meta_ailment_names_local_language_id` ON `move_meta_ailment_names` (`local_language_id`);
