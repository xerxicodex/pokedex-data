CREATE TABLE IF NOT EXISTS moves (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `identifier` VARCHAR(255),
  `generation_id` INTEGER unsigned,
  `type_id` INTEGER unsigned,
  `power` TEXT,
  `pp` TEXT,
  `accuracy` TEXT,
  `priority` TEXT,
  `target_id` INTEGER unsigned,
  `damage_class_id` INTEGER unsigned,
  `effect_id` INTEGER unsigned,
  `effect_chance` TEXT,
  `contest_type_id` INTEGER unsigned,
  `contest_effect_id` INTEGER unsigned,
  `super_contest_effect_id` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_moves_generation_id` ON `moves` (`generation_id`);

CREATE INDEX IF NOT EXISTS `idx_moves_type_id` ON `moves` (`type_id`);

CREATE INDEX IF NOT EXISTS `idx_moves_target_id` ON `moves` (`target_id`);

CREATE INDEX IF NOT EXISTS `idx_moves_damage_class_id` ON `moves` (`damage_class_id`);

CREATE INDEX IF NOT EXISTS `idx_moves_effect_id` ON `moves` (`effect_id`);

CREATE INDEX IF NOT EXISTS `idx_moves_contest_type_id` ON `moves` (`contest_type_id`);

CREATE INDEX IF NOT EXISTS `idx_moves_contest_effect_id` ON `moves` (`contest_effect_id`);

CREATE INDEX IF NOT EXISTS `idx_moves_super_contest_effect_id` ON `moves` (`super_contest_effect_id`);
