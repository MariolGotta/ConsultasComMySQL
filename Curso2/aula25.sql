USE `insight_places`;
DROP PROCEDURE IF EXISTS `insight_places`.`novoAluguel_25`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_25`(vAluguel VARCHAR(10), 
vCliente VARCHAR(10),
vHospedagem VARCHAR(10),
vDataInicio DATE,
vDataFinal DATE,
vPrecoUnitario DECIMAL(10,2)
)
BEGIN
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
    INSERT INTO alugueis VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal);
    SET vMensagem = 'Aluguel incluido com sucesso.';
    SELECT vMensagem;
END$$
DELIMITER ;



CALL novoAluguel_25('10006','10004','8635','2023-03-17','2023-03-16',40);
