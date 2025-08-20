USE db_biblioteca;


/* --- --- --- AUTORES --- --- --- */

INSERT INTO tb_autores(id_autor, nome, data_nascimento) VALUES (
	'01',
    'Manuel Agustinho Ferreira Santos',
    '1988-10-31'
);
INSERT INTO tb_autores(id_autor, nome, data_nascimento) VALUES (
	'2',
    'Gonçaulo Aguir',
    '1899-01-01'
);
INSERT INTO tb_autores(id_autor, nome, data_nascimento) VALUES (
	'03',
    'Marocas',
    '1999-12-29'
);
INSERT INTO tb_autores(id_autor, nome, data_nascimento) VALUES (
	'04',
    'George Orwell',
    '1924-09-12'
);
INSERT INTO tb_autores(id_autor, nome, data_nascimento) VALUES (
	'05',
    'Alexandro Moretto',
    '0001-01-01'
);

SELECT * FROM tb_autores;


/* --- --- --- LIVROS --- --- --- */

INSERT INTO tb_livros(id_livro, titulo, ano_publicacao, id_autorF) VALUES (
	'0001',
    'A Razão da Existência',
    '2015',
    '01'
);
INSERT INTO tb_livros(id_livro, titulo, ano_publicacao, id_autorF) VALUES (
	'0002',
    'Why Machines Learn',
    '1999',
    '02'
);
INSERT INTO tb_livros(id_livro, titulo, ano_publicacao, id_autorF) VALUES (
	'0003',
    'O Movimento',
    '2007',
    '03'
);
INSERT INTO tb_livros(id_livro, titulo, ano_publicacao, id_autorF) VALUES (
	'0004',
    '1984',
    '1984',
    '04'
);
INSERT INTO tb_livros(id_livro, titulo, ano_publicacao, id_autorF) VALUES (
	'0005',
    'O Manifesto',
    '2026',
    '05'
);

SELECT * FROM tb_livros;

/* --- --- --- MEMBROS --- --- --- */

INSERT INTO tb_membros(id_membro, nome, data_adesao) VALUES (
	'01',
    'Alberto',
    '2020-01-01'
);
INSERT INTO tb_membros(id_membro, nome, data_adesao) VALUES (
	'02',
    'Eduardo',
    '2020-01-02'
);
INSERT INTO tb_membros(id_membro, nome, data_adesao) VALUES (
	'03',
    'Marcos',
    '2020-01-03'
);
INSERT INTO tb_membros(id_membro, nome, data_adesao) VALUES (
	'04',
    'Henrique',
    '2020-01-04'
);
INSERT INTO tb_membros(id_membro, nome, data_adesao) VALUES (
	'05',
    'Pablo',
    '2020-01-05'
);

SELECT * FROM tb_membros;

/* --- --- --- EMPRESTIMOS --- --- --- */

INSERT INTO tb_emprestimo(id_emprestimo, data_emprestimo, data_devolucao, id_membroF, id_livroF) VALUES (
	'1000',
    '2021-01-01',
    '2021-02-01',
    '02',
    '03'
);
INSERT INTO tb_emprestimo(id_emprestimo, data_emprestimo, data_devolucao, id_membroF, id_livroF) VALUES (
	'2000',
    '2021-02-01',
    '2021-03-01',
    '02',
    '04'
);
INSERT INTO tb_emprestimo(id_emprestimo, data_emprestimo, data_devolucao, id_membroF, id_livroF) VALUES (
	'3000',
    '2021-10-01',
    '2021-11-02',
    '01',
    '04'
);
INSERT INTO tb_emprestimo(id_emprestimo, data_emprestimo, data_devolucao, id_membroF, id_livroF) VALUES (
	'4000',
    '2021-12-01',
    '2021-12-02',
    '02',
    '04'
);
INSERT INTO tb_emprestimo(id_emprestimo, data_emprestimo, data_devolucao, id_membroF, id_livroF) VALUES (
	'5000',
    '2021-09-09',
    '2021-09-10',
    '05',
    '05'
);

SELECT * FROM tb_emprestimo;


/* UPDATE */
SELECT * FROM tb_membros WHERE id_membro = '01';
UPDATE tb_membros SET data_adesao = '1984-01-01' WHERE id_membro = '01';

SELECT * FROM tb_autores WHERE id_autor = '01';
UPDATE tb_autores SET data_nascimento = '1800-01-01' WHERE id_autor = '01';

SELECT * FROM tb_autores WHERE id_autor = '02';
UPDATE tb_autores SET data_nascimento = '1900-10-01' WHERE id_autor = '02';

SELECT * FROM tb_membros WHERE id_membro = '05';
UPDATE tb_membros SET data_adesao = '2000-01-01' WHERE id_membro = '05';

SELECT * FROM tb_autores WHERE id_autor = '03';
UPDATE tb_autores SET nome = 'Gustavo Lima Eduardo Santos Costa Pereira Sapatini' WHERE id_autor = '03';