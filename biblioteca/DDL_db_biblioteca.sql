CREATE DATABASE db_biblioteca;
USE db_biblioteca;

CREATE TABLE tb_autores (
	id_autor INT(4) NOT NULL, /* dava pra ter UNIQUE */
    nome VARCHAR(128),
    data_nascimento DATE,
    PRIMARY KEY (id_autor)
);

SELECT * FROM tb_autores;


CREATE TABLE tb_livros (
	id_livro INT(10) NOT NULL,
    titulo VARCHAR(255),
    ano_publicacao INT(4), /*dava pra ser YEAR*/
    PRIMARY KEY (id_livro),
    id_autorF INT(10) NOT NULL,
    FOREIGN KEY (id_autorF) REFERENCES tb_autores(id_autor)
);

SELECT * FROM tb_livros;


CREATE TABLE tb_membros (
	id_membro INT(10) NOT NULL,
    nome VARCHAR(128),
    data_adesao DATE,
    PRIMARY KEY (id_membro)
);

CREATE TABLE tb_emprestimo (
	id_emprestimo INT(10) NOT NULL,
    data_emprestimo DATE,
    data_devolucao DATE,
    PRIMARY KEY (id_emprestimo),
    id_membroF INT(10) NOT NULL,
    id_livroF INT(10) NOT NULL,
    FOREIGN KEY (id_membroF) REFERENCES tb_membros(id_membro),
    FOREIGN KEY (id_livroF) REFERENCES tb_livros(id_livro)
);