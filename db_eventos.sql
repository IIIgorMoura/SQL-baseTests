CREATE DATABASE db_eventos;
USE db_eventos;

CREATE TABLE tb_eventos (
	id_evento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(255),
    categoria VARCHAR(255),
    detalhes JSON,
    inscricoes JSON
);

INSERT INTO tb_eventos (titulo, categoria, detalhes, inscricoes) VALUES
('Workshop de Python', 'Programação',
 '{"local":"Sala 101","data":"2025-09-10","palestrantes":["Ana Silva","Carlos Souza"]}',
 '[{"nome":"Felipe","email":"felipe@email.com","presente":true},
   {"nome":"Maria","email":"maria@email.com","presente":false}]'),

('Palestra sobre Inteligência Artificial', 'Tecnologia',
 '{"local":"Auditório A","data":"2025-10-20","palestrantes":["Dr. João Lima"]}',
 '[{"nome":"Lucas","email":"lucas@email.com","presente":true},
   {"nome":"Clara","email":"clara@email.com","presente":true}]'),

('Oficina de Fotografia Criativa', 'Arte',
 '{"local":"Sala de Artes","data":"2025-11-05","palestrantes":["Carlos Mendes"]}',
 '[{"nome":"Bruna","email":"bruna@email.com","presente":false},
   {"nome":"Marcelo","email":"marcelo@email.com","presente":true}]'),

('Curso de UX Design', 'Design',
 '{"local":"Sala 303","data":"2025-09-25","palestrantes":["Fernanda Ribeiro"]}',
 '[{"nome":"Paula","email":"paula@email.com","presente":true},
   {"nome":"Diego","email":"diego@email.com","presente":false}]'),

('Encontro de Startups Locais', 'Empreendedorismo',
 '{"local":"Hub de Inovação","data":"2025-12-10","palestrantes":["Lúcia Costa","Marcos Vinícius"]}',
 '[{"nome":"Renata","email":"renata@email.com","presente":true},
   {"nome":"João","email":"joao@email.com","presente":true}]');
   
SELECT * FROM tb_eventos;


-- 3

-- 3.1
SELECT *
FROM tb_eventos
WHERE JSON_CONTAINS(detalhes->'$.palestrantes', JSON_QUOTE('Carlos Souza'));

-- 3.2
SELECT titulo, JSON_EXTRACT(inscricoes, '$[*].nome') AS participantes_presentes
FROM tb_eventos
WHERE JSON_CONTAINS(inscricoes, '{"presente": true}', '$');

-- 3.3
SELECT 
    id_evento,
    titulo,
    detalhes->>'$.local' AS local,
    JSON_UNQUOTE(JSON_EXTRACT(detalhes, '$.palestrantes[0]')) AS primeiro_palestrante
FROM tb_eventos;

-- 3.4
SELECT titulo
FROM tb_eventos
WHERE JSON_CONTAINS(inscricoes, '{"presente": false}', '$');

