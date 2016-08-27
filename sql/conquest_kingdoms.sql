CREATE TABLE IF NOT EXISTS conquest_kingdoms (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `identifier` VARCHAR (255),
  `type_id` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_conquest_kingdoms_type_id` ON `conquest_kingdoms` (`type_id`);
