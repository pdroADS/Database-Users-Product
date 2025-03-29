-- Criando o banco de dados 
CREATE DATABASE Empresa; 
USE Empresa;

-- Criando a tabela de Funcionários 
CREATE TABLE Funcionarios ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL, 
    data_nascimento DATE NOT NULL, 
    salario DECIMAL(10,2) NOT NULL, 
    departamento_id INT NOT NULL, 
    cargo_id INT NOT NULL, 
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(id), 
    FOREIGN KEY (cargo_id) REFERENCES Cargos(id) 
);

-- Criando a tabela de Departamentos 
CREATE TABLE Departamentos ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL 
    );

-- Criando a tabela de Cargos 
CREATE TABLE Cargos ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL, 
    nivel VARCHAR(50) NOT NULL 
    );

-- Inserindo dados na tabela Departamentos 
INSERT INTO Departamentos (nome) VALUES ('TI'), ('RH'), ('Financeiro'), ('Marketing'), ('Vendas');

-- Inserindo dados na tabela Cargos 
INSERT INTO Cargos (nome, nivel) VALUES 
('Analista', 'Pleno'), 
('Gerente', 'Sênior'), 
('Assistente', 'Júnior'), 
('Coordenador', 'Sênior'), 
('Desenvolvedor', 'Pleno');

-- Inserindo dados na tabela Funcionarios 
INSERT INTO Funcionarios (nome, data_nascimento, salario, departamento_id, cargo_id) VALUES 
('Ana Silva', '1985-06-15', 5500.00, 1, 5), 
('Carlos Santos', '1990-03-22', 4800.00, 2, 1), 
('Bruna Costa', '1987-12-10', 6000.00, 3, 2), 
('Daniel Oliveira', '1992-08-05', 5200.00, 1, 5), 
('Fernanda Lima', '1995-09-30', 4500.00, 2, 3), 
('Gustavo Souza', '1980-01-25', 7000.00, 3, 2), 
('Helena Martins', '1983-11-17', 5300.00, 1, 4), 
('Igor Ferreira', '1991-07-08', 4900.00, 2, 1), 
('Juliana Rocha', '1989-04-19', 5600.00, 3, 2), 
('Lucas Mendes', '1993-06-23', 5100.00, 1, 5);



-- QUESTÃO 1: ENCONTRE O MAIOR SALARIO:
SELECT max(salario) FROM Funcionarios; -- 7000

-- QUESTÃO 2: ENCONTRE O MENOR SALARIO:
SELECT min(salario) FROM Funcionarios; -- 4500

-- QUESTÃO 3: QUAL A QUANTIDADE DE FUNCIONARIOS?
SELECT count(id) FROM Funcionarios; -- 10

-- QUESTÃO 4: FILTRE OS FUNCIONARIOS NASCIDOS A PARTIR DE 1990:
SELECT nome FROM Funcionarios WHERE data_nascimento >= '1990-01-01';
-- Carlos Santos
-- Daniel Oliveira
-- Fernanda Lima
-- Igor Ferreira
-- Lucas Mendes

-- QUESTÃO 5: ENCONTRE A MEDIA SALARIAL:
SELECT avg(salario) FROM Funcionarios; -- Media de: 5390,00

-- QUESTÃO 6: EXTRAIA OS 3 PRIMEIOS CARACTERES DO NOME:
SELECT substring(nome, 1,3) FROM Funcionarios;
-- Ana
-- Car
-- Bru
-- Dan
-- Fer
-- Gus
-- Hel
-- Igo
-- Jul
-- Luc


--  QUESTÃO 7: CONTAR QUANTOS FUNCIONARIOS POR DEPARTAMENTO:
SELECT count(*) as qtFunc, d.nome as dep
FROM Funcionarios f
JOIN Departamentos d ON f.departamento_id = d.id
GROUP BY d.nome;
-- FINANCEIRO: 3
-- RH: 3
-- TI: 4

-- QUESTÃO 8: CONTAR QUANTOS FUNCIONARIOS EXISTEM POR CARGO:
SELECT count(*) as qtFunc, c.nome as cargo
FROM Funcionarios f
JOIN Cargos c ON f.cargo_id = c.id
GROUP BY c.nome;
-- 2 ANALISTA
-- 1 ASSITENTE
-- 1 COORDENADOR
-- 3 DESENVOLVEDOR
-- 3 GERENTE






