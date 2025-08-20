USE db_carro;

SELECT * FROM tb_carro;
INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor, numero_vendas)
/*n precisa desses no (), mas ajuda a lembrar
*/ VALUES (
	'1',
    'Renault',
    'Kwid',
    '2023',
    '80000',
    'branco',
    '150000'
);

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor, numero_vendas) VALUES (
	'00074675',
    'Honda',
    'Civic',
    '1998',
    '10.23',
    'Rosa',
    '25'
);

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor, numero_vendas) VALUES (
	'43454',
    'Xiaomi',
    'SU7',
    '2025',
    '695655.99',
    'Ciano',
    '0'
);

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor, numero_vendas) VALUES (
	'67465',
    'Honda',
    'City',
    '2018',
    '10000',
    'Cinza',
    '12345678'
);

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor, numero_vendas) VALUES (
	'987465',
    'Hyundai',
    'Elantra',
    '2013',
    '30999.99',
    'Branco',
    '10000'
);

/* Link com proprietarios */
SELECT * FROM tb_proprietario;
INSERT INTO tb_proprietario (id_proprietario, nome, id_carroF, idade) VALUES (
	'1',
    'Eduardo Costa',
    '1',
    '59'
);

INSERT INTO tb_proprietario (id_proprietario, nome, id_carroF, idade) VALUES (
	'2',
    'Marocas',
    '43454',
    '12'
);

INSERT INTO tb_proprietario (id_proprietario, nome, id_carroF, idade) VALUES (
	'3',
    'Gustavo Lima',
    '67465',
    '49'
);

INSERT INTO tb_proprietario (id_proprietario, nome, id_carroF, idade) VALUES (
	'4',
    'Manuel Gustavo Ferreira Costa Guilherme Terceiro',
    '74675',
    '120'
);

INSERT INTO tb_proprietario (id_proprietario, nome, id_carroF, idade) VALUES (
	'5',
    'Juan',
    '987465',
    '10'
);

/* Alteracao nos registros - UPDATE */
  /* Toda exclusão / alteração, precisa definir quem vc qr atualizar */
  
SELECT * FROM tb_proprietario WHERE id_proprietario = '5';
UPDATE tb_proprietario SET idade = '43' WHERE id_proprietario = '5';

SELECT * FROM tb_carro WHERE id_carro = '1';
UPDATE tb_carro SET modelo = 'City' WHERE id_carro = 1;

SELECT * FROM tb_carro;
SELECT * FROM tb_carro WHERE id_carro = '43454';
UPDATE tb_carro SET ano = '1988' WHERE id_carro = '43454';

SELECT * FROM tb_carro WHERE id_carro = '67465';
UPDATE tb_carro SET ano = '1500' WHERE id_carro = '67465';

DELETE FROM tb_proprietario WHERE id_carroF = 1;
DELETE FROM tb_carro WHERE id_carro = '1';