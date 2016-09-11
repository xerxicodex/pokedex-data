CREATE TABLE IF NOT EXISTS item_flag_map (
  `item_id` INTEGER unsigned,
  `item_flag_id` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_item_flag_map_item_id` ON `item_flag_map` (`item_id`);

CREATE INDEX IF NOT EXISTS `idx_item_flag_map_item_flag_id` ON `item_flag_map` (`item_flag_id`);
