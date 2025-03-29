USE `insight_places`;
DROP PROCEDURE IF EXISTS `insight_places`.`inclui_usuarios_lista_52`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `inclui_usuarios_lista_52`(lista VARCHAR(255))
BEGIN
	DECLARE nome VARCHAR(255);
    DECLARE restante VARCHAR(255);
    DECLARE pos INTEGER;
    SET restante = lista;
    WHILE INSTR(restante,',') > 0 DO
		SET pos = INSTR(restante,',');
        SET nome = LEFT(restante, pos - 1);
        INSERT INTO temp_nomes VALUES (nome);
        SET restante = SUBSTRING(restante, pos + 1);
	END WHILE;
    IF TRIM(restante) <> '' THEN
		INSERT INTO temp_nomes VALUES (TRIM(restante));
	END IF;
END