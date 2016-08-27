CREATE TABLE IF NOT EXISTS location_game_indices (
  `location_id` INTEGER unsigned,
  `generation_id` INTEGER unsigned,
  `game_index` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_location_game_indices_location_id` ON `location_game_indices` (`location_id`);

CREATE INDEX IF NOT EXISTS `idx_location_game_indices_generation_id` ON `location_game_indices` (`generation_id`);
