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

CREATE TABLE status_vaga (
    id_status INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT NOT NULL,
    codigo_vaga VARCHAR(10) NOT NULL,
    status_vaga VARCHAR(20) NOT NULL,
    data_hora_inicio DATETIME DEFAULT NOW(),
    data_hora_fim DATETIME,

    CONSTRAINT chk_status_hist
    CHECK (status_vaga IN ('Livre','Ocupada','Bloqueada'))

);

ALTER TABLE status_vaga ADD COLUMN valor_cobrado DECIMAL(10,2) CHECK (valor_cobrado >= 0);

DESC status_vaga;


CREATE TABLE estatisticas_diarias (
    id_estatistica INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT NOT NULL,
    data_ocupação DATE NOT NULL DEFAULT CURRENT_DATE(),
    total_vagas INT NOT NULL CHECK (total_vagas > 0),
    vagas_ocupadas INT NOT NULL CHECK (vagas_ocupadas >= 0),
    taxa_ocupacao DECIMAL(5,2) CHECK (taxa_ocupacao BETWEEN 0 AND 100),
    receita_diaria DECIMAL(10,2) CHECK (receita_diaria >= 0),
    horario_pico TIME
);


