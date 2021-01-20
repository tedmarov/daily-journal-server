INSERT INTO `Entry` VALUES (null, "HTML & CSS", 2025-07-24, "We talked about HTML components and how to make grid layouts with Flexbox in CSS.", 3)
INSERT INTO `Entry` VALUES (null, "Complex Flexbox", 2025-07-26, "I tried to have an element in my Flexbox layout also be another Flexbox layout. It hurt my brain. I hate Steve.", 2)
INSERT INTO `Entry` VALUES (null, "THE FUTURE", 3443-12-02, "IS CHROMEE", 1);

INSERT INTO `Moods` VALUES (null, "Happy")
INSERT INTO `Moods` VALUES (null, "Sad")
INSERT INTO `Moods` VALUES (null, "Sleepy")
INSERT INTO `Moods` VALUES (null, "Good")
INSERT INTO `Moods` VALUES (null, "Stressed")
INSERT INTO `Moods` VALUES (null, "Weird");

ALTER TABLE `Entry`
    ADD COLUMN `concept` TEXT NOT NULL DEFAULT '';

CREATE TABLE `Entry` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `concept` TEXT NOT NULL,
	`date_of_entry`	DATE NOT NULL,
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
