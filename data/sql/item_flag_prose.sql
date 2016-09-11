CREATE TABLE IF NOT EXISTS item_flag_prose (
  `item_flag_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255),
  `description` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_item_flag_prose_item_flag_id` ON `item_flag_prose` (`item_flag_id`);

CREATE INDEX IF NOT EXISTS `idx_item_flag_prose_local_language_id` ON `item_flag_prose` (`local_language_id`);
