create database sprint1;
use sprint1;

create table usuario(
	id_usuario int primary key auto_increment,
    nome varchar(40) not null,
    cpf char(11) not null,
    empresa varchar(40),
    numero varchar(15),
    email varchar(30)
);

INSERT INTO usuario (nome, cpf, empresa, numero, email) VALUES
('Carlos Henrique', '12345678901', 'Tech Solutions', '11987654321', 'carlos.h@gmail.com'),
('Mariana Souza', '98765432100', 'Inova Sistemas', '11991234567', 'mariana.souza@yahoo.com'),
('João Pedro Lima', '45678912345', 'Alpha Tech', '11999887766', 'joao.lima@outlook.com'),
('Fernanda Alves', '32165498700', 'Global Corp', '11995554433', 'fernanda.alves@gmail.com'),
('Lucas Martins', '78912345678', 'NextGen', '11993332211', 'lucas.m@icloud.com'),
('Beatriz Costa', '15975348620', 'Vision TI', '11994445566', 'beatriz.costa@hotmail.com'),
('Rafael Gomes', '75315984210', 'DataPrime', '11997778899', 'rafael.gomes@gmail.com');

create table vagas(
	id int primary key auto_increment,
    numero_vaga int not null,
    setor varchar(20),
    tipo_vaga varchar(20),
    constraint cTipoVaga check(tipo_vaga in('normal', 'PCD', 'idoso', 'moto', 'elétrico'))
);

INSERT INTO vagas (numero_vaga, setor, tipo_vaga) VALUES
(101, 'A', 'normal'),
(102, 'A', 'PCD'),
(201, 'B', 'idoso'),
(202, 'B', 'normal'),
(301, 'C', 'moto'),
(302, 'C', 'elétrico'),
(103, 'A', 'normal');

create table entrada_saida(
	id_movimento int primary key auto_increment,
	data_entrada datetime default current_timestamp,
    data_saida datetime,
    statusVaga varchar(20) default 'livre',
    constraint cStatusVaga check (statusVaga in('livre', 'ocupado'))
);

INSERT INTO entrada_saida (data_saida, statusVaga) VALUES
(NULL, 'livre'),
('2026-02-25 10:30:00', 'ocupado'),
('2026-02-25 12:45:00', 'livre'),
(NULL, 'ocupado'),
('2026-02-24 18:20:00', 'livre'),
(NULL, 'ocupado'),
('2026-02-23 09:10:00', 'livre');

create table pagamento(
	id_pagamento int primary key auto_increment,
    valor decimal(5,2),
    formaPagamento varchar(20),
    dataPagamento datetime,
    statusPagamento varchar(10) default 'Pendente',
    constraint cStatusPagamento check (statusPagamento in('Pendente','Pago')),
    constraint cformaPagamento check(formaPagamento in ('PIX', 'Débito', 'Crédito', 'Dinheiro'))
);

INSERT INTO pagamento (valor, formaPagamento, dataPagamento, statusPagamento) VALUES
(15.00, 'PIX', '2026-02-25 10:30:00', 'Pago'),
(8.50, 'Débito', '2026-02-25 12:00:00', 'Pago'),
(12.00, 'Crédito', '2026-02-24 18:45:00', 'Pendente'),
(5.00, 'Dinheiro', '2026-02-24 09:15:00', 'Pago'),
(9.90, 'PIX', '2026-02-23 14:20:00', 'Pendente'),
(7.50, 'Débito', '2026-02-23 16:10:00', 'Pago'),
(6.00, 'Crédito', '2026-02-22 20:30:00', 'Pago');