create database smartpark;
use smartpark;
CREATE TABLE estacionamento (
    id_estacionamento   INT AUTO_INCREMENT PRIMARY KEY,
    id_cadastro     INT,
    nome_estacionamento VARCHAR(150) NOT NULL,
    endereco            VARCHAR(200),
    numero              VARCHAR(10),
    bairro              VARCHAR(80),
    cidade              VARCHAR(80),
    estado              CHAR(2),
    cep                 VARCHAR(10),
    capacidade_total    INT,
    total_idoso         INT DEFAULT 0,
    total_deficiente    INT DEFAULT 0,
    valor_ticket        DECIMAL(6,2),
    status              VARCHAR(20)  DEFAULT 'ativo'
);
CREATE TABLE cadastro (
    id_cadastro     INT AUTO_INCREMENT PRIMARY KEY,
    cnpj            VARCHAR(18)  NOT NULL UNIQUE,
    email           VARCHAR(100) NOT NULL,
    telefone        VARCHAR(20),
    celular         VARCHAR(20),
    responsavel     VARCHAR(100),
    endereco        VARCHAR(200),
    numero          VARCHAR(10),
    bairro          VARCHAR(80),
    cidade          VARCHAR(80),
    estado          CHAR(2),
    cep             VARCHAR(10),
    data_cadastro   DATE,
    status          VARCHAR(20)  DEFAULT 'ativo'
);
CREATE TABLE arduino (
    id_arduino      INT AUTO_INCREMENT PRIMARY KEY,
    codigo_arduino  VARCHAR(50)  NOT NULL UNIQUE,
    modelo          VARCHAR(80),
    data_instalacao DATE,
    status          VARCHAR(20)  DEFAULT 'ativo',
    observacao      VARCHAR(200),
    constraint cstatus check(cstatus in('ativo','N_ativo'))
);
CREATE TABLE vagas (
    id_vaga INT AUTO_INCREMENT PRIMARY KEY,
    id_estacionamento INT,
    id_arduino     INT,
    numero_vaga         VARCHAR(10) NOT NULL,
    andar               VARCHAR(10),
    setor               VARCHAR(30),
    tipo_vaga           VARCHAR(30) DEFAULT 'comum',
    -- tipo_vaga: comum, idoso, deficiente, vip, moto
    constraint ctipo_vaga check(tipo_vaga('comum','idoso','deficiente','vip','moto'))
);

-- parte dos codigos de dados

-- Cadastros
INSERT INTO cadastro (cnpj, email, telefone, responsavel, cidade, estado, data_cadastro) VALUES
('12.345.678/0001-90', 'joao@park.com', '(11) 98765-4321', 'João Silva', 'São Paulo', 'SP', '2024-01-15'),
('98.765.432/0001-10', 'maria@park.com', '(21) 99876-5432', 'Maria Santos', 'Rio de Janeiro', 'RJ', '2024-02-20');

-- Estacionamentos
INSERT INTO estacionamento (id_cadastro, nome_estacionamento, cidade, capacidade_total, valor_ticket) VALUES
(1, 'Park Center', 'São Paulo', 100, 15.00),
(2, 'Park VIP', 'Rio de Janeiro', 80, 12.50);

-- Arduinos
INSERT INTO arduino (codigo_arduino, modelo, data_instalacao) VALUES
('ARD-001', 'Arduino Uno', '2024-01-20'),
('ARD-002', 'Arduino Mega', '2024-02-25');

-- Vagas
INSERT INTO vagas (id_estacionamento, id_arduino, numero_vaga, tipo_vaga) VALUES
(1, 1, 'A-001', 'comum'),
(1, 1, 'A-002', 'comum'),
(1, 1, 'I-001', 'idoso'),
(1, 1, 'D-001', 'deficiente'),
(2, 2, 'B-001', 'comum'),
(2, 2, 'V-001', 'vip');


-- Ver todos os estacionamentos
SELECT * FROM estacionamento;

-- Ver vagas de um estacionamento
SELECT numero_vaga, tipo_vaga FROM vagas WHERE id_estacionamento = 1;


-- Estacionamentos com responsável
SELECT e.nome_estacionamento, c.responsavel, c.email
FROM estacionamento e
JOIN cadastro c ON e.id_cadastro = c.id_cadastro;

-- Arduinos ativos
SELECT codigo_arduino, modelo FROM arduino WHERE status = 'ativo';