USE ClinicaVetBD;


-- 1: Function: contar qnts pets o cliente tem
SELECT * FROM tb_clientes;
SELECT * FROM tb_pets;

DELIMITER $$
CREATE FUNCTION totalPets (
	p_id_cliente INT
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE total_pets INT;
	SELECT count(*) INTO total_pets FROM tb_pets WHERE id_clienteF = p_id_cliente;
    RETURN total_pets;
END $$

DELIMITER ;
SELECT totalPets(3);



-- 2
SELECT * FROM tb_atendimentos;
DROP FUNCTION ultimaConsulta;
DELIMITER $$
CREATE FUNCTION ultimaConsulta (
	p_id_pet INT
)
RETURNS DATE
READS SQL DATA
BEGIN
	DECLARE pet_ultima_consulta DATE;
    SELECT max(data_atendimento) INTO pet_ultima_consulta FROM tb_atendimentos WHERE id_petF = p_id_pet;
    RETURN pet_ultima_consulta;
END $$

DELIMITER ;

SELECT ultimaConsulta('3');



-- 3
DELIMITER $$
CREATE FUNCTION totalAtendimentosVet (
	p_id_vet INT
)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE total_atendimentos INT;
    SELECT count(*) INTO total_atendimentos FROM tb_atendimentos WHERE id_veterinarioF = p_id_vet;
    RETURN total_atendimentos;
END $$

DELIMITER ;

SELECT totalAtendimentosVet(3);
