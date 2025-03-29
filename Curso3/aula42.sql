
DELIMITER $$

CREATE FUNCTION CalculaDuracaoMediaEstadias() RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE duracaoMedia INT;
    SELECT ROUND(AVG(DATEDIFF(data_fim, data_inicio))) INTO duracaoMedia FROM alugueis;
    RETURN duracaoMedia;
END$$

DELIMITER ;


SELECT CalculaDuracaoMediaEstadias();
