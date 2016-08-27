CREATE TABLE IF NOT EXISTS conquest_move_displacements (
  `id` INTEGER unsigned NOT NULL PRIMARY KEY,
  `identifier` VARCHAR (255),
  `affects_target` VARCHAR (255)
);
