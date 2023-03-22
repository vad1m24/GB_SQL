DROP DATABASE IF EXISTS home_work_task3;
CREATE DATABASE IF NOT EXISTS home_work_task3;
USE lesson3;

-- Вывожу всю таблицу для проверки взаимодействия
SELECT *
FROM staff;

-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания для каждой группы
SELECT
	first_name AS 'Имя',
	last_name AS 'Фамилия',
    age AS 'Возраст',
	post AS 'Должность',
    salary AS 'ЗП'
FROM staff
ORDER BY post, salary DESC;

SELECT
	first_name AS 'Имя',
	last_name AS 'Фамилия',
    age AS 'Возраст',
	post AS 'Должность',
    salary AS 'ЗП'
FROM staff
ORDER BY post, salary;

-- Выведите 5 максимальных заработных плат (saraly)
SELECT
	first_name AS 'Имя',
	last_name AS 'Фамилия',
    age AS 'Возраст',
	post AS 'Должность',
    salary AS 'ЗП'
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT
	post AS 'Должность',
    SUM(salary) AS 'Суммарная зп'
FROM staff
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT
	post AS 'Должность',
    MIN(age) AS 'MIN Возраст',
    MAX(age) AS 'MAX Возраст',
    COUNT(age) AS 'Количество сотрудников'
FROM staff
WHERE post LIKE 'Рабочий%' AND age BETWEEN 24 AND 49
GROUP BY post;

-- Найдите количество специальностей
SELECT COUNT(DISTINCT post) AS 'Количество должностей'
FROM staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT
	post,
    ROUND(AVG(age)) AS 'Cредний возраст сотрудников'
FROM staff
GROUP BY post
HAVING AVG(age) < 30;
