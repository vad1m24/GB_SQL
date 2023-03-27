DROP DATABASE IF EXISTS task4_3;
CREATE DATABASE IF NOT EXISTS task4_3;
USE task4_3;

CREATE TABLE IF NOT EXISTS test_a
(
	id INT,
    data varchar(45)
);

CREATE TABLE IF NOT EXISTS test_b
(
	id INT
);

INSERT INTO test_a (id, data)
VALUES(10, 'A'), (20, 'A'), (30, 'F'), (40, 'D'), (50, 'C');

INSERT INTO test_b (id) 
VALUES(10), (30), (50);

/*
Напишите запрос, который вернет строки из таблицы test_a, 
id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
*/

SELECT test_a.id, data FROM test_a
LEFT JOIN test_b ON test_a.id = test_b.id
WHERE test_b.id IS NULL;