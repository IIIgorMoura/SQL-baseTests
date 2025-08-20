USE ClinicaVetBD;

-- 1
SELECT nome, data_nascimento 
FROM tb_pets 
WHERE data_nascimento = (SELECT min(data_nascimento) FROM tb_pets);

-- 2
SELECT nome, data_nascimento 
FROM tb_pets 
WHERE data_nascimento = (SELECT max(data_nascimento) FROM tb_pets);

-- 3
SELECT V.nome, data_atendimento 
FROM tb_atendimentos AS A
INNER JOIN tb_veterinarios AS V
ON A.id_veterinarioF = V.id_veterinario 
WHERE data_atendimento = (SELECT max(data_atendimento) FROM tb_atendimentos);

-- 4
SELECT C.nome, 
(SELECT count(*) FROM tb_pets AS P WHERE P.id_clienteF = C.id_cliente) AS qnt_pets
FROM tb_clientes AS C
WHERE (SELECT count(*) FROM tb_pets AS P WHERE P.id_clienteF = C.id_cliente > 1);

-- 5
SELECT nome FROM tb_pets WHERE id_pet NOT IN (SELECT id_petF FROM tb_atendimentos);

-- 6
SELECT C.nome, 
(SELECT count(*) FROM tb_pets AS P WHERE P.id_clienteF = C.id_cliente) AS qnt_pets
FROM tb_clientes AS C;

-- 7
SELECT * FROM tb_veterinarios AS V
INNER JOIN tb_atendimentos AS A
WHERE id_veterinario = (SELECT max(id_veterinario) FROM tb_veterinarios);

-- 8
SELECT * FROM tb_atendimentos 
WHERE data_atendimento = (SELECT min(data_atendimento) FROM tb_atendimentos);

-- 9
SELECT C.nome FROM tb_clientes AS C
INNER JOIN tb_pets AS P
ON P.id_clienteF = C.id_cliente
WHERE id_pet IN (
	SELECT id_petF 
	FROM tb_atendimentos GROUP BY id_petF
	HAVING COUNT(DISTINCT id_veterinarioF) >= 2
);

-- 10
SELECT P.nome
FROM tb_pets AS P
INNER JOIN tb_atendimentos AS A ON P.id_pet = A.id_petF
WHERE A.id_veterinarioF = (
    SELECT id_veterinarioF
    FROM tb_atendimentos
    GROUP BY id_veterinarioF
    ORDER BY COUNT(id_veterinarioF) DESC
    LIMIT 1
);
