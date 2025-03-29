USE `insight_places`;
DROP PROCEDURE IF EXISTS `insight_places`.`novoAluguel_43`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_43`(
	vAluguel VARCHAR(10), 
	vClienteNome VARCHAR(150),
	vHospedagem VARCHAR(10),
	vDataInicio DATE,
	vDias INTEGER,
	vPrecoUnitario DECIMAL(10,2)
)
BEGIN
	DECLARE vCliente VARCHAR(10);
	DECLARE vDataFinal DATE;
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
        CALL calculaDataFinal_43 (vDataInicio, vDataFinal, vDias);
		SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
		CALL inclusao_cliente_43 (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vDias, vPrecoUnitario);
		SET vMensagem = 'Aluguel incluido na base com sucesso.';
		SELECT vMensagem;
	WHEN vNumCliente > 1 THEN
		SET vMensagem = 'Este cliente não pode ser usado para incluir o aluguel porque não existe.';
        SELECT vMensagem;
	END CASE;
END$$
DELIMITER ;


CALL novoAluguel_43('10011','Livia Fogaça','8635','2023-04-20',10,40);
SELECT * FROM alugueis WHERE aluguel_id = '10011'