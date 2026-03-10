CREATE DATABASE dadosSmartPark;

USE dadosSmartPark;


CREATE TABLE cadastro_empresas (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(150) NOT NULL,
    nome_comercial VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    cep CHAR(8) NOT NULL,
    total_vagas INT NOT NULL CHECK (total_vagas > 0),
    ticket_medio DECIMAL(10,2) NOT NULL CHECK (ticket_medio >= 0),
    data_inicio_contrato DATE NOT NULL,
    status_empresa VARCHAR(20) DEFAULT 'Ativa',
    data_cadastro DATETIME DEFAULT NOW(),

    CONSTRAINT cStatus_empresa 
    CHECK (status_empresa IN ('Ativa','Inativa','Suspensa'))
);

DESC cadastro_empresas;



CREATE TABLE vaga (
    id_vaga INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT NOT NULL,
    codigo_vaga VARCHAR(10) NOT NULL UNIQUE,
    setor VARCHAR(50) NOT NULL,
    andar VARCHAR(15) NOT NULL,
    tipo_vaga VARCHAR(20) DEFAULT 'Comum',
    status_atual VARCHAR(20) DEFAULT 'Livre',
    data_cadastro DATETIME DEFAULT NOW(),

    CONSTRAINT cTipo_vaga 
    CHECK (tipo_vaga IN ('Comum','PCD','Idoso','VIP','Eletrica')),

    CONSTRAINT cStatus_vaga
    CHECK (status_atual IN ('Livre','Ocupada'))
);

DESC vaga;


CREATE TABLE status_vaga (
    id_status INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT NOT NULL,
    id_vaga INT NOT NULL,
    status_vaga VARCHAR(20) NOT NULL,
    data_hora_inicio DATETIME DEFAULT NOW(),
    data_hora_fim DATETIME,

    CONSTRAINT chk_status_hist
    CHECK (status_vaga IN ('Livre','Ocupada','Bloqueada'))
);

ALTER TABLE status_vaga 
ADD COLUMN valor_cobrado DECIMAL(10,2) CHECK (valor_cobrado >= 0);

DESC status_vaga;



CREATE TABLE estatisticas_diarias (
    id_estatistica INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT NOT NULL,
    data_ocupacao DATE NOT NULL DEFAULT CURRENT_DATE(),
    total_vagas INT NOT NULL CHECK (total_vagas > 0),
    vagas_ocupadas INT NOT NULL CHECK (vagas_ocupadas >= 0),
    taxa_ocupacao DECIMAL(5,2) CHECK (taxa_ocupacao BETWEEN 0 AND 100),
    receita_diaria DECIMAL(10,2) CHECK (receita_diaria >= 0),
    horario_pico TIME
);

DESC estatisticas_diarias;


INSERT INTO cadastro_empresas
(razao_social, nome_comercial, cnpj, cidade, estado, logradouro, cep, total_vagas, ticket_medio, data_inicio_contrato)
VALUES
('Shopping Plaza Sul Estacionamento LTDA','Plaza Sul Parking','12345678000199','São Paulo','SP','Praça Leonor Kaupa','04151060',500,12.50,'2025-01-10'),

('Shopping Paulista Parking SA','Paulista Parking','98765432000155','São Paulo','SP','Av Paulista','01311000',350,15.00,'2025-02-15');



INSERT INTO vaga
(id_empresa, codigo_vaga, setor, andar, tipo_vaga)
VALUES
(1,'A01','A','Terreo','Comum'),
(1,'A02','A','Terreo','Comum'),
(1,'A03','A','Terreo','PCD'),
(1,'B01','B','1','Idoso'),

(2,'C01','C','Terreo','Comum'),
(2,'C02','C','Terreo','VIP');



INSERT INTO status_vaga
(id_empresa, id_vaga, status_vaga, data_hora_inicio, data_hora_fim, valor_cobrado)
VALUES
(1,1,'Ocupada','2026-03-09 08:00:00','2026-03-09 10:00:00',20.00),

(1,2,'Ocupada','2026-03-09 09:00:00','2026-03-09 11:00:00',18.00),

(1,3,'Livre','2026-03-09 11:00:00',NULL,NULL),

(2,5,'Ocupada','2026-03-09 07:00:00','2026-03-09 08:30:00',15.00);



INSERT INTO estatisticas_diarias
(id_empresa, total_vagas, vagas_ocupadas, taxa_ocupacao, receita_diaria, horario_pico)
VALUES
(1,500,420,84.00,5200.00,'14:30:00'),

(2,350,300,85.70,4100.00,'13:45:00');



-- Ver todas as empresas
SELECT * FROM cadastro_empresas;

-- Ver todas as vagas
SELECT * FROM vaga;

-- Ver histórico das vagas
SELECT * FROM status_vaga;

-- Ver estatísticas diárias
SELECT * FROM estatisticas_diarias;

-- Ver vagas de uma empresa específica
SELECT codigo_vaga, setor, andar, tipo_vaga
FROM vaga
WHERE id_empresa = 1;

-- Ver vagas ocupadas
SELECT id_vaga, status_vaga, data_hora_inicio
FROM status_vaga
WHERE status_vaga = 'Ocupada';

-- Ver receita diária
SELECT id_empresa, receita_diaria
FROM estatisticas_diarias;

-- Ver taxa de ocupação
SELECT id_empresa, taxa_ocupacao
FROM estatisticas_diarias;


