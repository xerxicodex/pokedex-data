CREATE TABLE IF NOT EXISTS pokemon_evolution (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `evolved_species_id` INTEGER unsigned,
  `evolution_trigger_id` INTEGER unsigned,
  `trigger_item_id` INTEGER unsigned,
  `minimum_level` TEXT,
  `gender_id` INTEGER unsigned,
  `location_id` INTEGER unsigned,
  `held_item_id` INTEGER unsigned,
  `time_of_day` TEXT,
  `known_move_id` INTEGER unsigned,
  `known_move_type_id` INTEGER unsigned,
  `minimum_happiness` TEXT,
  `minimum_beauty` TEXT,
  `minimum_affection` TEXT,
  `relative_physical_stats` TEXT,
  `party_species_id` INTEGER unsigned,
  `party_type_id` INTEGER unsigned,
  `trade_species_id` INTEGER unsigned,
  `needs_overworld_rain` TEXT,
  `turn_upside_down` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokemon_evolution_evolved_species_id` ON `pokemon_evolution` (`evolved_species_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_evolution_evolution_trigger_id` ON `pokemon_evolution` (`evolution_trigger_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_evolution_trigger_item_id` ON `pokemon_evolution` (`trigger_item_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_evolution_gender_id` ON `pokemon_evolution` (`gender_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_evolution_location_id` ON `pokemon_evolution` (`location_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_evolution_held_item_id` ON `pokemon_evolution` (`held_item_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_evolution_known_move_id` ON `pokemon_evolution` (`known_move_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_evolution_known_move_type_id` ON `pokemon_evolution` (`known_move_type_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_evolution_party_species_id` ON `pokemon_evolution` (`party_species_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_evolution_party_type_id` ON `pokemon_evolution` (`party_type_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_evolution_trade_species_id` ON `pokemon_evolution` (`trade_species_id`);
