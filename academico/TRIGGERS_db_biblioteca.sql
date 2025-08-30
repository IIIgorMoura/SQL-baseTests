USE db_academico;



-- 1
/*
CREATE DEFINER=`root`@`localhost` TRIGGER `verifica_nota_maxima` BEFORE INSERT ON `tb_notas` FOR EACH ROW BEGIN
	IF NEW.nota > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Nota não pode ser maior que 10.';
    END IF;
END
*/
INSERT INTO tb_notas (nota, data_lancamento, matricula_id)
VALUES (11, CURDATE(), 1);
/*
21:47:27	INSERT INTO tb_notas (nota, data_lancamento, matricula_id) VALUES (11, CURDATE(), 1)	Error Code: 1644. Nota não pode ser maior que 10.	0.000 sec
*/



-- 2
/*
CREATE DEFINER=`root`@`localhost` TRIGGER `tb_matriculas_BEFORE_INSERT` BEFORE INSERT ON `tb_matriculas` FOR EACH ROW BEGIN
	SET NEW.data_matricula = CURDATE();
END
*/
INSERT INTO tb_matriculas (estudante_id, disciplina_id) 
VALUES (1, 2);  -- Não passa a data de matrícula, a trigger vai setar a data automaticamente

SELECT * FROM tb_matriculas;



-- 3
/*
CREATE DEFINER = CURRENT_USER TRIGGER `db_academico`.`tb_disciplinas_BEFORE_DELETE` BEFORE DELETE ON `tb_disciplinas` FOR EACH ROW
BEGIN
	IF EXISTS (
        SELECT 1
        FROM tb_matriculas
        WHERE disciplina_id = OLD.id_disciplina
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é possível deletar a disciplina: ainda há estudantes matriculados.';
    END IF;
END
*/
DELETE FROM tb_disciplinas WHERE id_disciplina = 2;
