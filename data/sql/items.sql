CREATE TABLE IF NOT EXISTS items (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `codename` VARCHAR(255),
  `category_id` INTEGER unsigned,
  `cost` TEXT,
  `fling_power` TEXT,
  `fling_effect_id` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_items_category_id` ON `items` (`category_id`);

CREATE INDEX IF NOT EXISTS `idx_items_fling_effect_id` ON `items` (`fling_effect_id`);
