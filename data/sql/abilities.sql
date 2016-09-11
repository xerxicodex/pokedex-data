CREATE TABLE IF NOT EXISTS abilities (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `codename` VARCHAR(255),
  `generation_id` INTEGER unsigned,
  `is_main_series` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_abilities_generation_id` ON `abilities` (`generation_id`);
