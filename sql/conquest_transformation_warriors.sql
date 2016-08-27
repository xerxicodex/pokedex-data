CREATE TABLE IF NOT EXISTS conquest_transformation_warriors (
  `transformation_id` INTEGER unsigned,
  `present_warrior_id` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_conquest_transformation_warriors_transformation_id` ON `conquest_transformation_warriors` (`transformation_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_transformation_warriors_present_warrior_id` ON `conquest_transformation_warriors` (`present_warrior_id`);
