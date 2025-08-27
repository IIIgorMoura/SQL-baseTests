USE db_academico;

INSERT INTO tb_cursos (nome, duracao_anos) VALUES
('Engenharia de Software', 4),
('Direito', 5),
('Medicina', 6),
('Administração', 4),
('Arquitetura', 5);

INSERT INTO tb_professores (nome, departamento, ano_admissao) VALUES
('Carlos Henrique', 'Tecnologia', '2015-02-10'),
('Maria Oliveira', 'Humanas', '2012-07-03'),
('Ana Paula', 'Saúde', '2018-03-15'),
('João Mendes', 'Negócios', '2010-01-22'),
('Fernanda Lima', 'Design', '2016-09-30');

INSERT INTO tb_disciplinas (nome, curso_id, professor_id) VALUES
('Algoritmos', 1, 1),
('Direito Constitucional', 2, 2),
('Anatomia', 3, 3),
('Gestão Empresarial', 4, 4),
('História da Arte', 5, 5);

INSERT INTO tb_estudantes (nome, data_nascimento, email) VALUES
('Lucas Silva', '2001-05-14', 'lucas.silva@email.com'),
('Juliana Souza', '2000-11-22', 'juliana.souza@email.com'),
('Matheus Rocha', '1999-08-03', 'matheus.rocha@email.com'),
('Amanda Torres', '2002-02-28', 'amanda.torres@email.com'),
('Felipe Costa', '2001-12-10', 'felipe.costa@email.com');

INSERT INTO tb_matriculas (data_matricula, estudante_id, disciplina_id) VALUES
('2025-01-10', 1, 1),
('2025-01-12', 2, 2),
('2025-01-15', 3, 3),
('2025-01-20', 4, 4),
('2025-01-22', 5, 5);

INSERT INTO tb_notas (nota, data_lancamento, matricula_id) VALUES
(8.5, '2025-03-15', 1),
(7.0, '2025-03-18', 2),
(9.2, '2025-03-20', 3),
(6.8, '2025-03-25', 4),
(10.0, '2025-03-28', 5);

SELECT * FROM tb_cursos;
SELECT * FROM tb_professores;
SELECT * FROM tb_disciplinas;
SELECT * FROM tb_estudantes;
SELECT * FROM tb_matriculas;
SELECT * FROM tb_notas;


