CREATE TABLE IF NOT EXISTS pokemon_species (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `codename` VARCHAR(255),
  `generation_id` INTEGER unsigned,
  `evolves_from_species_id` INTEGER unsigned,
  `evolution_chain_id` INTEGER unsigned,
  `color_id` INTEGER unsigned,
  `shape_id` INTEGER unsigned,
  `habitat_id` INTEGER unsigned,
  `gender_rate` TEXT,
  `capture_rate` TEXT,
  `base_happiness` TEXT,
  `is_baby` INTEGER unsigned,
  `hatch_counter` TEXT,
  `has_gender_differences` TEXT,
  `growth_rate_id` INTEGER unsigned,
  `forms_switchable` TEXT,
  `order` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokemon_species_generation_id` ON `pokemon_species` (`generation_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_evolves_from_species_id` ON `pokemon_species` (`evolves_from_species_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_evolution_chain_id` ON `pokemon_species` (`evolution_chain_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_color_id` ON `pokemon_species` (`color_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_shape_id` ON `pokemon_species` (`shape_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_habitat_id` ON `pokemon_species` (`habitat_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_species_growth_rate_id` ON `pokemon_species` (`growth_rate_id`);
