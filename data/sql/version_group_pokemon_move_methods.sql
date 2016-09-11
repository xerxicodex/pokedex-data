CREATE TABLE IF NOT EXISTS version_group_pokemon_move_methods (
  `version_group_id` INTEGER unsigned,
  `pokemon_move_method_id` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_version_group_pokemon_move_methods_version_group_id` ON `version_group_pokemon_move_methods` (`version_group_id`);

CREATE INDEX IF NOT EXISTS `idx_version_group_pokemon_move_methods_pokemon_move_method_id` ON `version_group_pokemon_move_methods` (`pokemon_move_method_id`);
