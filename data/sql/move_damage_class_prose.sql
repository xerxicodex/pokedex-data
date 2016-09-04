CREATE TABLE IF NOT EXISTS move_damage_class_prose (
  `move_damage_class_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255),
  `description` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_move_damage_class_prose_move_damage_class_id` ON `move_damage_class_prose` (`move_damage_class_id`);

CREATE INDEX IF NOT EXISTS `idx_move_damage_class_prose_local_language_id` ON `move_damage_class_prose` (`local_language_id`);
