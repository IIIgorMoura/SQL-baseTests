USE ClinicaVetBD;



-- INNER JOIN

SELECT P.nome, C.nome, telefone FROM tb_pets AS P INNER JOIN tb_clientes AS C ON P.id_clienteF = C.id_cliente;

SELECT data_atendimento, descricao, P.nome, V.nome FROM 
tb_atendimentos AS A INNER JOIN tb_pets AS P ON A.id_petF = P.id_pet 
INNER JOIN tb_veterinarios AS V ON A.id_veterinarioF = V.id_veterinario;

SELECT P.nome, V.nome FROM tb_atendimentos AS A 
INNER JOIN tb_pets AS P ON A.id_petF = P.id_pet
INNER JOIN tb_veterinarios AS V ON A.id_veterinarioF = V.id_veterinario;

SELECT id_atendimento, C.nome, P.nome, V.especialidade FROM tb_atendimentos AS A 
INNER JOIN tb_pets AS P ON A.id_petF = P.id_pet
INNER JOIN tb_veterinarios AS V ON A.id_veterinarioF = V.id_veterinario
INNER JOIN tb_clientes AS C ON P.id_clienteF = C.id_cliente;



-- LEFT JOIN

SELECT * FROM tb_clientes AS C LEFT JOIN tb_pets AS P ON C.id_cliente = P.id_clienteF;
SELECT * FROM tb_veterinarios AS V LEFT JOIN tb_atendimentos AS A ON V.id_veterinario = A.id_veterinarioF;



-- RIGHT JOIN

SELECT * FROM tb_clientes AS C RIGHT JOIN tb_pets AS P ON P.id_clienteF = C.id_cliente;
SELECT * FROM tb_veterinarios AS V RIGHT JOIN tb_atendimentos AS A ON V.id_veterinario = A.id_veterinarioF;