CREATE DATABASE smart_park;
USE smart_park;

CREATE TABLE empresa(
	id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR(45) NOT NULL,
    email_empresa VARCHAR(45) NOT NULL,
    cnpj_empresa VARCHAR(25) NOT NULL,
    endereco_empresa VARCHAR(45) NOT NULL,
    qtd_vaga INT NOT NULL,
    valor_vaga DECIMAL(5, 2) NOT NULL,
	dt_cadastro DATE
);

INSERT INTO empresa VALUES
('Sacomã Park','sacomapark@gmail.com', '12.345.678/0001-95', 'Rua Bom Pastor, 258 - Sacomã, São Paulo', 50, 20, CURDATE()),
('Zona Sul Parking','zonasulparking@gmail.com', '98.654.321/0001-10', 'Rua Vergueiro, 3200 - Vila Mariana, São Paulo', 80, 25, CURDATE()),
('Estaciona Fácil','estacionafacil@gmail.com', '67.222.890/0001-54', 'Rua da Consolação, 890 - Consolação, São Paulo', 40, 20, CURDATE());

CREATE TABLE sensor(
	id_sensor INT PRIMARY KEY AUTO_INCREMENT,
    porta_sensor VARCHAR(25) NOT NULL,
    nome_empresa VARCHAR(45) NOT NULL,
    status_conexao VARCHAR(25) NOT NULL,
    status_vaga VARCHAR(15) NOT NULL,
    dt_leitura DATETIME NOT NULL,
    CONSTRAINT Cstatus_conexao CHECK (status_conexao IN ('Ativo', 'Inativo', 'Erro')),
    CONSTRAINT Cstatus_vaga CHECK(status_vaga IN ('Ocupada', 'Livre'))
);

-- A0, A1, A2, A3, A4, A5
INSERT INTO sensor(porta_sensor, nome_empresa, status_conexao, status_vaga, dt_leitura) VALUES
('A0', 'Sacomã Park', 'Ativo', 'Ocupada', '2026-02-26 19:50:00');

INSERT INTO sensor(porta_sensor, nome_empresa, status_conexao, status_vaga, dt_leitura) VALUES
('A0', 'Sacomã Park', 'Ativo', 'Livre', '2026-02-26 20:20:06');

CREATE TABLE relatorio_diario(
	id_relatorio INT PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR(45) NOT NULL,
    dt_relatorio DATE NOT NULL,
    vagas_ocupadas INT,
    receita_estimada DECIMAL(10,2)
);

INSERT INTO relatorio_diario(nome_empresa, dt_relatorio, vagas_ocupadas, receita_estimada) VALUES
('Sacomã Park', CURDATE(), 1, 20);

