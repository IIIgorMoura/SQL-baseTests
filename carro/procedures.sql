USE db_carro;

-- STORED PROCEDURE
-- Qnd precisa armazenar code block, pd envolver diversas OPs (INSERT, UPDATE, DELETE)

-- PROCEDURE: inserir novo carro na table
DROP PROCEDURE InserirCarro;
DELIMITER $$
CREATE PROCEDURE InserirCarro (
	-- parametros de entrada "IN"
		-- são as infos que devem estar disponíveis para serem inseridas
        -- E TEM parametros de saida "OUT"
    IN p_id_carro INT,
    IN p_marca VARCHAR(100),
    IN p_modelo VARCHAR(100),
    IN p_ano INT,
    IN p_valor DECIMAL(10,2),
    IN p_cor VARCHAR(100),
    IN p_numeroVendas INT
)

BEGIN
	INSERT INTO tb_carro(id_carro, marca, modelo, ano, valor, cor, numero_vendas) 
	VALUES (p_id_carro, p_marca, p_modelo, p_ano, p_valor, p_cor, p_numeroVendas);
END $$

DELIMITER ;
        
CALL InserirCarro(10, 'JUAGAR', 'Emmanuelo', 2025, '130000', 'Ouro', '52000');


