USE `insight_places`;
DROP PROCEDURE IF EXISTS `insight_places`.`novoAluguel_41`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_41`(vAluguel VARCHAR(10), 
vClienteNome VARCHAR(150),
vHospedagem VARCHAR(10),
vDataInicio DATE,
vDias INTEGER,
vPrecoUnitario DECIMAL(10,2)
)
BEGIN
	DECLARE vCliente VARCHAR(10);
	DECLARE vDataFinal DATE;
    DECLARE VPrecoTotal DECIMAL(10,2);
    DECLARE vNumCliente INTEGER;
    DECLARE vMensagem VARCHAR(100);
    DECLARE EXIT HANDLER FOR 1452
    BEGIN
		SET vMensagem = 'Problema de chave estrangeira associado a alguma entidade de base.';
        SELECT vMensagem;
    END;
    SET vNumCliente = (SELECT COUNT(*) FROM clientes WHERE nome = vClienteNome);
    CASE 
    WHEN vNumCliente = 0 THEN
		SET vMensagem = 'Este cliente não pode ser usado para incluir o aluguel porque não existe.';
        SELECT vMensagem;
	WHEN vNumCliente = 1 THEN
		-- SET vDias = (SELECT DATEDIFF (vDataFinal, vDataInicio));
        SET vDataFinal = (SELECT vDataInicio + INTERVAL vDias DAY) ;
		SET vPrecoTotal = vDias * vPrecoUnitario;
		SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
		INSERT INTO alugueis VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal);
		SET vMensagem = 'Aluguel incluido com sucesso.';
		SELECT vMensagem;
	WHEN vNumCliente > 1 THEN
		SET vMensagem = 'Este cliente não pode ser usado para incluir o aluguel porque não existe.';
        SELECT vMensagem;
	END CASE;
END$$
DELIMITER ;


CALL novoAluguel_41('10008','Rafael Peixoto','8635','2023-04-05',5,40);
SELECT * FROM alugueis WHERE aluguel_id = '10008'