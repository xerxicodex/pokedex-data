CREATE TABLE IF NOT EXISTS berries (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `item_id` INTEGER unsigned,
  `firmness_id` INTEGER unsigned,
  `natural_gift_power` TEXT,
  `natural_gift_type_id` INTEGER unsigned,
  `size` TEXT,
  `max_harvest` TEXT,
  `growth_time` TEXT,
  `soil_dryness` TEXT,
  `smoothness` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_berries_item_id` ON `berries` (`item_id`);

CREATE INDEX IF NOT EXISTS `idx_berries_firmness_id` ON `berries` (`firmness_id`);

CREATE INDEX IF NOT EXISTS `idx_berries_natural_gift_type_id` ON `berries` (`natural_gift_type_id`);
