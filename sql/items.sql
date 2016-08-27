CREATE TABLE IF NOT EXISTS items (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `identifier` VARCHAR (255),
  `category_id` INTEGER unsigned,
  `cost` VARCHAR (255),
  `fling_power` VARCHAR (255),
  `fling_effect_id` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_items_category_id` ON `items` (`category_id`);

CREATE INDEX IF NOT EXISTS `idx_items_fling_effect_id` ON `items` (`fling_effect_id`);
