CREATE TABLE IF NOT EXISTS contest_combos (
  `first_move_id` INTEGER unsigned,
  `second_move_id` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_contest_combos_first_move_id` ON `contest_combos` (`first_move_id`);

CREATE INDEX IF NOT EXISTS `idx_contest_combos_second_move_id` ON `contest_combos` (`second_move_id`);
