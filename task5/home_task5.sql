DROP DATABASE IF EXISTS home_work_task5;
CREATE DATABASE IF NOT EXISTS home_work_task5;
USE home_work_task5;

/*
	1.1 С помощью сайта https://www.mockaroo.com/ сгенерировать таблицу с данными по авто
    1.2 В sql файле создать пустую таблицу "cars" с полями авто (id, car_names, price)
    1.3 Подгрузить сгенерированную таблицу в созданную ("cars") и отобразить содержимое
*/

SHOW SESSION VARIABLES LIKE 'secure_file_priv';
SHOW GLOBAL VARIABLES LIKE 'secure_file_priv';
SET GLOBAL local_infile='ON';
SHOW GLOBAL VARIABLES LIKE 'local_infile';

DROP TABLE IF EXISTS cars;
CREATE TABLE IF NOT EXISTS cars
(
	id INT ,
    car_names VARCHAR(20) NOT NULL,
    price INT NOT NULL
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cars.csv' INTO TABLE cars
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES ;

SELECT * FROM cars;

-- 2. Создать представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE OR REPLACE VIEW hot_wheels AS
SELECT 
	car_names AS 'Наименование',
    price AS 'Стоимость'
FROM cars
WHERE price < 25000
ORDER BY price;

SELECT * FROM hot_wheels;

-- 3. Изменить в существующем представлении порог для стоимости: пусть цена будет от 20 000 до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW hot_wheels AS
SELECT 
	car_names AS 'Наименование',
    price AS 'Стоимость'
FROM cars
WHERE price BETWEEN 20000 AND 30000
ORDER BY price;

SELECT * FROM hot_wheels;

-- 4. Создайте представление, в котором будут только автомобили марки “Форд” и “Ауди” стоимостью от 5 000 до 10 000 долларов 

ALTER VIEW hot_wheels AS
SELECT 
	car_names AS 'Наименование',
    price AS 'Стоимость'
FROM cars
WHERE car_names = 'Ford' OR car_names = 'Audi'
HAVING price BETWEEN 5000 AND 10000
ORDER BY car_names;

SELECT * FROM hot_wheels;


