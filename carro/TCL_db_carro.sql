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

