/*  Drop (Delete) a DDBB */
DROP DATABASE databasename;

/*  Create a DDBB */
CREATE DATABASE databasename;

/* --------- Query to delete "USERS" table if exists and create if it doesn't --------- */

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usercod` varchar(20) NOT NULL DEFAULT '',
  `pid` varchar(1000) NOT NULL DEFAULT '',
  `name` varchar(1000) NOT NULL DEFAULT '',
  `login` varchar(20) NOT NULL DEFAULT '',
  `spent_time` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


/* Query to Select only "Mouse-Click" into a "USER1" table */
SELECT * FROM USER1 WHERE all_act LIKE 'm-c%'

/* ========================================================== */
/* --------- QUERY TO PROCESS "USERS" TABLE --------- */
/* Query to DELETE columns */
ALTER TABLE users
  DROP COLUMN login_time,
  DROP COLUMN spent_time_sec;

/* Query to INSERT a column into an existing DB */
ALTER TABLE `takefeedback2`
    ADD COLUMN `RATING1` INT(10) AFTER `firstCol`;
ALTER TABLE `takefeedback2`
    ADD COLUMN `RATING1` tinyint(4) AFTER `RATING`;

/* Query to CHANGE a column-NAME in a exiting TABLE */
ALTER TABLE TABLE_NAME CHANGE old_name new_name COLUMN_TYPE;
ALTER TABLE `takefeedback2` CHANGE RATING1 RATING2 tinyint;

/* QUERY to GET Login_time (Login_time) */
ALTER TABLE users ADD COLUMN (calc DECIMAL);
UPDATE users SET calc=login/1000;
ALTER TABLE users ADD COLUMN (login_time DATETIME);
UPDATE users SET login_time = from_unixtime(calc);
ALTER TABLE users DROP COLUMN calc;

/* QUERY TO GET the Spent time ‘SPENT_TIME_SEC’ in seconds */
ALTER TABLE users ADD COLUMN (spent_time_sec DECIMAL);
UPDATE users SET spent_time_sec = spent_time/1000;
/* ================================================= */

/* INSERT a data into a table.*/
/* Note: the 'id' column is 'AUTO-INCREMENT' type that is why it is set as 'NULL' */
INSERT INTO user10 (id, usercod, pid, name,time,all_act)
VALUES (NULL, 'usercode', 'pi20','name20','time20','click all 20');

/* +++++++  other queries ++++++++++++++ */
/* Rename a table */
RENAME TABLE `tb1` TO `tb2`, tb3 TO tb4;