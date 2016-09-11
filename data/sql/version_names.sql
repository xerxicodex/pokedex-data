CREATE TABLE IF NOT EXISTS version_names (
  `version_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_version_names_version_id` ON `version_names` (`version_id`);

CREATE INDEX IF NOT EXISTS `idx_version_names_local_language_id` ON `version_names` (`local_language_id`);
