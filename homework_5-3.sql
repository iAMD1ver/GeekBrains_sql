/*
 (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
 Поля from, to и label содержат английские названия городов, поле name — русское. 
 Выведите список рейсов flights с русскими названиями городов.
 */

-- создаем таблицы

DROP DATABASE if EXISTS airport;
CREATE DATABASE airport;
USE airport;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  label VARCHAR(255) PRIMARY KEY COMMENT 'наименование на латинице',
  name VARCHAR(255) COMMENT 'наименование на кириллице'
) COMMENT = 'перевод';


DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  fr0m VARCHAR(255) COMMENT 'английское название города-отправления',
  t0 VARCHAR(255) COMMENT 'английское название города-направления',
  FOREIGN KEY (fr0m) REFERENCES cities(label) ON UPDATE CASCADE ON DELETE RESTRICT
) COMMENT = 'направления рейсов';


-- добавляем данные в соответствии с заданием


INSERT INTO cities VALUES
  ('moscow', 'Москва'),
  ('novgorod', 'Новгород'),
  ('irkutsk', 'Иркутск'),
  ('omsk', 'Омск'),
  ('kazan', 'Казань');
 
 INSERT INTO flights VALUES
  (NULL, 'moscow', 'omsk'),
  (NULL, 'novgorod', 'kazan'),
  (NULL, 'irkutsk', 'moscow'),
  (NULL, 'omsk', 'irkutsk'),
  (NULL, 'moscow', 'kazan');
 
SELECT 
	id,
	(SELECT name from cities where label in (flights.fr0m)) as 'from',
	(SELECT name from cities where label in (flights.t0)) as 'to'
FROM flights;

 



