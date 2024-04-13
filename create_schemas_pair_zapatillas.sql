CREATE SCHEMA tienda_zapatillas;
USE tienda_zapatillas;
CREATE TABLE zapatillas (
    Id_zapatilla INT NOT NULL AUTO_INCREMENT,
    Modelo VARCHAR (45),
    Color VARCHAR (100),
    PRIMARY KEY (Id_zapatilla)
    );
    CREATE TABLE cliente (
    Id_cliente INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR (30) NOT NULL,
    Telefono INT ,
    Email VARCHAR (30),
    Direccion VARCHAR (30),
    Provincia VARCHAR (30),
    Pais VARCHAR (30),
    Codigo_Postal VARCHAR (30),
    PRIMARY KEY (Id_cliente)
    );
    
    CREATE TABLE empleados (
    Id_empleados INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR (30) NOT NULL,
    Tienda VARCHAR (30),
    Salario FLOAT ,
    Provincia VARCHAR (30),
    Pais VARCHAR (30),
    Fecha_incorporacion DATE,
    PRIMARY KEY (Id_empleados)
    );
    
    CREATE TABLE facturas (
    Id_factura INT NOT NULL AUTO_INCREMENT,
    Nombre_factura VARCHAR (45) NOT NULL,
    Fecha DATE NOT NULL,
    Id_zapatilla INT NOT NULL,
    Id_empleado INT NOT NULL,
    Id_cliente INT NOT NULL,
	PRIMARY KEY (Id_factura),
    CONSTRAINT fk_factura_zapatilla 
		FOREIGN KEY (Id_zapatilla)
		REFERENCES Zapatillas(Id_zapatilla) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_factura_empleado
		FOREIGN KEY (Id_empleados)
		REFERENCES empleados(Id_empleados) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_factura_cliente
		FOREIGN KEY (Id_cliente)
		REFERENCES clientes (Id_cliente) ON DELETE CASCADE ON UPDATE CASCADE
    );            