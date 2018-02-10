-- DROP DATABASE IF EXISTS chat;

-- CREATE DATABASE chat;

-- USE chat;

-- -- CREATE TABLE messages (
-- --    Describe your table here.
-- -- );

-- /* Create other tables and define schemas for them here! */




-- /*  Execute this file from the command line by typing:
--  *    mysql -u root < server/schema.sql
--  *  to create the database and the tables.*/

-- -- ---
-- -- Globals
-- -- ---

-- -- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- -- SET FOREIGN_KEY_CHECKS=0;

-- -- ---
-- -- Table 'rooms'
-- -- chatrooms
-- -- ---

-- -- DROP TABLE IF EXISTS rooms;
    
-- CREATE TABLE rooms (
--   id int NOT NULL AUTO_INCREMENT,
--   name varchar(255),
--   PRIMARY KEY (id)
-- );


-- -- ---
-- -- Table 'messages'
-- -- 
-- -- ---

-- -- DROP TABLE IF EXISTS messages;
    
-- CREATE TABLE messages (
--   id int NOT NULL AUTO_INCREMENT,
--   message varchar(255),
--   PRIMARY KEY (id)
-- );

-- -- ---
-- -- Table 'junctions'
-- -- table of IDs from rooms, users, and message tables
-- -- ---

-- DROP TABLE IF EXISTS junctions;
    
-- CREATE TABLE junctions (
--   id int NOT NULL AUTO_INCREMENT,
--   id_rooms int NOT NULL,
--   id_messages int NOT NULL,
--   PRIMARY KEY (id),
--   FOREIGN KEY (id_rooms) REFERENCES rooms (id),
--   FOREIGN KEY (id_messages) REFERENCES messages (id)
-- );

-- -- ---
-- -- Foreign Keys 
-- -- ---

-- -- ALTER TABLE junctions ADD FOREIGN KEY (id_rooms) REFERENCES rooms (id);
-- -- ALTER TABLE junctions ADD FOREIGN KEY (id_users) REFERENCES users (id);
-- -- ALTER TABLE junctions ADD FOREIGN KEY (id_messages) REFERENCES messages (id);

-- -- ---
-- -- Table Properties
-- -- ---

-- -- ALTER TABLE `rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- -- ALTER TABLE `users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- -- ALTER TABLE `messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- -- ALTER TABLE `junctions` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- -- ---
-- -- Test Data
-- -- ---

-- -- INSERT INTO `rooms` (`id`,`name`) VALUES
-- -- ('','');
-- -- INSERT INTO `users` (`id`,`name`) VALUES
-- -- ('','');
-- -- INSERT INTO `messages` (`id`,`body`) VALUES
-- -- ('','');
-- -- INSERT INTO `junctions` (`id`,`id_rooms`,`id_users`,`id_messages`) VALUES
-- -- ('','','','');


DROP DATABASE IF EXISTS chat;

CREATE DATABASE chat;

USE chat;

CREATE TABLE messages (
  id int not null primary key auto_increment,
  message varchar(140),
  createdAt date not null,
  room_id int,
  user_id int
);

CREATE TABLE users (
  id int not null primary key auto_increment,
  username varchar(20)
);

CREATE TABLE rooms (
  id int not null primary key auto_increment,
  roomname varchar(20)
);

ALTER TABLE messages ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE messages ADD FOREIGN KEY (room_id) REFERENCES rooms (id);
/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
*  to create the database and the tables.*/

insert into rooms (roomname) values ('room1'),
  ('room2'),
  ('room3'),
  ('room4');

insert into users (username) values ('A'), ('B'), ('C'), ('D');

insert into messages (message, user_id, room_id, createdAt) values ('whatever', 4, 1, STR_TO_DATE('1-01-2012', '%d-%m-%Y')),
('test1', 4, 1, STR_TO_DATE('1-01-2012', '%d-%m-%Y')),
('test2', 1, 2, STR_TO_DATE('1-01-2012', '%d-%m-%Y')),
('test3', 2, 2, STR_TO_DATE('1-01-2012', '%d-%m-%Y')),
('test5', 2, 3, STR_TO_DATE('1-01-2012', '%d-%m-%Y')),
('test6', 2, 2, STR_TO_DATE('1-01-2012', '%d-%m-%Y')),
('test4', 3, 1, STR_TO_DATE('1-01-2012', '%d-%m-%Y'));