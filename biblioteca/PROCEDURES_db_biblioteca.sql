-- 1 PROCEDURE: Inserir novo Autor
USE db_biblioteca;

DELIMITER $$
CREATE PROCEDURE InserirAutores (
	IN p_id_autor INT,
    IN p_nome VARCHAR(128),
    IN p_dataNascimento DATE
)
BEGIN
	INSERT INTO tb_autores(id_autor, nome, data_nascimento)
    VALUES (p_id_autor, p_nome, p_dataNascimento);
END $$

DELIMITER ;

SELECT * FROM tb_autores;

CALL InserirAutores(7, 'Juanzito Eduardo Sandra', '2015-01-10');




-- 2 PROCEDURE: update data de devolução (15 dias?)
DELIMITER $$
CREATE PROCEDURE AtualizarDataDevolucao (
	IN p_id_emprestimo INT,
    IN p_dataDevolucao DATE
)
BEGIN
	UPDATE tb_emprestimo SET data_devolucao = p_dataDevolucao WHERE id_emprestimo = p_id_emprestimo;
END $$

DELIMITER ;

CALL AtualizarDataDevolucao('7000', '2025-01-01');


-- 3 PROCEDURE: Consultar todos livros emprestados por um membro (nome_membro, titulo, data_emprestimo)
DELIMITER $$
CREATE PROCEDURE ConsultaEmprestimosMembro (
	IN p_id_membro INT
)
BEGIN
	SELECT M.id_membro, M.nome, L.titulo, E.data_emprestimo 
	FROM tb_emprestimo AS E
    INNER JOIN tb_membros AS M
    ON E.id_membroF = M.id_membro
    INNER JOIN tb_livros AS L
    ON E.id_livroF = L.id_livro
    WHERE id_membro = p_id_membro;
END $$

DELIMITER ;

CALL ConsultaEmprestimosMembro(2);

SELECT * FROM tb_emprestimo;
SELECT * FROM tb_membros;