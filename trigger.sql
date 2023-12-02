-- Criar um banco de dados
CREATE DATABASE IF NOT EXISTS triggerEX;

-- Usar o banco de dados
USE triggerEX;

-- Criar uma tabela "Clientes"
CREATE TABLE IF NOT EXISTS Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(50)
);

-- Criar uma tabela "Compras"
CREATE TABLE IF NOT EXISTS Compras (
    CompraID INT PRIMARY KEY,
    ClienteID INT,
    Produto VARCHAR(50),
    Valor DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Criar um trigger para registrar inserções na tabela "Compras"
DELIMITER //
CREATE TRIGGER registro_compra
AFTER INSERT ON Compras
FOR EACH ROW
BEGIN
    INSERT INTO RegistroCompras (CompraID, Data) VALUES (NEW.CompraID, NOW());
END;
//
DELIMITER ;

-- Criar uma tabela "RegistroCompras" para armazenar os registros de inserção na tabela "Compras"
CREATE TABLE IF NOT EXISTS RegistroCompras (
    RegistroID INT PRIMARY KEY,
    CompraID INT,
    Data DATETIME,
    FOREIGN KEY (CompraID) REFERENCES Compras(CompraID)
);
