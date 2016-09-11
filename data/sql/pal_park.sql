CREATE TABLE IF NOT EXISTS pal_park (
  `species_id` INTEGER unsigned,
  `area_id` INTEGER unsigned,
  `base_score` TEXT,
  `rate` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pal_park_species_id` ON `pal_park` (`species_id`);

CREATE INDEX IF NOT EXISTS `idx_pal_park_area_id` ON `pal_park` (`area_id`);
