CREATE TABLE IF NOT EXISTS move_meta_stat_changes (
  `move_id` INTEGER unsigned,
  `stat_id` INTEGER unsigned,
  `change` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_move_meta_stat_changes_move_id` ON `move_meta_stat_changes` (`move_id`);

CREATE INDEX IF NOT EXISTS `idx_move_meta_stat_changes_stat_id` ON `move_meta_stat_changes` (`stat_id`);
