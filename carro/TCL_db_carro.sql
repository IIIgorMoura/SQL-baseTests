-- Qnd tiver falha no processo, ele n salva nada. TRANSAÇÃO
USE db_carro;

SELECT @@autocommit;

SET @@autocommit = OFF;

SELECT * FROM tb_proprietario;

INSERT INTO tb_proprietario(id_proprietario, nome, id_carroF, idade) VALUES (
	6, 'Abraão', 43454, 999
); 

ROLLBACK;


START TRANSACTION;
	INSERT INTO tb_proprietario VALUES (
	7, 'Geribaldo', 67465, 100
); 

COMMIT;

ROLLBACK;

SELECT * FROM tb_historico;
SELECT * FROM tb_carro;
ALTER TABLE tb_historico MODIFY id_historico INT AUTO_INCREMENT;
UPDATE tb_carro SET valor = 90 WHERE id_carro = 43454;


ALTER TABLE tb_proprietario
ADD data_nascimento DATE;
SELECT * FROM tb_proprietario;

SELECT * FROM tb_proprietario;
INSERT INTO tb_proprietario
VALUES (7, 'Marcelito Aguiar', 43454, null,  '2000/01/01');

UPDATE tb_proprietario SET data_nascimento = '1950/01/01' WHERE id_proprietario = 6;

