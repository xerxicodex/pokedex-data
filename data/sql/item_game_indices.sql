CREATE TABLE IF NOT EXISTS item_game_indices (
  `item_id` INTEGER unsigned,
  `generation_id` INTEGER unsigned,
  `game_index` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_item_game_indices_item_id` ON `item_game_indices` (`item_id`);

CREATE INDEX IF NOT EXISTS `idx_item_game_indices_generation_id` ON `item_game_indices` (`generation_id`);
