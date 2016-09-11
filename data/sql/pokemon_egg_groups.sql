CREATE TABLE IF NOT EXISTS pokemon_egg_groups (
  `species_id` INTEGER unsigned,
  `egg_group_id` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokemon_egg_groups_species_id` ON `pokemon_egg_groups` (`species_id`);

CREATE INDEX IF NOT EXISTS `idx_pokemon_egg_groups_egg_group_id` ON `pokemon_egg_groups` (`egg_group_id`);
