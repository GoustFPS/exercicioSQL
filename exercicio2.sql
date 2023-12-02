-- Criando a base de dados
CREATE DATABASE exercicio1;

-- Selecionando a base de dados
USE exercicio1;

-- Criando tabela "Clientes"
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(50)
);

-- Inserindo dados na tabela "Clientes"
INSERT INTO Clientes (ClienteID, Nome, Email)
VALUES (1, 'João Silva', 'joao@email.com'),
       (2, 'Maria Oliveira', 'maria@email.com');

-- Criando tabela "Pedidos"
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    Produto VARCHAR(50),
    Quantidade INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Inserindo dados na tabela "Pedidos"
INSERT INTO Pedidos (PedidoID, ClienteID, Produto, Quantidade)
VALUES (101, 1, 'Laptop', 2),
       (102, 2, 'Smartphone', 1);

-- Consulta usando INNER JOIN para obter informações do cliente e do pedido
SELECT Clientes.Nome, Pedidos.Produto, Pedidos.Quantidade
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;
