CREATE DATABASE db_academico;

USE db_academico;



CREATE TABLE tb_cursos (
	id_curso INT AUTO_INCREMENT UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    duracao_anos INT NOT NULL,
    PRIMARY KEY (id_curso)
);
SELECT * FROM tb_cursos;


CREATE TABLE tb_professores (
	id_professor INT AUTO_INCREMENT UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_professor)
);
SELECT * FROM tb_professores;
ALTER TABLE tb_professores ADD COLUMN ano_admissao DATE;

CREATE TABLE tb_disciplinas (
	id_disciplina INT AUTO_INCREMENT UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    curso_id INT NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES tb_cursos(id_curso),
    professor_id INT NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES tb_professores(id_professor),
    PRIMARY KEY (id_disciplina)
);
SELECT * FROM tb_disciplinas;


CREATE TABLE tb_estudantes (
	id_estudante INT PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_matricula DATE NOT NULL,
    curso_id INT NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES tb_cursos(id_curso)
);
SELECT * FROM tb_estudantes;

CREATE TABLE tb_matriculas (
	id_matricula INT PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL,
    data_matricula DATE,
    estudante_id INT NOT NULL,
    FOREIGN KEY (estudante_id) REFERENCES tb_estudantes(id_estudante),
    disciplina_id INT NOT NULL,
    FOREIGN KEY (disciplina_id) REFERENCES tb_disciplinas(id_disciplina)
);
SELECT * FROM tb_matriculas;



CREATE TABLE tb_notas (
	-- anotação: UNIQUE NOT NULL é uma redundância, mas como no avião, melhor sobrar do que faltas
	id_nota INT PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL,
    nota DECIMAL(5,2), -- 5 digitos é excessivo
    data_lancamento DATE,
    matricula_id INT NOT NULL,
    FOREIGN KEY (matricula_id) REFERENCES tb_matriculas(id_matricula)
);
SELECT * FROM tb_notas;