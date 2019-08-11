/*
Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
 */

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = 'Заказы';

INSERT INTO orders VALUES
	(NULL, 1, DEFAULT, DEFAULT),
	(NULL, 1, DEFAULT, DEFAULT),
	(NULL, 3, DEFAULT, DEFAULT),
	(NULL, 6, DEFAULT, DEFAULT);
	

INSERT INTO users VALUES
	(NULL, 'John', '1992-12-20', DEFAULT, DEFAULT),
	(NULL, 'Ien', '1991-11-17', DEFAULT, DEFAULT),
	(NULL, 'Erica', '1958-08-21', DEFAULT, DEFAULT),
	(NULL, 'Daddy', '1960-12-08', DEFAULT, DEFAULT),
	(NULL, 'Joi', '1952-03-31', DEFAULT, DEFAULT),
	(NULL, 'Alfred', '1984-09-09', DEFAULT, DEFAULT);

SELECT id, name, birthday_at 
FROM users
WHERE id IN (SELECT user_id FROM orders);



