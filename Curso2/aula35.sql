USE `insight_places`;
DROP PROCEDURE IF EXISTS `insight_places`.`novoAluguel_35`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_35`(vAluguel VARCHAR(10), 
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
		SET vDias = (SELECT DATEDIFF (vDataFinal, vDataInicio));
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

DELETE FROM alugueis WHERE aluguel_id = '10007';
CALL novoAluguel_35('10007','Victorino Vila','8635','2023-03-20','2023-04-04',40);
CALL novoAluguel_35('10007','Júlia Pires','8635','2023-03-20','2023-04-04',40);
CALL novoAluguel_35('10007','Luana Moura','8635','2023-03-20','2023-04-04',40);