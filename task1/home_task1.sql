USE home_work_task1;

/* 
1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
Заполните БД данными.
*/

SELECT *
FROM phones;

/*
2. 	Выведите название, производителя и цену для товаров, количество которых превышает 2
*/

SELECT product_name, manufacturer, price
FROM phones
WHERE product_count > 2;

/*
3. Выведите весь ассортимент товаров марки “Samsung”
*/

SELECT *
FROM phones
WHERE manufacturer = 'Samsung';

/*
4. 	Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000
*/

SELECT *
FROM phones
WHERE product_count * price > 1000 AND product_count * price < 3000;

/*
4.*** С помощью регулярных выражений найти 
(можно использовать операторы “LIKE”, “RLIKE” для 4.3):
*/
-- 4.1. Товары, в которых есть упоминание "Iphone"

SELECT *
FROM phones
WHERE product_name LIKE 'iPhone%';

-- 4.2. Товары, в которых есть упоминание "Galaxy"

SELECT *
FROM phones
WHERE product_name LIKE 'Galaxy%';

-- 4.3. Товары, в которых есть ЦИФРЫ

SELECT *
FROM phones
WHERE product_name RLIKE ('[0-9]');

-- 4.4. Товары, в которых есть ЦИФРА "8"  

SELECT *
FROM phones
WHERE product_name RLIKE ('8');
