CREATE DATABASE IF Not EXISTS home_work_task2;

-- 1. Используя операторы языка SQL, создайте таблицу “sales”. 

USE home_work_task2;

CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT *
FROM sales;

/* 2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  	-    Маленький заказ
от 100 до 300   -    Средний заказ
больше 300  	-    Большой заказ
*/

SELECT id AS 'id заказа',
CASE
	WHEN count_product < 100 THEN 'Маленький заказ'
    WHEN count_product > 300 THEN 'Большой заказ'
    ELSE 'Средний заказ'
END AS 'Тип заказа'
FROM sales;

SELECT id AS 'id заказа',
IF (count_product < 100, 'Маленький заказ',
	IF (count_product < 300, 'Средний заказ', 'Большой заказ'))
AS "Тип заказа"
FROM sales;

/* 3. Создайте таблицу “orders”, заполните ее значениями.
	  Выберите все заказы. 
	  В зависимости от поля order_status выведите столбец full_order_status:
	  OPEN – «Order is in open state» ; 
	  CLOSED - «Order is closed»; 
	  CANCELLED -  «Order is cancelled»
*/

CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(5) NOT NULL,
    amount DECIMAL (5, 2) NOT NULL,
    order_status TEXT NOT NULL
);
    
INSERT orders (employee_id, amount, order_status)
VALUES
('e03', 15, 'OPEN'),
('e01', 25.5, 'OPEN'),
('e05', 100.7, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.5, 'CANCELLED');

SELECT id, employee_id,amount, order_status,
CASE
	WHEN order_status = 'OPEN' THEN 'Order is in open state'
    WHEN order_status = 'CLOSED' THEN 'Order is closed'
    WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
    ELSE 'Error 404'
END AS 'full_order_status'
FROM orders;
