CREATE TABLE IF NOT EXISTS locations (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `region_id` INTEGER unsigned,
  `codename` VARCHAR(255)
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_locations_region_id` ON `locations` (`region_id`);
