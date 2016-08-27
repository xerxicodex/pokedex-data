CREATE TABLE IF NOT EXISTS conquest_warrior_transformation (
  `transformed_warrior_rank_id` INTEGER unsigned,
  `is_automatic` VARCHAR (255),
  `required_link` VARCHAR (255),
  `completed_episode_id` INTEGER unsigned,
  `current_episode_id` INTEGER unsigned,
  `distant_warrior_id` INTEGER unsigned,
  `female_warlord_count` VARCHAR (255),
  `pokemon_count` VARCHAR (255),
  `collection_type_id` INTEGER unsigned,
  `warrior_count` VARCHAR (255)
);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_transformation_transformed_warrior_rank_id` ON `conquest_warrior_transformation` (`transformed_warrior_rank_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_transformation_completed_episode_id` ON `conquest_warrior_transformation` (`completed_episode_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_transformation_current_episode_id` ON `conquest_warrior_transformation` (`current_episode_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_transformation_distant_warrior_id` ON `conquest_warrior_transformation` (`distant_warrior_id`);

CREATE INDEX IF NOT EXISTS `idx_conquest_warrior_transformation_collection_type_id` ON `conquest_warrior_transformation` (`collection_type_id`);
