USE db_academico;



-- 1
DELIMITER $$
CREATE PROCEDURE insere_professor(
	IN p_nome VARCHAR(100),
    IN p_departamento VARCHAR(100),
    IN p_ano_admissao DATE
)
BEGIN
    INSERT INTO tb_professores(nome, departamento, ano_admissao)
    VALUES (p_nome, p_departamento, p_ano_admissao);
    
    SELECT last_insert_id() AS id_professor;
    
END $$
DELIMITER ;

CALL insere_professor('Juan Neto', 'Jornalismo', Curdate());



-- 2
DELIMITER $$
CREATE PROCEDURE atualiza_disciplina (
	IN p_id_disciplina INT,
    IN p_novo_nome VARCHAR(100)
)
BEGIN
	UPDATE tb_disciplinas SET nome = p_novo_nome WHERE id_disciplina = p_id_disciplina;
END $$
DELIMITER ;

CALL atualiza_disciplina(2, 'Direito Nacional');
SELECT * FROM tb_disciplinas;



-- 3
-- foi mencionado que não precisa realmente apagar, pela conexão com foreign key
DELIMITER $$
CREATE PROCEDURE remove_estudante (
	IN p_id_estudante INT
)
BEGIN
	DELETE FROM tb_estudantes WHERE id_estudante = p_id_estudante;
END $$
DELIMITER ;

CALL remove_estudante(5);

-- 4
DELIMITER $$
CREATE PROCEDURE consulta_professor (
	IN p_id_professor INT
)
BEGIN
	SELECT nome, departamento FROM tb_professores WHERE id_professor = p_id_professor;
END $$
DELIMITER ;

CALL consulta_professor(1);



-- 5
-- não existe nota para disciplina, então vamos considerar "curso"
SELECT * FROM tb_notas;

DELIMITER $$
CREATE PROCEDURE atualiza_nota (
	IN p_id_matricula INT,
    IN p_nota DECIMAL(10,2)
)
BEGIN
	UPDATE tb_notas SET nota = p_nota WHERE matricula_id = p_id_matricula;
END $$
DELIMITER ;

CALL atualiza_nota(2, 8)