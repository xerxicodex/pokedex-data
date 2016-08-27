CREATE TABLE IF NOT EXISTS pokemon_form_generations (
  `pokemon_form_id` INTEGER unsigned,
  `generation_id` INTEGER unsigned,
  `game_index` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_form_generations_pokemon_form_id` ON `pokemon_form_generations` (`pokemon_form_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_form_generations_generation_id` ON `pokemon_form_generations` (`generation_id`);
