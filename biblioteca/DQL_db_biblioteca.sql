USE db_biblioteca;

SELECT min(ano_publicacao) AS "Data Publicação: Livro mais antigo" FROM tb_livros;
	-- infos complementares (pegar além do ano mais recente, aproveitando ASC e DESC)
SELECT * FROM tb_livros ORDER BY ano_publicacao ASC LIMIT 1;
SELECT max(ano_publicacao) AS "Data Publicação: Livro mais recente" FROM tb_livros;

SELECT count(id_livro) AS "Total Livros" FROM tb_livros; 

-- Solução simples
SELECT * FROM tb_emprestimo WHERE data_devolucao = "2021-02-01";
-- Solução de consulta mesclada JOIN


SELECT * FROM tb_autores ORDER BY nome ASC;
SELECT * FROM tb_livros ORDER BY titulo DESC;