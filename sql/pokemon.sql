CREATE TABLE IF NOT EXISTS pokemon (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `identifier` VARCHAR (255),
  `species_id` INTEGER unsigned,
  `height` VARCHAR (255),
  `weight` VARCHAR (255),
  `base_experience` VARCHAR (255),
  `order` VARCHAR (255),
  `is_default` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_id` ON `pokemon` (`species_id`);
