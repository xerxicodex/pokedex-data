CREATE TABLE IF NOT EXISTS pokemon_species (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `identifier` VARCHAR (255),
  `generation_id` INTEGER unsigned,
  `evolves_from_species_id` INTEGER unsigned,
  `evolution_chain_id` INTEGER unsigned,
  `color_id` INTEGER unsigned,
  `shape_id` INTEGER unsigned,
  `habitat_id` INTEGER unsigned,
  `gender_rate` VARCHAR (255),
  `capture_rate` VARCHAR (255),
  `base_happiness` VARCHAR (255),
  `is_baby` VARCHAR (255),
  `hatch_counter` VARCHAR (255),
  `has_gender_differences` VARCHAR (255),
  `growth_rate_id` INTEGER unsigned,
  `forms_switchable` VARCHAR (255),
  `order` VARCHAR (255),
  `conquest_order` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_generation_id` ON `pokemon_species` (`generation_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_evolves_from_species_id` ON `pokemon_species` (`evolves_from_species_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_evolution_chain_id` ON `pokemon_species` (`evolution_chain_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_color_id` ON `pokemon_species` (`color_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_shape_id` ON `pokemon_species` (`shape_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_habitat_id` ON `pokemon_species` (`habitat_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_growth_rate_id` ON `pokemon_species` (`growth_rate_id`);
