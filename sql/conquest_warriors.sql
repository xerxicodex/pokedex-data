CREATE TABLE IF NOT EXISTS conquest_warriors (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `identifier` VARCHAR (255),
  `gender_id` INTEGER unsigned,
  `archetype_id` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_conquest_warriors_gender_id` ON `conquest_warriors` (`gender_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_warriors_archetype_id` ON `conquest_warriors` (`archetype_id`);
