/*
В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. 
Используйте транзакции. 
 */

TRUNCATE sample.users;

START TRANSACTION;

INSERT INTO users
SELECT * FROM
	(SELECT * FROM shop.users WHERE id = 1) AS dt
ON duplicate KEY UPDATE 
	id = LAST_INSERT_ID(sample.users.id), 
	sample.users.name = dt.name, 
	sample.users.birthday_at = dt.birthday_at, 
	sample.users.created_at = dt.created_at;

COMMIT;

SELECT * FROM users;