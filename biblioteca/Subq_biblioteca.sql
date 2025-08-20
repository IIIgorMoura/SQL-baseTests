USE db_biblioteca;

-- 1
SELECT nome FROM tb_livros AS L 
INNER JOIN tb_autores AS A 
ON L.id_autorF = A.id_autor 
WHERE ano_publicacao > (SELECT AVG(ano_publicacao) FROM tb_livros);

-- 2
-- Codigo exibindo cada emprestimo (Incluindo repeticao)
SELECT titulo FROM tb_livros AS L
INNER JOIN tb_emprestimo AS E
ON L.id_livro = E.id_livroF
WHERE id_livro IN (SELECT id_livroF FROM tb_emprestimo);

-- Codigo exibindo cada livro emprestado apenas 1 vez
SELECT * FROM tb_livros WHERE id_livro IN (SELECT id_livroF FROM tb_emprestimo);

-- 3
SELECT * FROM tb_livros WHERE id_livro NOT IN (SELECT id_livro FROM tb_emprestimo);
