CREATE TABLE IF NOT EXISTS type_game_indices (
  `type_id` INTEGER unsigned,
  `generation_id` INTEGER unsigned,
  `game_index` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_type_game_indices_type_id` ON `type_game_indices` (`type_id`);

CREATE INDEX IF NOT EXISTS `idx_type_game_indices_generation_id` ON `type_game_indices` (`generation_id`);
