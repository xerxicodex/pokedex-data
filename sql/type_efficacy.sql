CREATE TABLE IF NOT EXISTS type_efficacy (
  `damage_type_id` INTEGER unsigned,
  `target_type_id` INTEGER unsigned,
  `damage_factor` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_type_efficacy_damage_type_id` ON `type_efficacy` (`damage_type_id`);

CREATE INDEX IF NOT EXISTS `idx_type_efficacy_target_type_id` ON `type_efficacy` (`target_type_id`);
