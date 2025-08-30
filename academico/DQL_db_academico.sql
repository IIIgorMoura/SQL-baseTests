USE db_academico;



-- 1
SELECT E.*, C.nome 
FROM tb_estudantes AS E
INNER JOIN tb_cursos AS C
ON E.curso_id = C.id_curso
WHERE YEAR(data_matricula) = 2025 
AND C.nome = 'Engenharia de Software';


-- 2
SELECT * FROM tb_professores;

SELECT * 
FROM tb_professores
WHERE departamento = 'Tecnologia'
AND TIMESTAMPDIFF(YEAR, ano_admissao, CURDATE()) >= 5;



-- 3
SELECT E.nome, N.nota
FROM tb_notas AS N
INNER JOIN tb_matriculas AS M
ON matricula_id = id_matricula
INNER JOIN tb_estudantes AS E
ON estudante_id = id_estudante
ORDER BY N.nota DESC, E.nome ASC;

 

-- 4
	-- link C.nome, 
    -- como linkar a nota até o nome do curso?
		-- N.matricula_id >< M.id_matricula
			-- M.estudante_id >< E.id_estudante
				-- E.curso_id >< C.id_curso
    -- média N.nota WHERE curso C.nome='EngDados'
SELECT AVG(N.nota) AS media_nota_curso
FROM tb_notas AS N
INNER JOIN tb_matriculas AS M
ON matricula_id = id_matricula
INNER JOIN tb_estudantes AS E
ON estudante_id = id_estudante
INNER JOIN tb_cursos AS C
ON E.curso_id = C.id_curso
WHERE C.nome = 'Engenharia de Software';



-- 5
SELECT C.nome, count(*) AS total_cursando
FROM tb_estudantes AS E
INNER JOIN tb_cursos AS C
ON curso_Id = id_curso
GROUP BY C.nome
HAVING count(*) > 5;

