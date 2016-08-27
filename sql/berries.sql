CREATE TABLE IF NOT EXISTS berries (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `item_id` INTEGER unsigned,
  `firmness_id` INTEGER unsigned,
  `natural_gift_power` VARCHAR (255),
  `natural_gift_type_id` INTEGER unsigned,
  `size` VARCHAR (255),
  `max_harvest` VARCHAR (255),
  `growth_time` VARCHAR (255),
  `soil_dryness` VARCHAR (255),
  `smoothness` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_berries_item_id` ON `berries` (`item_id`);

CREATE INDEX IF NOT EXISTS `idx_berries_firmness_id` ON `berries` (`firmness_id`);

CREATE INDEX IF NOT EXISTS `idx_berries_natural_gift_type_id` ON `berries` (`natural_gift_type_id`);
