CREATE TABLE IF NOT EXISTS super_contest_combos (
  `first_move_id` INTEGER unsigned,
  `second_move_id` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_super_contest_combos_first_move_id` ON `super_contest_combos` (`first_move_id`);

CREATE INDEX IF NOT EXISTS `idx_super_contest_combos_second_move_id` ON `super_contest_combos` (`second_move_id`);
