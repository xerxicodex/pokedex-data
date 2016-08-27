CREATE TABLE IF NOT EXISTS experience (
  `growth_rate_id` INTEGER unsigned,
  `level` VARCHAR (255),
  `experience` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_experience_growth_rate_id` ON `experience` (`growth_rate_id`);
