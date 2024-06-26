{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "CREATE SCHEMA tienda_zapatillas;\n",
    "USE tienda_zapatillas;\n",
    "CREATE TABLE zapatillas (\n",
    "    Id_zapatilla INT NOT NULL AUTO_INCREMENT,\n",
    "    Modelo VARCHAR (100),\n",
    "    Color VARCHAR (100),\n",
    "    PRIMARY KEY (Id_zapatilla)\n",
    "    );\n",
    "\n",
    "CREATE SCHEMA tienda_zapatillas;\n",
    "USE tienda_zapatillas;\n",
    "CREATE TABLE zapatillas (\n",
    "    Id_zapatilla INT NOT NULL AUTO_INCREMENT,\n",
    "    Modelo VARCHAR(45) NOT NULL,\n",
    "    Color VARCHAR(45) NOT NULL,\n",
    "    PRIMARY KEY (Id_zapatilla)\n",
    ");\n",
    "CREATE TABLE clientes (\n",
    "\tId_cliente INT NOT NULL AUTO_INCREMENT,\n",
    "    Nombre VARCHAR(45) NOT NULL,\n",
    "    Telefono INT NOT NULL,\n",
    "    Email VARCHAR(45) NOT NULL,\n",
    "    Direccion VARCHAR(45) NOT NULL,\n",
    "    Ciudad VARCHAR(45) NOT NULL,\n",
    "    Provincia VARCHAR(45) NOT NULL,\n",
    "    Pais VARCHAR(45) NOT NULL,\n",
    "    Codigo_postal VARCHAR(45) NOT NULL,\n",
    "    PRIMARY KEY (Id_cliente)\n",
    ");\n",
    "CREATE TABLE empleados(\n",
    "\tId_empleado INT NOT NULL AUTO_INCREMENT,\n",
    "\tNombre VARCHAR(45) NOT NULL,\n",
    "    Tienda VARCHAR(45) NOT NULL,\n",
    "    Salario FLOAT,\n",
    "    Fecha_incorporacion DATE,\n",
    "    PRIMARY KEY (Id_empleado)\n",
    ");\n",
    "CREATE TABLE facturas1 (\n",
    "\tId_factura INT NOT NULL AUTO_INCREMENT,\n",
    "    Numero_factura VARCHAR(45) NOT NULL,\n",
    "    Fecha DATE NOT NULL,\n",
    "    Id_zapatilla INT NOT NULL,\n",
    "    Id_empleado INT NOT NULL,\n",
    "    Id_cliente INT NOT NULL,\n",
    "    PRIMARY KEY (Id_factura),\n",
    "    CONSTRAINT `fk_factura_Zapatilla`\n",
    "\t\tFOREIGN KEY (Id_zapatilla)\n",
    "\t\tREFERENCES zapatillas (Id_zapatilla) ON DELETE CASCADE ON UPDATE CASCADE,\n",
    "    CONSTRAINT fk_factura_empleado\n",
    "\t\tFOREIGN KEY (Id_empleado)\n",
    "\t\tREFERENCES empleados (Id_empleado) ON DELETE CASCADE ON UPDATE CASCADE,\n",
    "\tCONSTRAINT fk_factura_cliente\n",
    "\t\tFOREIGN KEY (Id_cliente)\n",
    "        REFERENCES clientes (Id_cliente) ON DELETE CASCADE ON UPDATE CASCADE\n",
    ");\n",
    "USE tienda_zapatillas;\n",
    "\t\n",
    "    ALTER TABLE zapatillas\n",
    "    ADD COLUMN marca VARCHAR(45) NOT NULL, \n",
    "    ADD COLUMN talla INT NOT NULL;\n",
    "    \n",
    "ALTER TABLE empleados\n",
    "MODIFY COLUMN Salario DECIMAL (10, 2) NOT NULL;\n",
    "\n",
    "ALTER TABLE clientes\n",
    "DROP COLUMN Pais;\n",
    "\n",
    "ALTER TABLE facturas1\n",
    "ADD COLUMN Total DECIMAL(10, 2) NOT NULL;\n",
    "\n",
    "INSERT INTO zapatillas (id_zapatilla, modelo, color, marca, talla) \n",
    "VALUES (1, 'XQYUN', 'Negro', 'Nike', 42),\n",
    "(2, 'UOPMN', 'Rosas', 'Nike', 39),\n",
    "(3, 'OPNYT', 'Verdes', 'Adidas', 35);\n",
    "\n",
    "INSERT INTO empleados (Id_empleado, Nombre, tienda, salario, fecha_incorporacion) \n",
    " VALUES (1, 'Laura', 'Alcobendas', 25987, '2010-09-03'), \n",
    " (2, 'Maria', 'Sevilla', 1104, '2001-04-11'), \n",
    " (3, 'Ester', 'Oviedo', 30165.98, '2000-11-29');\n",
    " \n",
    "INSERT INTO clientes (Id_cliente, Nombre, Telefono, email,  direccion, ciudad, provincia, codigo_postal ) \n",
    "VALUES (1, 'Monica', '1234567289', 'monica@email.com', 'Calle Felicidad', 'Móstoles', 'Madrid', '28176'),\n",
    "(2, 'Lorena', '289345678', 'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', '12346'),\n",
    "(3, 'Carmen', '298463759', 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', '23456');\n",
    "\n",
    "INSERT INTO facturas1(id_factura, Numero_factura, fecha, Id_zapatilla, Id_empleado, Id_cliente, total)\n",
    "VALUES (1, '123', '2001-12-11', 1, 2, 1, 54.98),\n",
    "(2, '1234', '2005-05-23', 1, 1, 3, 89.91),\n",
    "(3, '12345', '2015-09-18', 2, 3, 3, 76.23);\n",
    "\n",
    "UPDATE zapatillas\n",
    "SET color = \"Amarillo\"\n",
    "WHERE  color = \"rosas\";\n",
    "\n",
    "SELECT *\n",
    "FROM zapatillas\n",
    "LIMIT 5;\n",
    "\n",
    "UPDATE empleados\n",
    "SET tienda = \"Acoruña\"\n",
    "WHERE  nombre = \"Laura\";\n",
    "\n",
    "SELECT *\n",
    "FROM empleados\n",
    "LIMIT 3;\n",
    "\n",
    "UPDATE clientes\n",
    "SET telefono = \"12345678\"\n",
    "WHERE  nombre = \"Monica\";\n",
    "\n",
    "SELECT *\n",
    "FROM clientes\n",
    "LIMIT 3;\n",
    "\n",
    "UPDATE facturas1\n",
    "SET total = \"89.91\"\n",
    "WHERE  id_zapatilla = 2;\n",
    "\n",
    "SELECT *\n",
    "FROM facturas1\n",
    "LIMIT 3;"
   ]
  }
 ],
 "metadata": {
  "language_info": {
   "name": "python"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
