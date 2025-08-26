USE ClinicaVetBD;

-- 1 PROCEDURE: add novo vet na table
SELECT * FROM tb_veterinarios;
DELIMITER $$
CREATE PROCEDURE InserirVeterinario (
	IN p_id_veterinario INT,
    IN p_nome VARCHAR(128),
    IN p_especialidade VARCHAR(128),
    IN p_telefone VARCHAR(15)
)
BEGIN
	INSERT INTO tb_veterinarios VALUES (p_id_veterinario, p_nome, p_especialidade, p_telefone);
END $$

DELIMITER ;

CALL InserirVeterinario(4, 'José Pedro', 'Ferramentaria', '(21)55616-9555');



-- 2 PROCEDURE: Atualizar dados Cliente (nome, endereco, telefone)
SELECT * FROM tb_clientes;

DELIMITER $$
CREATE PROCEDURE AtualizarDadosCliente (
	IN p_id_cliente INT,
    IN p_nome VARCHAR(128),
    IN p_endereco VARCHAR(256),
    IN p_telefone VARCHAR(15)
)
BEGIN
	UPDATE tb_clientes SET nome = p_nome, endereco = p_endereco, telefone = p_telefone WHERE id_cliente = p_id_cliente;
END $$

DELIMITER ;

CALL AtualizarDadosCliente(3, 'Luan Mansini', 'Rua 10', '(21) 98888-6384');



-- 3 PROCEDURE: Criar Atendimento se Pet e Vet existem no db
	-- ATENÇÃO: O próprio SQL detecta se o Pet ou Vet não existem, pois só pd add se a Foreign Key existe
SELECT * FROM tb_atendimentos;

DELIMITER $$
CREATE PROCEDURE NovoAtendimento (
	IN p_id_atendimento INT,
    IN p_data_atendimento DATE,
    IN p_descricao VARCHAR(1028),
    IN p_id_petF INT,
    IN p_id_veterinarioF INT
)
BEGIN
	INSERT INTO tb_atendimentos VALUES (p_id_atendimento, p_data_atendimento, p_descricao, p_id_petF, p_id_veterinarioF);
END $$

DELIMITER ;

CALL NovoAtendimento(4, '2024-01-01', 'Injeção de trembolona', 30, 30);