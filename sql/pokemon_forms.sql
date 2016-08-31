CREATE TABLE IF NOT EXISTS pokemon_forms (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `identifier` VARCHAR (255),
  `form_identifier` VARCHAR (255),
  `pokemon_id` INTEGER unsigned,
  `introduced_in_version_group_id` INTEGER unsigned,
  `is_default` INTEGER unsigned,
  `is_battle_only` INTEGER unsigned,
  `is_mega` INTEGER unsigned,
  `form_order` INTEGER unsigned,
  `order` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_forms_form_identifier` ON `pokemon_forms` (`form_identifier`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_forms_pokemon_id` ON `pokemon_forms` (`pokemon_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_forms_introduced_in_version_group_id` ON `pokemon_forms` (`introduced_in_version_group_id`);
