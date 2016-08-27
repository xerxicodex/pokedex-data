CREATE TABLE IF NOT EXISTS move_flavor_summaries (
  `move_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `flavor_summary` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_move_flavor_summaries_move_id` ON `move_flavor_summaries` (`move_id`);

CREATE INDEX IF NOT EXISTS `idx_move_flavor_summaries_local_language_id` ON `move_flavor_summaries` (`local_language_id`);
