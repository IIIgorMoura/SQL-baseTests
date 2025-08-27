
-- Qnd precisa trazer tds Vets, mais o q tiver de atendimentos, linkando pelo id do veterinario
USE ClinicaVetBD;

SELECT * FROM tb_veterinarios AS V
LEFT JOIN tb_atendimentos AS A
ON id_veterinario = id_veterinarioF;

-- 1
SELECT P.nome, C.nome, telefone
FROM tb_pets AS P
INNER JOIN tb_clientes AS C
ON id_clienteF = id_cliente;

-- 2
SELECT * FROM tb_clientes AS C
LEFT JOIN tb_pets
ON id_cliente = id_clienteF;

-- 3
-- RIGHT não é o ideal para visualização, mas a utilização única de cada é um requisito da atividade
SELECT * FROM tb_veterinarios AS V
RIGHT JOIN tb_atendimentos AS A
ON id_veterinarioF = id_veterinario;



-- 4 exes base
-- 1
