CREATE DATABASE sprint1;
USE sprint1;

CREATE TABLE usuarios(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome_usuario VARCHAR(40),
email_usuario VARCHAR(40),
senha_usuario VARCHAR(8),
nivel_de_acesso_usuario VARCHAR(20),
CONSTRAINT CHECK(nivel_de_acesso_usuario IN('Administrador','Cliente','Usuario Comum'))
);

INSERT INTO usuarios (nome_usuario, email_usuario, senha_usuario, nivel_de_acesso_usuario) VALUES 
('Ricardo Souza', 'ricardo@email.com', 'admin123', 'Administrador'),
('Beatriz Lima', 'beatriz@email.com', 'cli45678', 'Cliente'),
('Carlos André', 'carlos@email.com', 'user1234', 'Usuario Comum'),
('Fernanda M.', 'fernanda@email.com', 'f3rn4nd4', 'Administrador'),
('Marcos Paulo', 'marcos@email.com', 'senha123', 'Cliente'),
('Juliana Dias', 'juliana@email.com', 'jd2023x', 'Usuario Comum'),
('Roberto Silva', 'roberto@email.com', 'rob8899', 'Cliente'),
('Alice Duarte', 'alice@email.com', 'ali_123', 'Usuario Comum'),
('Thiago Melo', 'thiago@email.com', 'th09876', 'Administrador'),
('Sofia Castro', 'sofia@email.com', 'sofia77', 'Cliente');

CREATE TABLE shoppings (
id_shopping INT PRIMARY KEY AUTO_INCREMENT,
ticket_medio DECIMAL (4,2),
nome_shopping VARCHAR(40),
cnpj CHAR(14),
lougradouro VARCHAR(100),
cep VARCHAR (8),
num_vagas_total INT,
num_vagas_idoso INT,
num_vagas_pcd INT
);

INSERT INTO shoppings (ticket_medio, nome_shopping, cnpj, lougradouro, cep, num_vagas_total, num_vagas_idoso, num_vagas_pcd) VALUES 
(12.50, 'Shopping Norte', '11222333000101', 'Av. das Nações, 100', '12345678', 500, 25, 15),
(15.00, 'Shopping Sul', '22333444000102', 'Rua das Flores, 50', '23456789', 300, 10, 10),
(10.00, 'Centro Comercial Leste', '33444555000103', 'Estrada Velha, 999', '34567890', 200, 5, 5),
(18.90, 'Mega Mall Oeste', '44555666000104', 'Alameda Central, 10', '45678901', 1000, 50, 40),
(08.00, 'Shopping Outlet', '55666777000105', 'Km 20 da Rodovia', '56789012', 450, 20, 20),
(14.20, 'Vila Shopping', '66777888000106', 'Rua do Comércio, 12', '67890123', 150, 8, 4),
(25.00, 'Luxury Shopping', '77888999000107', 'Av. da Liberdade, 1', '78901234', 400, 30, 20),
(11.00, 'Shopping Estação', '88999000000108', 'Largo da Estação, s/n', '89012345', 600, 25, 25),
(13.50, 'Pátio Central', '99000111000109', 'Praça da Matriz, 44', '90123456', 350, 15, 10),
(09.50, 'Shopping Popular', '00111222000110', 'Rua da Feira, 101', '01234567', 250, 10, 10);

CREATE TABLE vagas (
id_vaga INT PRIMARY KEY AUTO_INCREMENT,
id_shopping INT,
tipo VARCHAR (40) DEFAULT 'Não Especificado',
identificador_Vaga VARCHAR(4), 
status_vaga VARCHAR(7),
CONSTRAINT cstatus_vaga CHECK(status_vaga IN('Livre','Ocupada')),
CONSTRAINT cTipo CHECK(tipo IN('Comum','PCD','VIP','Idoso'))
);
INSERT INTO vagas (id_shopping, tipo, identificador_Vaga, status_vaga) VALUES 
(1, 'Comum', 'A-01', 'Livre'),
(1, 'PCD', 'P-01', 'Ocupada'),
(2, 'Idoso', 'I-05', 'Livre'),
(3, 'VIP', 'V-10', 'Ocupada'),
(4, 'Comum', 'B-12', 'Livre'),
(5, 'Comum', 'C-03', 'Livre'),
(6, 'Idoso', 'I-01', 'Ocupada'),
(7, 'VIP', 'V-01', 'Ocupada'),
(8, 'PCD', 'P-10', 'Livre'),
(9, 'Comum', 'D-22', 'Livre');

CREATE TABLE historico_ocupacao(
id_log INT PRIMARY KEY AUTO_INCREMENT,
id_shopping INT,
id_vaga INT,
tipo_acao VARCHAR(11),
dataRegistro DATETIME DEFAULT NOW(),
CONSTRAINT cTipo_acao CHECK(tipo_acao IN('Bloqueio','Desbloqueio'))
);

INSERT INTO historico_ocupacao (id_shopping, id_vaga, tipo_acao) VALUES 
(1, 1, 'Bloqueio'),
(1, 2, 'Bloqueio'),
(2, 3, 'Desbloqueio'),
(2, 4, 'Bloqueio'),
(3, 5, 'Bloqueio'),
(4, 6, 'Desbloqueio'),
(5, 7, 'Bloqueio'),
(6, 8, 'Bloqueio'),
(7, 9, 'Desbloqueio'),
(8, 10, 'Bloqueio');


-- SESSÕES DE SELECT 
-- Relatório de Shoppings com Classificação de Ticket 
SELECT 
    nome_shopping AS 'Nome do Shopping',
    cnpj AS 'CNPJ',
    ticket_medio AS 'Ticket Médio (R$)',
    CASE
        WHEN ticket_medio >= 15.00 THEN 'Ticket Alto'
        WHEN ticket_medio BETWEEN 10.00 AND 14.99 THEN 'Ticket Intermediário'
        ELSE 'Ticket Baixo'
    END AS 'Classificação do Ticket'
FROM shoppings
ORDER BY ticket_medio DESC;

-- Analise de vagas especiais em shoppings especificos
SELECT 
    nome_shopping AS 'Shopping',
    num_vagas_total AS 'Total de Vagas',
    (num_vagas_idoso + num_vagas_pcd) AS 'Total de Vagas Especiais (PCD + Idoso)'
FROM shoppings 
WHERE id_shopping IN(1,2,3,4,5,6,7);

