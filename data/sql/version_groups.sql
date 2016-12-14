CREATE TABLE IF NOT EXISTS version_groups (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `identifier` VARCHAR(255),
  `generation_id` INTEGER unsigned,
  `order` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_version_groups_generation_id` ON `version_groups` (`generation_id`);
