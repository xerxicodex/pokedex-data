CREATE TABLE IF NOT EXISTS item_pocket_names (
  `item_pocket_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_item_pocket_names_item_pocket_id` ON `item_pocket_names` (`item_pocket_id`);

CREATE INDEX IF NOT EXISTS `idx_item_pocket_names_local_language_id` ON `item_pocket_names` (`local_language_id`);
