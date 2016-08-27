CREATE TABLE IF NOT EXISTS move_meta (
  `move_id` INTEGER unsigned,
  `meta_category_id` INTEGER unsigned,
  `meta_ailment_id` INTEGER unsigned,
  `min_hits` VARCHAR (255),
  `max_hits` VARCHAR (255),
  `min_turns` VARCHAR (255),
  `max_turns` VARCHAR (255),
  `drain` VARCHAR (255),
  `healing` VARCHAR (255),
  `crit_rate` VARCHAR (255),
  `ailment_chance` VARCHAR (255),
  `flinch_chance` VARCHAR (255),
  `stat_chance` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_move_meta_move_id` ON `move_meta` (`move_id`);

CREATE INDEX IF NOT EXISTS `idx_move_meta_meta_category_id` ON `move_meta` (`meta_category_id`);

CREATE INDEX IF NOT EXISTS `idx_move_meta_meta_ailment_id` ON `move_meta` (`meta_ailment_id`);
