CREATE USER 'jeffrey'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON db1.* TO 'jeffrey'@'localhost';

CREATE DATABASE mydb
  CHARACTER SET utf8
  COLLATE utf8_general_ci;

DROP table IF EXISTS `tutor_profiles`;
DROP table IF EXISTS `student_profiles`;
DROP table IF EXISTS `users`;

create table `users` (
  `id` int(11) not null auto_increment,
  `firstname` varchar(50) not null,
  `lastname` varchar(50) not null,
  `email` varchar(50) not null,
  `role` int(11) not null,
  `username` varchar(50) not null,
  `password` varchar(200) not null,
  `verified` BOOLEAN NOT NULL DEFAULT FALSE,
  primary key (`id`),
  unique key `username_unique` (`username`)
) ENGINE=InnoDB default charset=utf8 collate = utf8_general_ci;

ALTER TABLE users change verified verified BOOLEAN NOT NULL DEFAULT false;
ALTER TABLE users change firstname firstname varchar(50) not null;
ALTER TABLE users change lastname lastname varchar(50) not null;
ALTER TABLE users change username username varchar(50) not null;
ALTER TABLE users change password password varchar(200) not null;

DESC users;


create table `tutor_profiles` (
  `id` int(11) not null,
  `position` varchar(100),
  `scientific_degree` varchar(100),
  `academic_title` varchar(100),
  primary key (`id`),
  unique key `id_unique` (`id`),
  FOREIGN KEY (`id`)
    REFERENCES `users` (`id`)
      ON DELETE CASCADE
) ENGINE=InnoDB default charset=utf8 collate = utf8_general_ci;

ALTER TABLE tutor_profiles CHANGE academicTitle academic_title varchar(100);

create table `student_profiles` (
  `id` int(11) not null,
  `specialty` varchar(100),
  `group` varchar(10),
  `year` int(4),
  primary key (`id`),
  unique key `id_unique` (`id`),
  FOREIGN KEY (`id`)
    REFERENCES `users` (`id`)
      ON DELETE CASCADE
) ENGINE=InnoDB default charset=utf8 collate = utf8_general_ci;


