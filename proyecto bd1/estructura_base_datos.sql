
-- Estructura de base de datos para TecnoMarket S.A.

CREATE DATABASE IF NOT EXISTS TecnoMarket;
USE TecnoMarket;

CREATE TABLE Clientes (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE Proveedores (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20)
);

CREATE TABLE Productos (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    IdProveedor INT,
    FOREIGN KEY (IdProveedor) REFERENCES Proveedores(Id)
);

CREATE TABLE Empleados (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Ventas (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATETIME NOT NULL,
    IdCliente INT,
    IdEmpleado INT,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(Id),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleados(Id)
);

CREATE TABLE DetalleVentas (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    IdVenta INT,
    IdProducto INT,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (IdVenta) REFERENCES Ventas(Id),
    FOREIGN KEY (IdProducto) REFERENCES Productos(Id)
);
