CREATE DATABASE db_empresa;

USE db_empresa;

CREATE TABLE tb_clientes (
	id INT auto_increment primary key,
    nome varchar(100) NOT NULL,
    email VARCHAR(100),
    preferencias JSON
);

INSERT INTO tb_clientes(nome, email, preferencias) VALUES
('Juan', 'a@a.com', '{"interesses": ["livros", "computacao"], "notificacoes": true}'),
('Nicolau', 'nik@a.com', '{"interesses": ["programacao", "C#"], "notificacoes": false}');

SELECT * FROM tb_clientes
WHERE preferencias='{"interesses": ["livros", "computacao"], "notificacoes": false}';

SELECT * FROM tb_clientes
	-- condição, objetivo
WHERE JSON_CONTAINS(preferencias->'$.interesses', '"programacao"');

SELECT nome, JSON_EXTRACT(preferencias, '$.interesses') FROM tb_clientes
WHERE JSON_EXTRACT(preferencias, '$.notificacoes') = false;

SELECT nome, JSON_EXTRACT(preferencias, '$.interesses') AS interesses
FROM tb_clientes
WHERE JSON_EXTRACT(preferencias, '$.notificacoes') = true;

SELECT nome, JSON_EXTRACT(preferencias, '$.interesses[0]') AS interesse1
FROM tb_clientes;

SELECT nome, JSON_KEYS(preferencias) FROM tb_clientes;
SELECT JSON_TYPE(preferencias->'$.interesses') FROM tb_clientes;
SELECT JSON_TYPE(preferencias->'$.interesses[0]') FROM tb_clientes;
