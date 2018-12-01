drop table users;
create table IF NOT EXISTS `users` (
  `user_id` bigint(11) not null auto_increment,
  `first_name` varchar(50) not null,
  `last_name` varchar(50) not null,
  `email` varchar(50) not null,
  `role` varchar(50) not null,
  `username` varchar(50) not null,
  `password` varchar(200) not null,
  `verified` BOOLEAN NOT NULL DEFAULT FALSE,
  `activated` BOOLEAN NOT NULL DEFAULT FALSE,
  primary key (`user_id`),
  unique key `username_unique` (`username`)
  ) ENGINE=InnoDB default charset=utf8mb4 collate = utf8mb4_general_ci;

delete from users;

insert into `users`(`first_name`, `last_name`, `email`, `role`, `username`, `password`, `verified`)
VALUES('Bob', 'Smith', 'bob@gmail.com', 'ROLE_ADMIN', 'admin', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true),
      ('Alex', 'McDonald', 'alex@gmail.com', 'ROLE_STUDENT', 'student', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true),
      ('Mary', 'Peak', 'mary@gmail.com', 'ROLE_TUTOR', 'tutor', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true),
      ('Ann', 'Angry', 'ann@gmail.com', 'ROLE_STUDENT', 'ann', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true),
      ('Jack', 'Crazy', 'jack@gmail.com', 'ROLE_TUTOR', 'jack', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true),
      ('Nelson', 'Mandela', 'nelson@gmail.com', 'ROLE_STUDENT', 'nelson', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true),
      ('Berny', 'Black', 'barny@gmail.com', 'ROLE_TUTOR', 'barny', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true),
      ('Den', 'Forest', 'den@gmail.com', 'ROLE_STUDENT', 'den', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true),
      ('Mike', 'Sky', 'mike@gmail.com', 'ROLE_TUTOR', 'mike', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true),
      ('Iren', 'Gamp', 'iren0@gmail.com', 'ROLE_TUTOR', 'iren', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true),
      ('Fredy', 'White', 'fredy@gmail.com', 'ROLE_TUTOR', 'fredy', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true),
      ('John', 'McKey', 'john@gmail.com', 'ROLE_STUDENT', 'john', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true),
      ('Lucy', 'Love', 'lucy@gmail.com', 'ROLE_STUDENT', 'lucy', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true),
      ('Piter', 'Hangry', 'piter@gmail.com', 'ROLE_STUDENT', 'piter', '$2a$10$XKttR3C6ryo9lbxtYwtKN.3ayG6qko38aDdZW5195dd/Nyjahfd8O', true);
