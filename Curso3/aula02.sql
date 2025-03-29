
SELECT * FROM clientes;


SELECT CONCAT(TRIM(nome), ', O email é: ',contato) NomeContato FROM clientes;

SELECT * FROM clientes;

SELECT
	TRIM(nome) Nome,
	CONCAT(SUBSTRING(cpf,1,3), '.', SUBSTRING(cpf,4,3), '.', SUBSTRING(cpf,7,3), '-', SUBSTRING(cpf,10,2)) AS CPF_Mascarado
FROM
	clientes;
    
    
    SELECT TRIM(nome) AS Nome, DATEDIFF(data_fim, data_inicio) AS TotalDias 
    FROM alugueis a
    JOIN clientes c
    ON a.cliente_id = c.cliente_id;
    
    
    SELECT tipo, SUM(DATEDIFF(data_fim, data_inicio)) AS TotalDias 
    FROM alugueis a
    JOIN hospedagens h
    ON a.hospedagem_id = h.hospedagem_id
    GROUP BY tipo;
    
    
    