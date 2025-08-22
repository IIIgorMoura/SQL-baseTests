-- //// ClinicaVet ////
USE ClinicaVetBD;
SELECT * FROM tb_pets;

-- 1
ALTER TABLE tb_pets ADD COLUMN idade INT(3);

INSERT INTO tb_pets VALUES (
	4,
    'Rex',
    'Cachorro',
    'Pastor Alemão',
    '2000-01-01',
    3,
    null
);
/*
CREATE DEFINER=`root`@`localhost` TRIGGER `TR_evitar_nome_duplicado` BEFORE INSERT ON `tb_autores` FOR EACH ROW BEGIN
	IF EXISTS (SELECT 1 FROM tb_autores WHERE Lower(nome) = Lower(NEW.nome)) THEN
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'O autor já está cadastrado!';
	END IF;
END
*/

-- //// biblioteca ////
USE db_biblioteca;

-- 1
SELECT * FROM tb_autores;

INSERT INTO tb_autores VALUES (
	7,
    'Maximus Andrezzos',
    '2015-01-01'
);
/* 
CREATE DEFINER=`root`@`localhost` TRIGGER `TR_biblioteca_idade_minima18` BEFORE INSERT ON `tb_autores` FOR EACH ROW BEGIN
	IF (TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE())) <= 18 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Autores menores que 18 anos não são permitidos';
	END IF;
END
*/


-- 2
SELECT * FROM tb_emprestimo;

UPDATE tb_emprestimo SET data_emprestimo = '2021-01-01' WHERE id_emprestimo = 6000;
UPDATE tb_emprestimo SET id_membroF = '3' WHERE id_emprestimo = 7000;
/*
CREATE DEFINER=`root`@`localhost` TRIGGER `TR_emprestimo_update_dataDevolucao15` BEFORE UPDATE ON `tb_emprestimo` FOR EACH ROW BEGIN
	SET NEW.data_devolucao = DATE_ADD(NEW.data_emprestimo, INTERVAL 15 DAY);
END
*/


-- 3
SELECT * FROM tb_emprestimo;
-- excede 3 emprestimos
INSERT INTO tb_emprestimo VALUES (
	1200,
    '2021-01-01',
    null,
    2,
    4
);
/*
CREATE DEFINER=`root`@`localhost` TRIGGER `TR_limitEmprestimos` BEFORE INSERT ON `tb_emprestimo` FOR EACH ROW BEGIN
	-- Consulta qntEmprestimos ativos
    DECLARE total_emprestimo INT;
	SELECT count(*) INTO total_emprestimo FROM tb_emprestimo 
    WHERE id_membroF = NEW.id_membroF AND data_devolucao IS NULL;

	-- Limite de 3 emprestimos
	IF total_emprestimo >= 3 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'O membro não pode ter mais de 3 empréstimos ativos';
	END IF;
END
*/


-- 4
