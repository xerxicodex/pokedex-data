CREATE TABLE IF NOT EXISTS pokemon_form_names (
  `pokemon_form_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `form_name` VARCHAR(255),
  `pokemon_name` VARCHAR(255)
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokemon_form_names_pokemon_form_id` ON `pokemon_form_names` (`pokemon_form_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_form_names_local_language_id` ON `pokemon_form_names` (`local_language_id`);
