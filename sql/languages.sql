CREATE TABLE IF NOT EXISTS languages (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `iso639` VARCHAR (255),
  `iso3166` VARCHAR (255),
  `identifier` VARCHAR (255),
  `official` VARCHAR (255),
  `order` VARCHAR (255)
);
