CREATE TABLE IF NOT EXISTS experience (
  `growth_rate_id` INTEGER unsigned,
  `level` INTEGER unsigned,
  `experience` INTEGER unsigned
);

CREATE INDEX IF NOT EXISTS `idx_experience_growth_rate_id` ON `experience` (`growth_rate_id`);
