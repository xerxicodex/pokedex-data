CREATE TABLE IF NOT EXISTS berry_firmness_names (
  `berry_firmness_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_berry_firmness_names_berry_firmness_id` ON `berry_firmness_names` (`berry_firmness_id`);

CREATE INDEX IF NOT EXISTS `idx_berry_firmness_names_local_language_id` ON `berry_firmness_names` (`local_language_id`);
