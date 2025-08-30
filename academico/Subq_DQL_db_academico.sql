USE db_academico;



-- 1
SELECT * FROM tb_cursos;
SELECT * FROM tb_disciplinas;

SELECT C.nome AS nome_curso
FROM tb_disciplinas AS D
INNER JOIN tb_cursos AS C
ON curso_id = id_curso
WHERE (SELECT count(curso_id) FROM tb_disciplinas) > 5;



-- 2
SELECT e.id_estudante, e.nome, Count(m.id_matricula) AS total_matriculas
FROM tb_estudantes e
JOIN tb_matriculas m ON m.estudante_id = e.id_estudante
GROUP BY e.id_estudante, e.nome
HAVING Count(m.id_matricula) > (
    SELECT AVG(total)
    FROM (
        SELECT Count(*) AS total
        FROM tb_matriculas
        GROUP BY estudante_id
    ) AS sub
);



-- 3
SELECT p.id_professor, p.nome, AVG(n.nota) AS media_professor
FROM tb_professores p
JOIN tb_disciplinas d ON d.professor_id = p.id_professor
JOIN tb_matriculas m ON m.disciplina_id = d.id_disciplina
JOIN tb_notas n ON n.matricula_id = m.id_matricula
GROUP BY p.id_professor, p.nome
HAVING AVG(n.nota) = (
    SELECT MAX(media_por_professor)
    FROM (
        SELECT AVG(n2.nota) AS media_por_professor
        FROM tb_professores p2
        JOIN tb_disciplinas d2 ON d2.professor_id = p2.id_professor
        JOIN tb_matriculas m2 ON m2.disciplina_id = d2.id_disciplina
        JOIN tb_notas n2 ON n2.matricula_id = m2.id_matricula
        GROUP BY p2.id_professor
    ) AS medias
);




-- 4
SELECT DISTINCT e.id_estudante, e.nome
FROM tb_estudantes e
JOIN tb_matriculas m ON m.estudante_id = e.id_estudante
JOIN tb_notas n ON n.matricula_id = m.id_matricula
WHERE n.nota < (
    SELECT AVG(nota) FROM tb_notas
);



-- 5
SELECT DISTINCT p.id_professor, p.nome
FROM tb_professores p
WHERE NOT EXISTS (
    SELECT 1
    FROM tb_disciplinas d
    JOIN tb_matriculas m ON m.disciplina_id = d.id_disciplina
    JOIN tb_notas n ON n.matricula_id = m.id_matricula
    WHERE d.professor_id = p.id_professor
    AND n.nota < 7
);
