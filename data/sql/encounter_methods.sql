CREATE TABLE IF NOT EXISTS encounter_methods (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `codename` VARCHAR(255),
  `order` INTEGER unsigned
)
--{options}
;