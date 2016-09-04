CREATE TABLE IF NOT EXISTS item_categories (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `pocket_id` INTEGER unsigned,
  `codename` VARCHAR(255)
);

CREATE INDEX IF NOT EXISTS `idx_item_categories_pocket_id` ON `item_categories` (`pocket_id`);
