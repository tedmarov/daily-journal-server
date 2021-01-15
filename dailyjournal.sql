INSERT INTO `Entry` VALUES (null, 'HTML & CSS','07/24/2025','We talked about HTML components and how to make grid layouts with Flexbox in CSS.',4);

ALTER TABLE `Entry`
    ADD COLUMN `concept` TEXT NOT NULL DEFAULT '';

CREATE TABLE `Entry` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`dateOfEntry`	DATE,
	`entry`	TEXT NOT NULL,
    `mood_id` INTEGER NOT NULL,
	FOREIGN KEY(`mood_id`) REFERENCES `Mood`(`id`)

);

CREATE TABLE `Mood` (
    `id`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `label`    TEXT NOT NULL
);

CREATE TABLE `EntryTag` (
    `id`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `entry_id` INTEGER,
    `tag_id` INTEGER,
    FOREIGN KEY(`entry_id`) REFERENCES `Entry`(`id`),
  	FOREIGN KEY(`tag_id`) REFERENCES `Tag`(`id`)
);

CREATE TABLE `Tag` (
    `id`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `subject` TEXT NOT NULL
);
