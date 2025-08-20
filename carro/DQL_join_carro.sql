USE db_carro;

-- INNER JOIN
SELECT * FROM tb_proprietario AS P
INNER JOIN tb_carro AS C
ON P.id_carroF = C.id_carro; 

-- da para filtrar em conjunto, das 2 tabelas
SELECT nome, idade, marca, modelo, ano FROM tb_proprietario AS P
INNER JOIN tb_carro AS C
ON P.id_carroF = C.id_carro; 

-- filtro ainda mais específico
SELECT nome, idade, marca, modelo, ano FROM tb_proprietario AS P
INNER JOIN tb_carro AS C
ON P.id_carroF = C.id_carro WHERE ano > 2000; 


SELECT * FROM tb_proprietario AS P
LEFT JOIN tb_carro AS C
ON P.id_carroF = C.id_carro; 

SELECT * FROM tb_proprietario AS P
RIGHT JOIN tb_carro AS C
ON P.id_carroF = C.id_carro;

