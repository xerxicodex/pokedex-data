CREATE TABLE IF NOT EXISTS egg_group_prose (
  `egg_group_id` INTEGER unsigned,
  `local_language_id` INTEGER unsigned,
  `name` VARCHAR(255)
);

CREATE INDEX IF NOT EXISTS `idx_egg_group_prose_egg_group_id` ON `egg_group_prose` (`egg_group_id`);

CREATE INDEX IF NOT EXISTS `idx_egg_group_prose_local_language_id` ON `egg_group_prose` (`local_language_id`);
