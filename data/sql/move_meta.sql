CREATE TABLE IF NOT EXISTS move_meta (
  `move_id` INTEGER unsigned,
  `meta_category_id` INTEGER unsigned,
  `meta_ailment_id` INTEGER unsigned,
  `min_hits` TEXT,
  `max_hits` TEXT,
  `min_turns` TEXT,
  `max_turns` TEXT,
  `drain` TEXT,
  `healing` TEXT,
  `crit_rate` TEXT,
  `ailment_chance` TEXT,
  `flinch_chance` TEXT,
  `stat_chance` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_move_meta_move_id` ON `move_meta` (`move_id`);

CREATE INDEX IF NOT EXISTS `idx_move_meta_meta_category_id` ON `move_meta` (`meta_category_id`);

CREATE INDEX IF NOT EXISTS `idx_move_meta_meta_ailment_id` ON `move_meta` (`meta_ailment_id`);
