CREATE TABLE IF NOT EXISTS conquest_warrior_rank_stat_map (
  `warrior_rank_id` INTEGER unsigned,
  `warrior_stat_id` INTEGER unsigned,
  `base_stat` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_rank_stat_map_warrior_rank_id` ON `conquest_warrior_rank_stat_map` (`warrior_rank_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_rank_stat_map_warrior_stat_id` ON `conquest_warrior_rank_stat_map` (`warrior_stat_id`);
