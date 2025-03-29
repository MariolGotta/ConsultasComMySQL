SELECT * FROM hospedagens;

DELIMITER $$
CREATE FUNCTION QuantidadeHospedagem(TipoHospedagem VARCHAR(255))
RETURNS INT DETERMINISTIC
BEGIN
DECLARE Qtdade INT;
SELECT COUNT(*) INTO Qtdade
FROM hospedagens
WHERE tipo = TipoHospedagem;

RETURN Qtdade;
END$$
DELIMITER ;

SELECT COUNT(*) FROM hospedagens;
SELECT QuantidadeHospedagem('apartamento')