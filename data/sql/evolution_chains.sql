CREATE TABLE IF NOT EXISTS evolution_chains (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `baby_trigger_item_id` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_evolution_chains_baby_trigger_item_id` ON `evolution_chains` (`baby_trigger_item_id`);
