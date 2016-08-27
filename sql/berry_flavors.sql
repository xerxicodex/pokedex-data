CREATE TABLE IF NOT EXISTS berry_flavors (
  `berry_id` INTEGER unsigned,
  `contest_type_id` INTEGER unsigned,
  `flavor` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_berry_flavors_berry_id` ON `berry_flavors` (`berry_id`);

CREATE INDEX IF NOT EXISTS `idx_berry_flavors_contest_type_id` ON `berry_flavors` (`contest_type_id`);
