USE insightplaces;
CREATE TABLE resumo_aluguel (
	aluguel_id VARCHAR(255),
    cliente_id VARCHAR(255),
    valortotal DECIMAL(10,2),
    descontoaplicado DECIMAL(10,2),
    valorfinal DECIMAL(10,2),
    PRIMARY KEY (aluguel_id, cliente_id),
    FOREIGN KEY (aluguel_id) REFERENCES alugueis(aluguel_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);


DELIMITER $$
CREATE TRIGGER AtualizarResumoAluguel
AFTER INSERT ON alugueis
FOR EACH ROW 
BEGIN
DECLARE Desconto INT;
DECLARE ValorFinal DECIMAL(10,2);
SET Desconto = CalcularDescontoPorDias(NEW.aluguel_id);
SET ValorFinal = CalcularValorFinalComDesconto(NEW.aluguel_id);
INSERT INTO resumo_aluguel(aluguel_id, cliente_id, valortotal, descontoaplicado, valorfinal)
VALUES (NEW.aluguel_id, NEW.cliente_id, NEW.preco_total, Desconto, ValorFinal);

END $$



select * from resumo_aluguel;
select * from alugueis;

INSERT INTO alugueis (aluguel_id, cliente_id, hospedagem_id, data_inicio, data_fim, preco_total)
VALUES (10001, 42, 15, '2024-01-01', '2024-01-08', 3000.00);