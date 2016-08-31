CREATE TABLE IF NOT EXISTS contest_combos (
  `first_move_id` INTEGER unsigned,
  `second_move_id` INTEGER unsigned,
  PRIMARY KEY  (`first_move_id`,`second_move_id`)
);

CREATE INDEX IF NOT EXISTS `idx_contest_combos_first_move_id` ON `contest_combos` (`first_move_id`);

CREATE INDEX IF NOT EXISTS `idx_contest_combos_second_move_id` ON `contest_combos` (`second_move_id`);
