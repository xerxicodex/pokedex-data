CREATE TABLE IF NOT EXISTS conquest_warrior_specialties (
  `warrior_id` INTEGER unsigned,
  `type_id` INTEGER unsigned,
  `slot` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_specialties_warrior_id` ON `conquest_warrior_specialties` (`warrior_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_specialties_type_id` ON `conquest_warrior_specialties` (`type_id`);
