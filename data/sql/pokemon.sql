CREATE TABLE IF NOT EXISTS pokemon (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `codename` VARCHAR(255),
  `species_id` INTEGER unsigned,
  `height` TEXT,
  `weight` TEXT,
  `base_experience` TEXT,
  `order` INTEGER unsigned,
  `is_default` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_id` ON `pokemon` (`species_id`);
