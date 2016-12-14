CREATE TABLE IF NOT EXISTS languages (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `iso639` TEXT,
  `iso3166` TEXT,
  `identifier` VARCHAR(255),
  `official` TEXT,
  `order` INTEGER unsigned
)
--{options}
;