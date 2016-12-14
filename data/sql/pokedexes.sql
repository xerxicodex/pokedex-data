CREATE TABLE IF NOT EXISTS pokedexes (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `region_id` INTEGER unsigned,
  `identifier` VARCHAR(255),
  `is_main_series` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokedexes_region_id` ON `pokedexes` (`region_id`);
