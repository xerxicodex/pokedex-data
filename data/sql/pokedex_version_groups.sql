CREATE TABLE IF NOT EXISTS pokedex_version_groups (
  `pokedex_id` INTEGER unsigned,
  `version_group_id` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokedex_version_groups_pokedex_id` ON `pokedex_version_groups` (`pokedex_id`);

CREATE INDEX IF NOT EXISTS `idx_pokedex_version_groups_version_group_id` ON `pokedex_version_groups` (`version_group_id`);
