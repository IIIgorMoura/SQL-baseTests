USE db_carro;

-- Preco acima da media

-- Calc media
SELECT AVG(valor) FROM tb_carro;

-- Subquerie de AVG onde 
SELECT * FROM tb_carro WHERE valor > (SELECT AVG(valor) FROM tb_carro);

-- 1

