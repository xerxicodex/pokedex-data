CREATE TABLE IF NOT EXISTS berries (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `item_id` INTEGER unsigned,
  `firmness_id` INTEGER unsigned,
  `natural_gift_power` INTEGER unsigned,
  `natural_gift_type_id` INTEGER unsigned,
  `size` INTEGER unsigned,
  `max_harvest` INTEGER unsigned,
  `growth_time` INTEGER unsigned,
  `soil_dryness` INTEGER unsigned,
  `smoothness` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_berries_item_id` ON `berries` (`item_id`);

CREATE INDEX IF NOT EXISTS `idx_berries_firmness_id` ON `berries` (`firmness_id`);

CREATE INDEX IF NOT EXISTS `idx_berries_natural_gift_type_id` ON `berries` (`natural_gift_type_id`);
