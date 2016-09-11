CREATE TABLE IF NOT EXISTS machines (
  `machine_number` TEXT,
  `version_group_id` INTEGER unsigned,
  `item_id` INTEGER unsigned,
  `move_id` INTEGER unsigned
)
--{options}
;
CREATE INDEX IF NOT EXISTS `idx_machines_version_group_id` ON `machines` (`version_group_id`);

CREATE INDEX IF NOT EXISTS `idx_machines_item_id` ON `machines` (`item_id`);

CREATE INDEX IF NOT EXISTS `idx_machines_move_id` ON `machines` (`move_id`);
