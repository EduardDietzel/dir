create database movitickets;

CREATE TABLE `users` (
  `id` integer PRIMARY KEY auto_increment,
  `username` varchar(128) NOT NULL,
  `birthday` datetime NOT NULL,
  `created_at` timestamp,
  `email` varchar(64),
  `password` char(64)
);

CREATE TABLE `movies` (
  `id` integer PRIMARY KEY auto_increment,
  `moviname` varchar(64) NOT NULL
);

CREATE TABLE `halls` (
  `id` integer PRIMARY KEY auto_increment,
  `hallcolor` varchar(64) NOT NULL
);

CREATE TABLE `timetable` (
  `id` integer PRIMARY KEY auto_increment,
  `movi_id` integer,
  `hall_id` integer,
  `date_time` datetime,
  `price_usual_place` integer,
  `price_vip_place` integer
);

CREATE TABLE `tickets` (
  `id` integer PRIMARY KEY auto_increment,
  `user_id` integer,
  `session_id` integer,
  `place` integer,
  `is_paid` bool default false,
  `discount_id` integer
);

CREATE TABLE `discounts` (
  `id` integer PRIMARY KEY auto_increment,
  `discount_value` integer,
  `title` varchar(64) NOT NULL
);

ALTER TABLE `timetable` ADD FOREIGN KEY (`movi_id`) REFERENCES `movies` (`id`);

ALTER TABLE `timetable` ADD FOREIGN KEY (`hall_id`) REFERENCES `halls` (`id`);

ALTER TABLE `tickets` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `tickets` ADD FOREIGN KEY (`session_id`) REFERENCES `timetable` (`id`);

ALTER TABLE `tickets` ADD FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`);
