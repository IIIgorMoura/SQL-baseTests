USE db_biblioteca;

-- 1
DROP FUNCTION calcIdade;
SELECT * FROM tb_autores;
DELIMITER $$
CREATE FUNCTION calcIdade (
	p_id_autor INT
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE var_data_nascimento DATE;
	SELECT data_nascimento INTO var_data_nascimento FROM tb_autores WHERE id_autor = p_id_autor;
	RETURN TIMESTAMPDIFF(YEAR, var_data_nascimento, CURDATE());
END $$

DELIMITER ;

SELECT calcIdade(3);



-- 2
SELECT * FROM tb_livros;
DROP FUNCTION contaLivrosAutor;
DELIMITER $$
CREATE FUNCTION contaLivrosAutor (
	p_id_autor INT
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE total_livros INT;
    SELECT count(id_autorF) INTO total_livros FROM tb_livros WHERE id_autorF = p_id_autor;
    RETURN total_livros;
END $$

DELIMITER ;

SELECT contaLivrosAutor(4);



-- 3
SELECT * FROM tb_emprestimo;

DELIMITER $$
CREATE FUNCTION emprestimosNoPeriodo (
	p_data_inicio DATE,
    p_data_fim DATE
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE total_emprestimos_periodo INT;
	SELECT count(*) INTO total_emprestimos_periodo FROM tb_emprestimo WHERE data_emprestimo BETWEEN p_data_inicio AND p_data_fim;
	RETURN total_emprestimos_periodo;
END $$

DELIMITER ;

SELECT emprestimosNoPeriodo('2021-02-01', '2021-11-01');



-- 4
SELECT * FROM tb_emprestimo;
DROP FUNCTION mediaDuracaoEmprestimo;

DELIMITER $$
CREATE FUNCTION mediaDuracaoEmprestimo ()
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE media_dias INT;
    SELECT avg(timestampdiff(day, data_emprestimo, data_devolucao)) INTO media_dias FROM tb_emprestimo;
    RETURN media_dias;
END $$

DELIMITER ;

SELECT mediaDuracaoEmprestimo();

