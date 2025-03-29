CREATE DATABASE Loja;
USE Loja;

CREATE TABLE Clientes(
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
endereco VARCHAR(50) NOT NULL,
cep INT NOT NULL
);
INSERT INTO Clientes (nome, endereco, cep)
VALUES 
('paulo', 'Rua Karina: 123', 8765092),
('Kaique', 'Rua Pinto: 235', 1248751),
('Nathalia', 'Rua Alegria: 235', 5171545);
SELECT * FROM Clientes;
ALTER TABLE Clientes
ADD COLUMN cidade VARCHAR(50);

SELECT * FROM Clientes;

CREATE TABLE Pedidos(
	num_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    item VARCHAR(50) NOT NULL,
    valor FLOAT NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente)
);

SELECT * FROM Pedidos;
INSERT INTO Pedidos (data_pedido, item, valor, id_cliente)
VALUES 
('2004-04-12', 'Kaique', 2.00, 1),
('2006-01-09', 'Nathalia', 2.01, 2),
('2006-05-18', 'Bedro', 0.01, 3);