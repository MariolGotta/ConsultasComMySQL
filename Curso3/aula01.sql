SELECT * FROM alugueis;

SELECT * FROM avaliacoes;


SELECT AVG(nota) media, tipo
FROM avaliacoes a
JOIN hospedagens h
ON h.hospedagem_id=a.hospedagem_id
GROUP BY tipo;

SELECT * FROM alugueis;

SELECT tipo, SUM(preco_total) ValorTotal, MAX(preco_total) MarioValor, MIN(preco_total) MenorValor
FROM alugueis a
JOIN hospedagens h
ON h.hospedagem_id=a.hospedagem_id
GROUP BY tipo;

