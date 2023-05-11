-- use tickets;

CREATE TABLE `users` (
  `user_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `fullname` VARCHAR(50),
  `email` VARCHAR(60) unique not null,
  `created_at` TIMESTAMP default current_timestamp
);

CREATE TABLE `tickets` (
  `ticket_id` integer PRIMARY KEY AUTO_INCREMENT,
  `timetable_id` integer,
  `user_id` integer,
  `row` integer,
  `seat` integer,
  `cost` numeric(6, 2) not null,
  `is_vip` bool,
  `created_at` TIMESTAMP default current_timestamp
);

CREATE TABLE `halls` (
  `hall_id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50),  
  `number_seats` integer,
  `low_category` integer,
  `vip_category` integer
);

CREATE TABLE `timetable` (
  `timetable_id` integer PRIMARY KEY AUTO_INCREMENT,
  `hall_id` integer,
  `movie_id` integer,
  `start_time` timestamp,
  `duration_minute` integer,
  `low_seat_price` numeric,
  `vip_seat_price` numeric,
  `created_at` timestamp
);

CREATE TABLE `movies` (
  `movie_id` integer PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(60),
  `rating` numeric(6, 2),
  `duration_minute` numeric(6, 2),
  `imdb_id` int
);

ALTER TABLE `tickets` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `tickets` ADD FOREIGN KEY (`timetable_id`) REFERENCES `timetable` (`timetable_id`);

ALTER TABLE `timetable` ADD FOREIGN KEY (`hall_id`) REFERENCES `halls` (`hall_id`);

ALTER TABLE `timetable` ADD FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);
