CREATE TABLE IF NOT EXISTS encounter_slots (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `version_group_id` INTEGER unsigned,
  `encounter_method_id` INTEGER unsigned,
  `slot` TEXT,
  `rarity` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_encounter_slots_version_group_id` ON `encounter_slots` (`version_group_id`);

CREATE INDEX IF NOT EXISTS `idx_encounter_slots_encounter_method_id` ON `encounter_slots` (`encounter_method_id`);
