CREATE TABLE IF NOT EXISTS version_group_regions (
  `version_group_id` INTEGER unsigned,
  `region_id` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_version_group_regions_version_group_id` ON `version_group_regions` (`version_group_id`);

CREATE INDEX IF NOT EXISTS `idx_version_group_regions_region_id` ON `version_group_regions` (`region_id`);
