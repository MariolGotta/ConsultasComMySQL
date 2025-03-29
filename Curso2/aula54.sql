-- temp_nomes (nome)

DROP TEMPORARY TABLE IF EXISTS temp_nomes;
CREATE TEMPORARY TABLE temp_nomes (nome VARCHAR(255));
CALL inclui_usuarios_lista_52('João,Pedro,Maria,Lucia,Joana,Beatriz');
SELECT * FROM temp_nomes;
CALL looping_cursor_54();