CREATE TABLE IF NOT EXISTS generations (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `main_region_id` INTEGER unsigned,
  `identifier` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_generations_main_region_id` ON `generations` (`main_region_id`);