insert into `users`(`firstname`, `lastname`, `email`, `role`, `username`, `password`)
VALUES('Bob', 'Smith', 'bob@gmail.com', 1, 'bob', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36'),
      ('Alex', 'McDonald', 'alex@gmail.com', 2, 'alex', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36'),
      ('Mary', 'Peak', 'mary@gmail.com', 1, 'mary', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36'),
      ('Ann', 'Angry', 'ann@gmail.com', 2, 'ann', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36'),
      ('Jack', 'Crazy', 'jack@gmail.com', 1, 'jack', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36'),
      ('Nelson', 'Mandela', 'nelson@gmail.com', 2, 'nelson', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36'),
      ('Berny', 'Black', 'barny@gmail.com', 1, 'barny', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36'),
      ('Den', 'Forest', 'den@gmail.com', 2, 'den', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36'),
      ('Mike', 'Sky', 'mike@gmail.com', 1, 'mike', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36'),
      ('Iren', 'Gamp', 'iren0@gmail.com', 1, 'iren', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36'),
      ('Fredy', 'White', 'fredy@gmail.com', 1, 'fredy', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36'),
      ('John', 'McKey', 'john@gmail.com', 2, 'john', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36'),
      ('Lucy', 'Love', 'lucy@gmail.com', 2, 'lucy', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36'),
      ('Piter', 'Hangry', 'piter@gmail.com', 2, 'piter', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36');


insert into `tutor_profiles`(`id`, `position`, `scientific_degree`, `academic_title`)
values(1, 'Assitent of Biology', 'Bachelor of Science',  'Bachelor of Biology'),
      (3, 'Teacher of Math', 'Bachelor of Science',  'Bachelor of Mathematics'),
      (5, 'Senior lecturer of Physics', 'Master of Science',  'Master of Physics'),
      (7, 'Professor of Chemistry', 'Doctor of Philosophy',  'Doctor of chemistry'),
      (9, 'Head of department', 'Doctor of Medicine',  'Doctor of chemistry'),
      (10, 'Dean of the faculty', 'Doctor of Science',  'Doctor of Mathematics'),
      (11, 'Senior lecturer of Geography', 'Master of Science',  'Master of Geography');

insert into `student_profiles`(`id`, `specialty`, `group`, `year`)
values(2, 'Mathematics', 'PM-033',  1),
      (4, 'Physics', 'PR-2017',  2),
      (6, 'Chemistry & Physics', 'LG-99',  3),
      (3, 'System Programming', 'HP-3000',  4),
      (12, 'Biology', 'NY-2019',  5),
      (14, 'Geography', 'Line-2',  16);


select * from `student_profiles`;
select * from `users`;

select `users`.`id`,
       `firstname`,
       `lastname`,
       `email`,
       `role`,
       `username`,
       `password`,
       `position`,
       `scientific_degree`,
       `academic_title`
from users
       inner join tutor_profiles on users.id = tutor_profiles.id
UNION ALL
select `users`.`id`,
       `firstname`,
       `lastname`,
       `email`,
       `role`,
       `username`,
       `password`,
       `specialty`,
       `group`,
       `year`
from users
       inner join student_profiles on users.id = student_profiles.id;

select `users`.`id`,
       `firstname`,
       `lastname`,
       `email`,
       `role`,
       `username`,
       `password`,
       `specialty`,
       `group`,
       `year`
from users
       left join student_profiles on users.id = student_profiles.id
where role = 2;


delete from users where email LIKE "%@mail.%";
select * from users;

SET @id = 0;
select * from users where (@id IN (id, 0)) ;

show tables;
drop table if exists `subjects`;

create table `subjects` (
  `id` int(11) not null auto_increment,
  `name` varchar(100) not null,
  primary key (`id`),
  unique key `name_unique` (`name`)
) ENGINE=InnoDB default charset=utf8 collate = utf8_general_ci;

ALTER TABLE subjects change name name varchar(100) not null;
desc subjects;

insert into `subjects`(`name`)
values('computer science'),
      ('mathematics'),
      ('physics'),
      ('chemistry'),
      ('English'),
      ('history'),
      ('biology'),
      ('geography');

select * from subjects;


drop table if exists `answers`;
drop table if exists `questions`;
drop table if exists `tests`;

create table `tests` (
  `id` bigint(11) not null auto_increment primary key,
  `subject_id` int(11),
  `tutor_id` int(11),
  `update_time` datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(100),
  `description` varchar(1000)
) ENGINE=InnoDB default charset=utf8 collate = utf8_general_ci;

ALTER TABLE tests change description description varchar(1000) not null;
desc tests;


create table `questions` (
  `id` bigint(11) not null auto_increment primary key,
  `test_id` bigint(11) not null,
  `description` varchar(1000) not null,
  FOREIGN KEY (`test_id`)
    REFERENCES `tests` (`id`)
      ON DELETE CASCADE
) ENGINE=InnoDB default charset=utf8 collate = utf8_general_ci;

ALTER TABLE questions change description description varchar(1000) not null;
ALTER TABLE questions change test_id test_id bigint(11) not null;
desc questions;

create table `answers` (
  `id` bigint(11) not null auto_increment primary key,
  `question_id` bigint(11) not null,
  `description` varchar(1000) not null,
  `correct` boolean not null,
  FOREIGN KEY (`question_id`)
    REFERENCES `questions` (`id`)
      ON DELETE CASCADE
) ENGINE=InnoDB default charset=utf8 collate = utf8_general_ci;

ALTER TABLE answers change description description varchar(1000) not null;
ALTER TABLE answers change question_id question_id bigint(11) not null;
ALTER TABLE answers change correct correct boolean not null;
desc answers;


insert into `tests`(`subject_id`, `tutor_id`, `title`, `description`, `update_time`)
values(7, 7, 'Biology Practice Test', 'Check you knowledge in biology!',  '2018-10-24 12:00:00'),
      (2, 3, 'TEst teST', 'Check you knowledge, be smart!', '2018-10-25 14:40:00'),
      (8,11, 'Geography test', 'Check you knowledge in World Geography!', '2018-10-26 10:15:00'),
      (7, 7, 'English 1 Practice Test', 'Check you knowledge in English!',  '2018-10-22 12:01:00'),
      (2, 3, 'Spanish 2 test', 'Check you knowledge, be smart!', '2018-02-02 11:43:00'),
      (8,11, 'Economic 3 test', 'Check you knowledge in World Economic!', '2017-10-26 10:15:00'),
      (2, 3, 'Spanish 4 test', 'Check you knowledge, be smart!', '2018-02-03 11:43:00'),
      (8,11, 'Economic 5 test', 'Check you knowledge in World Economic!', '2016-10-26 10:15:00'),
      (2, 3, 'Spanish 6 test', 'Check you knowledge, be smart!', '2018-02-04 11:43:00'),
      (8,11, 'Economic 7 test', 'Check you knowledge in World Economic!', '2015-10-26 10:15:00'),
      (2, 3, 'Spanish 8 test', 'Check you knowledge, be smart!', '2018-02-05 11:43:00'),
      (8,11, 'Economic 9 test', 'Check you knowledge in World Economic!', '2014-10-26 10:15:00'),
      (2, 3, 'Spanish 10 test', 'Check you knowledge, be smart!', '2018-02-06 13:43:00'),
      (8,11, 'Economic 11 test', 'Check you knowledge in World Economic!', '2012-10-26 10:15:00'),
      (2, 3, 'Spanish 12 test', 'Check you knowledge, be smart!', '2018-02-07 11:43:00'),
      (8,11, 'Economic 13 test', 'Check you knowledge in World Economic!', '2011-10-26 10:15:00'),
      (2, 3, 'Spanish 14 test', 'Check you knowledge, be smart!', '2018-02-08 11:43:00'),
      (8,11, 'Economic 15 test', 'Check you knowledge in World Economic!', '2010-10-26 10:15:00'),
      (2, 3, 'Spanish 16 test', 'Check you knowledge, be smart!', '2018-02-10 09:43:00'),
      (8,11, 'Economic 17 test', 'Check you knowledge in World Economic!', '2018-08-26 10:15:00'),
      (8,11, 'Economic 18 test', 'Check you knowledge in World Economic!', '2018-07-26 10:15:00'),
      (2, 3, 'Spanish 19 test', 'Check you knowledge, be smart!', '2018-02-10 11:42:00'),
      (8,11, 'Economic 20 test', 'Check you knowledge in World Economic!', '2018-06-26 10:15:00'),
      (2, 3, 'Spanish 21 test', 'Check you knowledge, be smart!', '2018-02-11 11:40:00'),
      (8,11, 'Economic 22 test', 'Check you knowledge in World Economic!', '2018-08-26 10:15:00'),
      (2, 3, 'Spanish  23 test', 'Check you knowledge, be smart!', '2018-02-12 11:07:00'),
      (8,11, 'Economic 24 test', 'Check you knowledge in World Economic!', '2018-06-26 10:15:00'),
      (2, 3, 'Spanish 25 test', 'Check you knowledge, be smart!', '2018-02-13 11:23:00'),
      (8,11, 'Economic 26 test', 'Check you knowledge in World Economic!', '2018-04-26 10:15:00'),
      (2, 3, 'Spanish 27 test', 'Check you knowledge, be smart!', '2018-02-14 11:21:00'),
      (8,11, 'Economic 28 test', 'Check you knowledge in World Economic!', '2018-03-26 10:15:00'),
      (2, 3, 'Spanish 29 test', 'Check you knowledge, be smart!', '2018-02-15 11:21:00'),
      (8,11, 'Economic 30 test', 'Check you knowledge in World Economic!', '2018-03-26 10:15:00'),
      (2, 3, 'Spanish 31 test', 'Check you knowledge, be smart!', '2018-02-16 11:43:00'),
      (8,11, 'Economic 32 test', 'Check you knowledge in World Economic!', '2018-10-25 10:15:00'),
      (8,11, 'Economic 33 test', 'Check you knowledge in World Economic!', '2018-10-24 10:15:00'),
      (2, 3, 'Spanish 34 test', 'Check you knowledge, be smart!', '2018-02-17 11:43:00'),
      (8,11, 'Economic 35 test', 'Check you knowledge in World Economic!', '2018-10-23 10:15:00'),
      (2, 3, 'Spanish 36 test', 'Check you knowledge, be smart!', '2018-02-18 11:43:00'),
      (8,11, 'Economic 37 test', 'Check you knowledge in World Economic!', '2018-10-22 10:15:00'),
      (2, 3, 'Spanish 38 test', 'Check you knowledge, be smart!', '2018-02-19 11:43:00'),
      (8,11, 'Economic 39 test', 'Check you knowledge in World Economic!', '2018-10-21 10:15:00'),
      (2, 3, 'Spanish 40 test', 'Check you knowledge, be smart!', '2018-02-20 11:43:00'),
      (8,11, 'Economic 41 test', 'Check you knowledge in World Economic!', '2018-10-20 10:15:00'),
      (2, 3, 'Spanish 42 test', 'Check you knowledge, be smart!', '2018-02-21 11:43:00'),
      (8,11, 'Economic 43 test', 'Check you knowledge in World Economic!', '2018-10-26 10:15:00'),
      (2, 3, 'Spanish 44 test', 'Check you knowledge, be smart!', '2018-02-22 11:43:00'),
      (8,11, 'Economic 45 test', 'Check you knowledge in World Economic!', '2018-10-26 10:15:00'),
      (2, 3, 'Spanish 46 test', 'Check you knowledge, be smart!', '2018-02-23 11:43:00'),
      (8,11, 'Economic 47 test', 'Check you knowledge in World Economic!', '2018-10-26 10:15:00'),
      (8,11, 'Economic 48 test', 'Check you knowledge in World Economic!', '2018-10-26 10:15:00'),
      (2, 3, 'Spanish 49 test', 'Check you knowledge, be smart!', '2018-02-24 11:43:00'),
      (8,11, 'Economic 50 test', 'Check you knowledge in World Economic!', '2018-10-26 10:15:00'),
      (2, 3, 'Spanish 51 test', 'Check you knowledge, be smart!', '2018-02-25 11:43:00'),
      (8,11, 'Economic 52 test', 'Check you knowledge in World Economic!', '2018-10-26 10:15:00'),
      (2, 3, 'Spanish 53 test', 'Check you knowledge, be smart!', '2018-02-26 11:43:00'),
      (8,11, 'Economic 54 test', 'Check you knowledge in World Economic!', '2018-10-26 10:15:00'),
      (2, 3, 'Spanish 55 test', 'Check you knowledge, be smart!', '2018-02-27 11:43:00'),
      (8,11, 'Economic 56 test', 'Check you knowledge in World Economic!', '2018-10-26 10:15:00'),
      (2, 3, 'Spanish 57 test', 'Check you knowledge, be smart!', '2018-02-28 11:43:00'),
      (8,11, 'Economic 58 test', 'Check you knowledge in World Economic!', '2018-10-26 10:15:00'),
      (2, 3, 'Spanish 59 test', 'Check you knowledge, be smart!', '2018-02-19 11:43:10'),
      (8,11, 'Economic 60 test', 'Check you knowledge in World Economic!', '2018-10-26 10:15:00'),
      (2, 3, 'Spanish 61 test', 'Check you knowledge, be smart!', '2018-02-15 11:43:11'),
      (8,11, 'Economic 62 test', 'Check you knowledge in World Economic!', '2018-10-26 10:15:00');


insert into `questions`(`test_id`, `description`)
values(1, 'When the chromosomes line up in mitosis this is known as which phase?'),
      (1, 'Which cellular organelle contains enzymes that are considered digestive?'),
      (1, 'Organs repair themselves through a process of?'),
      (1, 'Which of the following is considered a model for enzyme action?'),
      (1, 'Which of the following statements about enzymes is not true?'),
      (1, 'Which of the following statements about prostaglandins is not true?'),
      (1, 'Cholesterol that is known as (LDL) stands for:'),
      (1, 'Hardening of the arteries is known as:'),
      (1, 'Breathing properly requires the presence of what compound that affects surface tension of alveoli in the lungs?'),
      (1, 'Which of the following is not considered a function of the kidneys?'),
      (1, 'The functional unit of the kidney is known as?'),



      (1, 'What anatomical structure connects the stomach and the mouth?'),
      (2, 'Вопрос А'),
      (2, 'Вопрос B'),
      (2, 'Вопрос C'),
      (2, 'Вопрос D'),
      (3, 'Where might one find the Acropolis?'),
      (3, 'Where is Stonehenge located?'),
      (3, 'Near what Chinese city are the terracotta warriors buried?'),
      (3, 'Where might one go to see giant stone heads?'),
      (3, 'Where is Hadrian’s Wall?'),
      (3, 'Where is the Temple of the Tooth found?'),
      (3, 'Where was the Bastille?'),
      (3, 'Where would one find the Topkapi Palace?'),
      (3, 'In what city would one find the Brandenburg Gate?'),
      (3, 'Where might one find a leaning tower?'),
      (3, 'What is the capital of Pakistan?'),
      (3, 'What is the capital of Armenia?'),
      (3, 'What is the chief port of Israel?'),
      (3, 'What is the capital of Oman?'),
      (3, 'The gateway to the Persian Gulf or Gulf of Iran is the:'),
      (3, 'What is the capital of Saudi Arabia?'),
      (3, 'What is the capital of Tajikistan?'),
      (3, 'The highest mountain in Iran is:'),
      (3, 'Which of these seas does Iran border?'),
      (3, 'On what ocean does Oman lie?');


insert into `answers` (`question_id`, `description`, `correct`)
values(1, 'Telophase ', false),
      (1, 'Anaphase ', false),
      (1, 'Metaphase ', true),
      (1, 'Prophase', false),

      (2, 'Golgi Apparatus ', false),
      (2, 'Lysosomes ', true),
      (2, 'Nucleus ', false),
      (2, 'Ribosomes', false),

      (3, 'Meiosis ', false),
      (3, 'Mitosis ', true),
      (3, 'Cellular differentiation ', false),
      (3, 'Transformation ', false),

      (4, 'Lock and Key model ', true),
      (4, 'Enzyme interaction model', false),
      (4, 'Transformation model ', false),
      (4, 'Transcription model ', false),

      (5, 'Enzymes are catalysts.', false),
      (5, 'Almost all enzymes are proteins.', false),
      (5, 'Enzymes operate most efficiently at optimum pH. ', false),
      (5, 'Enzymes are destroyed during chemical reactions. ', true),

      (6, 'Prostaglandins promote inflammation. ', false),
      (6, 'Prostaglandins can only constrict blood vessels. ', true),
      (6, 'Prostaglandins are made in the renal medulla. ', false),
      (6, 'Prostaglandins can lead to pain and fever.', false),

      (7, 'Low-density lipoproteins', true),
      (7, 'Low-density lysosomes', false),
      (7, 'Level-density lipoproteins', false),
      (7, 'Level-density lysosomes', false),

      (8, 'Atheriosclerosis', true),
      (8, 'Venous narrowing', false),
      (8, 'Micro-circulation', false),
      (8, 'Hypertension', false),

      (9, 'Potassium ', true),
      (9, 'Plasma', false),
      (9, 'Surfactant', false),
      (9, 'Sodium Chloride', false),

      (10, 'Secretion', false),
      (10, 'Reabsorption', false),
      (10, 'Transport', true),
      (10, 'Filtration', false),

      (11, 'Medulla', false),
      (11, 'Glomerulus', false),
      (11, 'Pyramid', false),
      (11, 'Nephron', true),

      (12, 'Trachea', false),
      (12, 'Spinal column', false),
      (12, 'Hepatic duct', false),
      (12, 'Esophagus ', true),

      (13, 'Ответ A1 ', false),
      (13, 'Ответ A2 x', true),
      (13, 'Ответ A3 ', false),
      (13, 'Ответ A4 ', false),
      (13, 'Ответ A5 x', true),

      (14, 'Ответ B1 ', false),
      (14, 'Ответ B2 ', false),
      (14, 'Ответ B3 ', false),
      (14, 'Ответ B4 x', true),

      (15, 'Ответ C1 x', true),
      (15, 'Ответ C2 ', false),
      (15, 'Ответ C3 x', true),
      (15, 'Ответ C4 ', false),

      (16, 'Ответ D1 x', true),
      (16, 'Ответ D2 ', false),
      (16, 'Ответ D3 ', false),
      (16, 'Ответ D4 ', false),

      (17, 'Rome', false),
      (17, 'Beijing', false),
      (17, 'Moscow', false),
      (17, 'Athens', true),

      (18, 'England', true),
      (18, 'Estonia', false),
      (18, 'Stone Mountain', false),
      (18, 'Iceland', false),

      (19, 'Beijing', false),
      (19, 'Xian', true),
      (19, 'Nanjing', false),
      (19, 'Shanghai', false),

      (20, 'The Kremlin', false),
      (20, 'Stonehenge', false),
      (20, 'Cape Canaveral', false),
      (20, 'Easter Island', true),

      (21, 'England', true),
      (21, 'Italy', false),
      (21, 'Yemen', false),
      (21, 'France', false),

      (22, 'India', false),
      (22, 'Thailand', false),
      (22, 'France', false),
      (22, 'Sri Lanka', true),

      (23, 'New York', false),
      (23, 'Paris', true),
      (23, 'Rome', false),
      (23, 'London', false),

      (24, 'Istanbul', true),
      (24, 'Ismir', false),
      (24, 'Baghdad', false),
      (24, 'Berlin', false),

      (25, 'Vienna', false),
      (25, 'Paris', false),
      (25, 'Berlin', true),
      (25, 'London', false),

      (26, 'Pisa', true),
      (26, 'Katmandu', false),
      (26, 'Shanghai', false),
      (26, 'Montreal', false),

      (27, 'Karachi', false),
      (27, 'Lahore', false),
      (27, 'New Delhi', false),
      (27, 'Islamabad', true),

      (28, 'Yaoundé', false),
      (28, 'Yangon', false),
      (28, 'Yakutsk', false),
      (28, 'Yerevan', true),

      (29, 'Havana', false),
      (29, 'Edirna', false),
      (29, 'Aqaba', false),
      (29, 'Haifa', true),

      (30, 'Muscat', true),
      (30, 'Moscow', false),
      (30, 'Mandalay', false),
      (30, 'Montego', false),

      (31, 'Bering Strait', false),
      (31, 'Strait of Hormuz', true),
      (31, 'Strait of Malacca', false),
      (31, 'Torres Strait', false),

      (32, 'Mecca', false),
      (32, 'Cairo', false),
      (32, 'Jeddah', false),
      (32, 'Riyadh', true),

      (33, 'Almaty', false),
      (33, 'Samarqand', false),
      (33, 'Dushanbe', true),
      (33, 'Baku', false),

      (34, 'Mount Everest', false),
      (34, 'Pamir Mountain', false),
      (34, 'Mount Damavand', true),
      (34, 'Lenin Peak', false),

      (35, 'Caspian', true),
      (35, 'Sargasso', false),
      (35, 'Caribbean', false),
      (35, 'Mediterranean', false),

      (36, 'Atlantic', false),
      (36, 'Indian', true),
      (36, 'Southern', false),
      (36, 'Pacific', false);

SELECT * from answers;

select * from tests;

delete FROM `tests` where `id`="2";
select * from answers;
select * from questions;
delete FROM `subjects` where id="7";


select u.id, u.lastname as 'Last name', s.name as 'Subject', tests.description as 'Test', q.description as 'Question', a.description as 'Answer' from tests
JOIN users u on u.id = tests.tutor_id
JOIN subjects s on s.id = tests.subject_id
JOIN questions q on tests.id = q.test_id
JOIN answers a on a.question_id = q.id;

SET @dt = NOW();
select @dt;

select * from tests;

SELECT * FROM questions;

SELECT * FROM users;



SELECT answers.question_id as question_id, answers.id as answer_id FROM tests
INNER JOIN questions ON tests.id = questions.test_id
INNER JOIN answers ON questions.id = answers.question_id
WHERE tests.id = 71 AND answers.correct = TRUE
ORDER BY question_id;

create table `testing_results` (
  `student_id` int(11) not null,
  `question_id` bigint(11) not null,
  `correct` boolean,
  UNIQUE (`student_id`, `question_id`),
  FOREIGN KEY (`student_id`)
    REFERENCES `users` (`id`)
      ON DELETE CASCADE,
  FOREIGN KEY (`question_id`)
    REFERENCES `questions` (`id`)
      ON DELETE CASCADE
) ENGINE=InnoDB default charset=utf8 collate = utf8_general_ci;

select * from testing_results;