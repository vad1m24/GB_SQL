-- 2.	Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру)
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)

DROP PROCEDURE IF EXISTS positive_numbers;

DELIMITER //
CREATE PROCEDURE positive_numbers (numb INT)
BEGIN
	DECLARE result CHAR(30); DECLARE tmp CHAR(5); SET result = "";
    WHILE (numb <= 10) DO
		BEGIN
			IF (numb % 2 = 0) THEN
				IF (numb = 10) THEN
					SET tmp = numb;
				ELSE
					SET tmp = CONCAT(numb, ',');
				END IF;
                SET result = CONCAT(result, tmp);
			END IF;
            SET numb = numb + 1;
		END;
	END WHILE;
    SELECT result;
END //
DELIMITER ;
	
CALL positive_numbers(2);