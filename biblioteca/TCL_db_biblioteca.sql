USE db_biblioteca;

SELECT * FROM tb_emprestimo;
INSERT INTO tb_emprestimo VALUES
	(8000, '2021-12-15', null, 2, 4);
    
-- tmb autores, gatilho q impede cadastro de 2 autores com msm nome
SELECT * FROM tb_autores;
INSERT INTO tb_autores VALUES (
	1, 'gonçaulo AGUIR', '2025-01-01'
);