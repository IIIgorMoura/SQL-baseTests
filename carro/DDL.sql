/* Criar DB */
CREATE DATABASE db_carro;

/* Usar DB */
USE db_carro;

/* Criar TB */
CREATE TABLE tb_carro (
	id_carro int(10) not null,
    marca VARCHAR(100),
	modelo VARCHAR(100),
    ano int(4),
    valor DECIMAL(10,2),
    cor VARCHAR(100),
    numero_vendas int(10),
    PRIMARY KEY (id_carro)
);

SELECT * FROM tb_carro;

CREATE TABLE tb_proprietario (
	id_proprietario int(10) not null,
    nome VARCHAR(100),
    id_carroF int(10) not null,
    PRIMARY KEY (id_proprietario),
    FOREIGN KEY (id_carroF) REFERENCES tb_carro(id_carro)
);

SELECT marca, modelo FROM tb_carro;

/* Alterar algo na tabela */
ALTER TABLE tb_proprietario ADD idade INT(3);
/* Alterar tipo ou qnt de caracs alocados */
ALTER TABLE tb_proprietario CHANGE nome product_full_name VARCHAR(255);
ALTER TABLE tb_proprietario RENAME COLUMN nome TO name;

SELECT * FROM tb_proprietario;

/*ALTER TABLE nomeAtual RENAME TO nomeNovo*/
/*DROP TABLE nome tabela */

CREATE TABLE tb_historico (
	id_historico int(10) NOT NULL,
    data_modificacao DATETIME,
    id_carroF int(10) NOT NULL,
    valor_anterior DECIMAL(10,2),
    valor_novo DECIMAL(10,2),
    PRIMARY KEY (id_historico),
    FOREIGN KEY (id_carroF) REFERENCES tb_carro(id_carro)
);

