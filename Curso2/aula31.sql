USE `insight_places`;
DROP PROCEDURE IF EXISTS `insight_places`.`novoAluguel_31`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_31`(vAluguel VARCHAR(10), 
vClienteNome VARCHAR(150),
vHospedagem VARCHAR(10),
vDataInicio DATE,
vDataFinal DATE,
vPrecoUnitario DECIMAL(10,2)
)
BEGIN
	DECLARE vCliente VARCHAR(10);
	DECLARE vDias INTEGER DEFAULT 0;
    DECLARE VPrecoTotal DECIMAL(10,2);
    DECLARE vMensagem VARCHAR(100);
    DECLARE EXIT HANDLER FOR 1452
    BEGIN
		SET vMensagem = 'Problema de chave estrangeira associado a alguma entidade de base.';
        SELECT vMensagem;
    END;
    SET vDias = (SELECT DATEDIFF (vDataFinal, vDataInicio));
    SET vPrecoTotal = vDias * vPrecoUnitario;
    SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
    INSERT INTO alugueis VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal);
    SET vMensagem = 'Aluguel incluido com sucesso.';
    SELECT vMensagem;
END$$
DELIMITER ;



CALL novoAluguel_31('10006','Luana Moura','8635','2023-03-26','2023-03-30',40);
SELECT * FROM alugueis WHERE aluguel_id = '10006';