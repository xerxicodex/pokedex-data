CREATE TABLE IF NOT EXISTS experience (
  `growth_rate_id` INTEGER unsigned,
  `level` TEXT,
  `experience` TEXT
);

CREATE INDEX IF NOT EXISTS `idx_experience_growth_rate_id` ON `experience` (`growth_rate_id`);
