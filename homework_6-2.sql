/*
Создайте представление, которое выводит название name товарной позиции из таблицы products 
и соответствующее название каталога name из таблицы catalogs. 
 */

-- создаем таблицы
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет магазина';

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  desription TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

-- добавляем данные в соответствии с заданием
INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

INSERT INTO products VALUES
  (DEFAULT, 'AMD Athlon X4 840 OEM', 'FM2+, 4 x 3100 МГц, L2 - 4 МБ, 2хDDR3-2133 МГц, TDP 65 Вт', 1599.00, 1, DEFAULT, DEFAULT),
  (DEFAULT,'Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1, DEFAULT, DEFAULT),
  (DEFAULT,'Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1, DEFAULT, DEFAULT),
  (DEFAULT,'AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1, DEFAULT, DEFAULT),
  (DEFAULT,'AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1, DEFAULT, DEFAULT),
  (DEFAULT,'ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2, DEFAULT, DEFAULT),
  (DEFAULT,'Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2, DEFAULT, DEFAULT),
  (DEFAULT,'MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2, DEFAULT, DEFAULT);

 -- создаем представление
CREATE OR REPLACE VIEW prod_cat (product, catalogs)
AS SELECT p.name, c.name 
FROM products AS p
JOIN catalogs AS c
ON p.catalog_id = c.id
ORDER BY p.name;

-- запрос на вывод информации из представления
SELECT * FROM prod_cat;