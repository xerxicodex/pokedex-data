CREATE TABLE IF NOT EXISTS language_names (
  `language_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_language_names_language_id` ON `language_names` (`language_id`);

CREATE INDEX IF NOT EXISTS `idx_language_names_local_language_id` ON `language_names` (`local_language_id`);
