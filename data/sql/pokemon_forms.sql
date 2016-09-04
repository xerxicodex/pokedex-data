CREATE TABLE IF NOT EXISTS pokemon_forms (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `codename` VARCHAR(255),
  `form_identifier` TEXT,
  `pokemon_id` INTEGER unsigned,
  `introduced_in_version_group_id` INTEGER unsigned,
  `is_default` INTEGER unsigned,
  `is_battle_only` INTEGER unsigned,
  `is_mega` INTEGER unsigned,
  `form_order` TEXT,
  `order` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_pokemon_forms_pokemon_id` ON `pokemon_forms` (`pokemon_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_forms_introduced_in_version_group_id` ON `pokemon_forms` (`introduced_in_version_group_id`);
