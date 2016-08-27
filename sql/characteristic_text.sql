CREATE TABLE IF NOT EXISTS characteristic_text (
  `characteristic_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `message` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_characteristic_text_characteristic_id` ON `characteristic_text` (`characteristic_id`);

CREATE INDEX IF NOT EXISTS `idx_characteristic_text_local_language_id` ON `characteristic_text` (`local_language_id`);
