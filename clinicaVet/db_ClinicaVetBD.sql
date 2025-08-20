CREATE DATABASE ClinicaVetBD;
USE ClinicaVetBD;


-- DDL


CREATE TABLE tb_veterinarios (
	id_veterinario INT(4) UNIQUE NOT NULL,
    nome VARCHAR(128),
    especialidade VARCHAR(128),
    telefone VARCHAR (15),
    PRIMARY KEY (id_veterinario)
);

CREATE TABLE tb_clientes (
	id_cliente INT(4) UNIQUE NOT NULL,
    nome VARCHAR(128),
    endereco VARCHAR(256),
    telefone VARCHAR(15),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE tb_pets (
	id_pet INT(4) UNIQUE NOT NULL,
    nome VARCHAR(128),
    tipo VARCHAR(64),
    raca VARCHAR(64),
    data_nascimento DATE,
    PRIMARY KEY (id_pet),
    id_clienteF INT(4) NOT NULL,
    FOREIGN KEY (id_clienteF) REFERENCES tb_clientes(id_cliente)
);

CREATE TABLE tb_atendimentos (
	id_atendimento INT(10) UNIQUE NOT NULL,
    data_atendimento DATE,
    descricao VARCHAR(1028),
    PRIMARY KEY (id_atendimento),
    id_petF INT(4) NOT NULL,
    FOREIGN KEY (id_petF) REFERENCES tb_pets(id_pet),
    id_veterinarioF INT(4) NOT NULL,
    FOREIGN KEY (id_veterinarioF) REFERENCES tb_veterinarios(id_veterinario)
);

SELECT * FROM tb_pets;


-- DML



-- VETERINARIO
INSERT INTO tb_veterinarios(id_veterinario, nome, especialidade, telefone) VALUES (
	'1',
    'José Eduardo',
    'Ortopedia',
    '(11) 97957-4643'
);
INSERT INTO tb_veterinarios(id_veterinario, nome, especialidade, telefone) VALUES (
	'2',
    'José Manuel',
    'Acupuntura',
    '(11) 87654-3456'
);
INSERT INTO tb_veterinarios(id_veterinario, nome, especialidade, telefone) VALUES (
	'3',
    'José Henrique',
    'Medicina Canina',
    '(11) 99946-4664'
);



-- CLIENTE
INSERT INTO tb_clientes(id_cliente, nome, endereco, telefone) VALUES (
	'1',
    'Gustavo Lima',
    'Rua 1',
    '(11) 95793-6835'
);
INSERT INTO tb_clientes(id_cliente, nome, endereco, telefone) VALUES (
	'2',
    'Pedro Ferreira',
    'Rua 2',
    '(11) 94763-6836'
);
INSERT INTO tb_clientes(id_cliente, nome, endereco, telefone) VALUES (
	'3',
    'Luan Santana',
    'Rua Criatividade',
    '(11) 96364-5683'
);
SELECT * FROM tb_clientes;



-- PET
INSERT INTO tb_pets(id_pet, nome, tipo, raca, data_nascimento, id_clienteF) VALUES (
	'1',
    'Arrasador de Universos',
    'Cachorro',
    'Pinscher',
    '2025-04-16',
    '3'
);
INSERT INTO tb_pets(id_pet, nome, tipo, raca, data_nascimento, id_clienteF) VALUES (
	'2',
    'Princeso',
    'Cachorro',
    'American Bully',
    '2012-12-29',
    '2'
);
INSERT INTO tb_pets(id_pet, nome, tipo, raca, data_nascimento, id_clienteF) VALUES (
	'3',
    'Paraguaio',
    'Papagaio',
    'Papagaio-do-mangue',
    '1918-01-02',
    '1'
);



-- ATENDIMENTO
INSERT INTO tb_atendimentos(id_atendimento, data_atendimento, descricao, id_petF, id_veterinarioF) VALUES (
	'1',
    '2025-06-29',
    'Procedimento para injeção de trembolona',
    '2',
    '3'
);
INSERT INTO tb_atendimentos(id_atendimento, data_atendimento, descricao, id_petF, id_veterinarioF) VALUES (
	'2',
    '2025-03-16',
    'Check-up pós natal',
    '1',
    '3'
);
INSERT INTO tb_atendimentos(id_atendimento, data_atendimento, descricao, id_petF, id_veterinarioF) VALUES (
	'3',
    '2020-05-20',
    'Aula de Inglês',
    '3',
    '1'
);
SELECT * FROM tb_veterinarios;



-- Update: Correções de "Erro"
UPDATE tb_clientes SET endereco = 'Rua 1', telefone = '(11) 98765-4321' WHERE id_cliente = '1';
UPDATE tb_atendimentos SET data_atendimento = '2025-05-16' WHERE id_atendimento = '1';
UPDATE tb_pets SET nome = 'Juan' WHERE id_pet = '3';
UPDATE tb_atendimentos SET descricao = 'Aula de Geografia' WHERE id_atendimento = '3';
UPDATE tb_veterinarios SET telefone = '(21) 98763-5432' WHERE id_veterinario = '3';



-- DQL



SELECT min(data_nascimento) AS 'PET MAIS VELHO' FROM tb_pets;
SELECT max(data_nascimento) AS 'PET MAIS NOVO' FROM tb_pets;
SELECT count(id_pet) AS 'QNT. PETS CADASTRADOS' FROM tb_pets;
SELECT * FROM tb_pets ORDER BY nome ASC;
SELECT * FROM tb_pets ORDER BY nome DESC;
SELECT * FROM tb_veterinarios ORDER BY nome ASC;
SELECT * FROM tb_veterinarios ORDER BY nome DESC;
SELECT min(data_atendimento) AS 'ATENDIMENTO MAIS ANTIGO' FROM tb_atendimentos;
SELECT max(data_atendimento) AS 'ATENDIMENTO MAIS RECENTE' FROM tb_atendimentos;