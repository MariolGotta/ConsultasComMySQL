SELECT 
	cliente_id, 
    data_inicio, 
    data_fim, 
    DATEDIFF(data_fim,data_inicio) AS TotalDias,
    CASE   
		WHEN DATEDIFF(data_fim, data_inicio) BETWEEN 4 AND 6 THEN 5         
		WHEN DATEDIFF(data_fim, data_inicio) BETWEEN 7 AND 9 THEN 10         
		WHEN DATEDIFF(data_fim, data_inicio) >=10 THEN 15         
		ELSE 0 
	END AS DescontoPercentual
    FROM alugueis;

DELIMITER $$
CREATE FUNCTION CalcularDescontoPorDias(AluguelID INT) 
RETURNS INT DETERMINISTIC 
BEGIN 
DECLARE Desconto INT;
SELECT     
	CASE   
		WHEN DATEDIFF(data_fim, data_inicio) BETWEEN 4 AND 6 THEN 5         
		WHEN DATEDIFF(data_fim, data_inicio) BETWEEN 7 AND 9 THEN 10         
		WHEN DATEDIFF(data_fim, data_inicio) >=10 THEN 15         
		ELSE 0  
	END      
	INTO desconto 
FROM alugueis 
WHERE aluguel_id = AluguelID;  
RETURN desconto; 
END$$

DELIMITER ;
