create table IF NOT EXISTS `users` (
  `user_id` int(11) not null auto_increment,
  `first_name` varchar(50) not null,
  `last_name` varchar(50) not null,
  `email` varchar(50) not null,
  `role` int(11) not null,
  `username` varchar(50) not null,
  `password` varchar(200) not null,
  `verified` BOOLEAN NOT NULL DEFAULT FALSE,
  primary key (`user_id`),
  unique key `username_unique` (`username`)
  ) ENGINE=InnoDB default charset=utf8mb4 collate = utf8mb4_general_ci;

delete from users;

insert into `users`(`first_name`, `last_name`, `email`, `role`, `username`, `password`, `verified`)
VALUES('Bob', 'Smith', 'bob@gmail.com', 1, 'bob', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true),
      ('Alex', 'McDonald', 'alex@gmail.com', 2, 'alex', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true),
      ('Mary', 'Peak', 'mary@gmail.com', 1, 'mary', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true),
      ('Ann', 'Angry', 'ann@gmail.com', 2, 'ann', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true),
      ('Jack', 'Crazy', 'jack@gmail.com', 1, 'jack', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true),
      ('Nelson', 'Mandela', 'nelson@gmail.com', 2, 'nelson', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true),
      ('Berny', 'Black', 'barny@gmail.com', 1, 'barny', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true),
      ('Den', 'Forest', 'den@gmail.com', 2, 'den', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true),
      ('Mike', 'Sky', 'mike@gmail.com', 1, 'mike', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true),
      ('Iren', 'Gamp', 'iren0@gmail.com', 1, 'iren', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true),
      ('Fredy', 'White', 'fredy@gmail.com', 1, 'fredy', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true),
      ('John', 'McKey', 'john@gmail.com', 2, 'john', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true),
      ('Lucy', 'Love', 'lucy@gmail.com', 2, 'lucy', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true),
      ('Piter', 'Hangry', 'piter@gmail.com', 2, 'piter', '1000:786d40c39bac1d22d8226b5bf8e85237:f5fa5407b575911a2e0a99362f1c015b2ea033dac835883dd378c3fafde09b0baefced99993e92bb6b37d6174a95ac4a5ffaf8344a082863b61633632b526c36', true);
