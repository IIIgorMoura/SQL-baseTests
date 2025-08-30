USE db_academico;



-- 1
DELIMITER $$
CREATE FUNCTION idade_estudante (
	p_id_estudante INT
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE var_data_nascimento DATE;
    SELECT data_nascimento INTO var_data_nascimento FROM tb_estudantes WHERE id_estudante = p_id_estudante;
    RETURN Timestampdiff(Year, var_data_nascimento, Curdate());
END $$

DELIMITER ;

SELECT idade_estudante(4);



-- 2
DELIMITER $$
CREATE FUNCTION total_estudantes_disciplina (
	p_id_disciplina INT
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE var_total_na_disciplina INT;
    SELECT count(*) INTO var_total_na_disciplina FROM tb_matriculas WHERE disciplina_id = p_id_disciplina;
    RETURN var_total_na_disciplina;
END $$
DELIMITER ;

SELECT total_estudantes_disciplina(5);



-- 3
SELECT * FROM tb_notas;
DELIMITER $$
CREATE FUNCTION nota_maxima ()
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
	DECLARE maior_nota DECIMAL(10,2);
	SELECT max(nota) INTO maior_nota FROM tb_notas;
    RETURN maior_nota;
END $$
DELIMITER ;

SELECT nota_maxima()



-- 4
DELIMITER $$
CREATE FUNCTION disciplina_do_curso (
	p_id_curso INT
)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
    DECLARE disciplina_do_curso VARCHAR(100);
    SELECT D.nome INTO disciplina_do_curso FROM tb_disciplinas AS D WHERE curso_id = p_id_curso;
    RETURN disciplina_do_curso;
END $$
DELIMITER ;

SELECT disciplina_do_curso(2);



-- 5
SELECT * FROM tb_notas;
SELECT * FROM tb_cursos;
SELECT * FROM tb_matriculas;
SELECT * FROM tb_disciplinas;

DELIMITER $$
CREATE FUNCTION media_notas_curso (
	p_id_curso INT
)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
	-- recebe id curso
    -- retorna média de notas
    -- é preciso
		-- linkar N.matricula_id >< M.id_matricula
        -- linkar M.disciplina_id >< D.id_disciplina
        -- linkar D.curso_id >< C.id_curso
			-- pegar média desse link
            
	DECLARE media_notas_curso DECIMAL(10,2);
	
    SELECT avg(nota) INTO media_notas_curso FROM tb_notas AS N
    INNER JOIN tb_matriculas AS M
		ON N.matricula_id = M.id_matricula
    INNER JOIN tb_disciplinas AS D
		ON M.disciplina_id = D.id_disciplina
    INNER JOIN tb_cursos AS C
		ON D.curso_id = C.id_curso
    WHERE C.id_curso = p_id_curso;
    
    RETURN media_notas_curso;
END $$
DELIMITER ;

SELECT media_notas_curso(3); 