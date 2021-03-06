INSERT INTO `Entry` VALUES (null, "HTML & CSS", '07/24/2025', "We talked about HTML components and how to make grid layouts with Flexbox in CSS.", 3);
INSERT INTO `Entry` VALUES (null, "Complex Flexbox", '07/26/2025', "I tried to have an element in my Flexbox layout also be another Flexbox layout. It hurt my brain. I hate Steve.", 2);
INSERT INTO `Entry` VALUES (null, "THE FUTURE", '12/02/3443', "IS CHROMEE", 1);

INSERT INTO `Mood` VALUES (null, "Happy");
INSERT INTO `Mood` VALUES (null, "Sad");
INSERT INTO `Mood` VALUES (null, "Sleepy");
INSERT INTO `Mood` VALUES (null, "Good");
INSERT INTO `Mood` VALUES (null, "Stressed");
INSERT INTO `Mood` VALUES (null, "Weird");

INSERT INTO `EntryTag` VALUES (null, 1, 3);
INSERT INTO `EntryTag` VALUES (null, 3, 2);
INSERT INTO `EntryTag` VALUES (null, 2, 1);

INSERT INTO `Tag` VALUES (null, "API");
INSERT INTO `Tag` VALUES (null, "components");
INSERT INTO `Tag` VALUES (null, "fetch");

UPDATE `sqlite_sequence` SET `seq` = 0 WHERE `name` = 'Entry';

DELETE FROM `Mood`;
DELETE FROM `Entry`;

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
