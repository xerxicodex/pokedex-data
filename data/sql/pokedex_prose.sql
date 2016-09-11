CREATE TABLE IF NOT EXISTS pokedex_prose (
  `pokedex_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255),
  `description` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_pokedex_prose_pokedex_id` ON `pokedex_prose` (`pokedex_id`);

CREATE INDEX IF NOT EXISTS `idx_pokedex_prose_local_language_id` ON `pokedex_prose` (`local_language_id`);
