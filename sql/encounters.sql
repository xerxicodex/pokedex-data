CREATE TABLE IF NOT EXISTS encounters (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `version_id` INTEGER unsigned,
  `location_area_id` INTEGER unsigned,
  `encounter_slot_id` INTEGER unsigned,
  `pokemon_id` INTEGER unsigned,
  `min_level` INTEGER unsigned,
  `max_level` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_encounters_version_id` ON `encounters` (`version_id`);

CREATE INDEX IF NOT EXISTS `idx_encounters_location_area_id` ON `encounters` (`location_area_id`);

CREATE INDEX IF NOT EXISTS `idx_encounters_encounter_slot_id` ON `encounters` (`encounter_slot_id`);

CREATE INDEX IF NOT EXISTS `idx_encounters_pokemon_id` ON `encounters` (`pokemon_id`);
