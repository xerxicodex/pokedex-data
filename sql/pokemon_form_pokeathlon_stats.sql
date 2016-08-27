CREATE TABLE IF NOT EXISTS pokemon_form_pokeathlon_stats (
  `pokemon_form_id` INTEGER unsigned,
  `pokeathlon_stat_id` INTEGER unsigned,
  `minimum_stat` VARCHAR (255),
  `base_stat` VARCHAR (255),
  `maximum_stat` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_form_pokeathlon_stats_pokemon_form_id` ON `pokemon_form_pokeathlon_stats` (`pokemon_form_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_form_pokeathlon_stats_pokeathlon_stat_id` ON `pokemon_form_pokeathlon_stats` (`pokeathlon_stat_id`);
