USE db_carro;

/* Para qualquer consulta, usa SELECT */ 
SELECT * FROM tb_carro;
SELECT cor FROM tb_carro;
SELECT modelo, cor FROM tb_carro;
SELECT * FROM tb_carro WHERE cor = "brANco";
SELECT * FROM tb_carro WHERE modelo = "Palio";

/* Trazer um valor específico relevante */
SELECT min(valor) FROM tb_carro;
SELECT max(ano) FROM tb_carro;
SELECT count(id_carro) FROM tb_carro;
SELECT sum(valor) FROM tb_carro;

/* ordenação função */
SELECT * FROM tb_carro ORDER BY modelo ASC;
SELECT * FROM tb_carro ORDER BY marca DESC;

SELECT * FROM tb_carro WHERE ano >= 1980 && ano <= 2000;
SELECT count(ano) FROM tb_carro WHERE ano >= 1980 && ano <= 2000;
-- Selecionando entre valores de ano, separando por marca e Renomeando com AS
SELECT count(ano) AS 'Total Registros', marca FROM tb_carro WHERE ano BETWEEN "1980" AND "2000" GROUP BY marca;

SELECT count(ano) AS "Total de Registros do ano", marca FROM tb_carro WHERE ano = '1988' GROUP BY marca;
