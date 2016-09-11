CREATE TABLE IF NOT EXISTS item_category_prose (
  `item_category_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_item_category_prose_item_category_id` ON `item_category_prose` (`item_category_id`);

CREATE INDEX IF NOT EXISTS `idx_item_category_prose_local_language_id` ON `item_category_prose` (`local_language_id`);
