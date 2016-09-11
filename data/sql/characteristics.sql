CREATE TABLE IF NOT EXISTS characteristics (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `stat_id` INTEGER unsigned,
  `gene_mod_5` TEXT
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_characteristics_stat_id` ON `characteristics` (`stat_id`);
