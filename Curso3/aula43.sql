

DELIMITER $$

CREATE FUNCTION CalcularValorFinalComDesconto(AluguelID INT)
RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN

DECLARE ValorTotal DECIMAL(10,2);
DECLARE Desconto INT;
DECLARE ValorFinal DECIMAL(10,2);

SELECT preco_total INTO ValorTotal FROM alugueis WHERE aluguel_id = AluguelID;

SET Desconto = CalcularDescontoPorDias(AluguelID);
SET ValorFinal = ValorTotal - (ValorTotal * Desconto / 100);

RETURN ValorFinal;

END$$

DELIMITER ;


SELECT CalcularValorFinalComDesconto(1);