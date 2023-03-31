-- 1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS convertation_numbers_in_time;

DELIMITER //
CREATE FUNCTION convertation_numbers_in_time (seconds INT)
RETURNS CHAR(100)
DETERMINISTIC 
BEGIN
	DECLARE days, hours, minutes INT DEFAULT 0;
    DECLARE sec_in_minutes INT DEFAULT 60;
    DECLARE min_in_hours INT DEFAULT 60;
    DECLARE hours_in_days INT DEFAULT 24;
    
    SET minutes = seconds DIV sec_in_minutes;
    SET seconds = seconds % sec_in_minutes;
    SET hours = minutes DIV min_in_hours;
    SET minutes = minutes % min_in_hours;
    SET days = hours DIV hours_in_days;
    SET hours = hours % hours_in_days;
    RETURN concat(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds ');    
END //
DELIMITER ;

SELECT convertation_numbers_in_time(1234567) AS "Ваш результат конвертации";