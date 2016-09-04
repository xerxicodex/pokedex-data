CREATE TABLE IF NOT EXISTS item_fling_effect_prose (
  `item_fling_effect_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `effect` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_item_fling_effect_prose_item_fling_effect_id` ON `item_fling_effect_prose` (`item_fling_effect_id`);

CREATE INDEX IF NOT EXISTS `idx_item_fling_effect_prose_local_language_id` ON `item_fling_effect_prose` (`local_language_id`);
