USE db_biblioteca;

-- INNER JOIN

SELECT titulo, nome AS autor FROM tb_livros AS L 
INNER JOIN tb_autores AS A ON L.id_autorF = A.id_autor;

-- 2

SELECT 
	titulo,
    nome AS autor,
    ano_publicacao
FROM
	tb_livros AS L
INNER JOIN
	tb_autores AS A
ON
	L.id_autorF = A.id_autor;
    
-- 3

SELECT
	nome,
    titulo,
    data_emprestimo
FROM
	tb_emprestimo AS E
INNER JOIN
	tb_membros AS M
ON
	E.id_membroF = M.id_membro
INNER JOIN
	tb_livros AS L
ON
	E.id_livroF = L.id_livro;

-- 4
    
SELECT
	M.nome AS nome_membro,
    titulo,
    data_devolucao,
    A.nome AS nome_autor
FROM
	tb_emprestimo AS E
INNER JOIN
	tb_membros AS M
ON
	E.id_membroF = M.id_membro
INNER JOIN
	tb_livros AS L
ON
	E.id_livroF = L.id_livro
INNER JOIN
	tb_autores AS A
ON
	A.id_autor = L.id_autorF;

    
    
-- 5 LEFT JOIN

SELECT 
	*
FROM
	tb_membros AS M
LEFT JOIN
	tb_emprestimo AS E
ON
	M.id_membro = E.id_membroF;
    
-- 6

SELECT 
	* 
FROM
	tb_autores AS A
LEFT JOIN
	tb_livros AS L
ON
	A.id_autor = L.id_autorF;
    
    

-- 7 RIGHT JOIN

SELECT
	titulo,
    A.nome
FROM
	tb_autores AS A
RIGHT JOIN
	tb_livros AS L
ON
	A.id_autor = L.id_autorF;
    
-- 8

SELECT
	titulo,
    M.nome
FROM
	tb_emprestimo AS E
RIGHT JOIN
	tb_livros AS L
ON
	E.id_livroF = L.id_livro
LEFT JOIN
    tb_membros AS M
ON
	M.id_membro = E.id_membroF;