if DB_ID('VentasETL') is null
create database VentasETL
go

use VentasETL
go

if OBJECT_ID('Clientes') is null
create table Clientes(
	idCliente nvarchar(100) primary key,
	nombres nvarchar(150),
	apellidoPaterno nvarchar(100),
	apellidoMaterno nvarchar(100)
)
go

-- Inserciones de prueba: sólo insertan si no existe el idCliente
IF NOT EXISTS (SELECT 1 FROM Clientes WHERE idCliente = 'C001')
INSERT INTO Clientes(idCliente, nombres, apellidoPaterno, apellidoMaterno)
VALUES('C001', N'Juan', N'Pérez', N'Gómez');

IF NOT EXISTS (SELECT 1 FROM Clientes WHERE idCliente = 'C002')
INSERT INTO Clientes(idCliente, nombres, apellidoPaterno, apellidoMaterno)
VALUES('C002', N'María', N'Rodríguez', N'López');

IF NOT EXISTS (SELECT 1 FROM Clientes WHERE idCliente = 'C003')
INSERT INTO Clientes(idCliente, nombres, apellidoPaterno, apellidoMaterno)
VALUES('C003', N'Carlos', N'Sánchez', N'Martínez');

IF NOT EXISTS (SELECT 1 FROM Clientes WHERE idCliente = 'C004')
INSERT INTO Clientes(idCliente, nombres, apellidoPaterno, apellidoMaterno)
VALUES('C004', N'Lucía', N'Hernández', N'Ruiz');

IF NOT EXISTS (SELECT 1 FROM Clientes WHERE idCliente = 'C005')
INSERT INTO Clientes(idCliente, nombres, apellidoPaterno, apellidoMaterno)
VALUES('C005', N'Miguel', N'Fernández', N'Vargas');

IF NOT EXISTS (SELECT 1 FROM Clientes WHERE idCliente = 'C006')
INSERT INTO Clientes(idCliente, nombres, apellidoPaterno, apellidoMaterno)
VALUES('C006', N'Ana', N'Gutiérrez', N'Ortiz');
go

if OBJECT_ID('Ventas') is null
create table Ventas(
	idVenta int primary key,
	fechaVenta datetime2,
	idCliente nvarchar(100) foreign key references Clientes(idCliente),
	producto nvarchar(200),
	cantidad int,
	precioUnitario decimal(18,2),
	importeTotal decimal(18,2),
	estado nvarchar(100)
)
go
