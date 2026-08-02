CREATE DATABASE gestion_pedidos;
GO

USE gestion_pedidos;
GO


-- CREAR TABLA CLIENTE

CREATE TABLE cliente(
	NumCliente INT NOT NULL IDENTITY(1,1),
	Nombre VARCHAR(50) NOT NULL,
	Apellido1 VARCHAR(50) NOT NULL,
	Apellido2 VARCHAR(50) NOT NULL,

	CONSTRAINT pk_cliente
	PRIMARY KEY (NumCliente)

);
GO



-- CREAR TABLA PEDIDO

CREATE TABLE pedido(
	NumPedido INT NOT NULL IDENTITY(1,1),
	FechaPedido DATE NOT NULL,
	Cliente_fk INT NOT NULL,

	CONSTRAINT pk_pedido
	PRIMARY KEY (NumPedido),

	CONSTRAINT fk_pedido_cliente
	FOREIGN KEY (Cliente_fk)
	REFERENCES cliente (NumCliente)

);
GO



-- CREAR TABLA PRODUCTO

CREATE TABLE producto(
	NumProducto INT NOT NULL IDENTITY(1,1),
	Nombre VARCHAR(100) NOT NULL,
	Precio DECIMAL(10,2) NOT NULL,

	CONSTRAINT pk_producto
	PRIMARY KEY (NumProducto),

	CONSTRAINT uq_producto_nombre
	UNIQUE (Nombre)

);
GO



-- CREAR TABLA DETALLEPEDIDO

CREATE TABLE detallepedido(
	NumPedido_fk INT NOT NULL,
	NumProducto_fk INT NOT NULL,
	PrecioVenta DECIMAL(10,2) NOT NULL,
	CantidadVendida INT NOT NULL,

	CONSTRAINT pk_detallepedido
	PRIMARY KEY (NumPedido_fk, NumProducto_fk),

	CONSTRAINT ck_detallepedido_cantidad
	CHECK (CantidadVendida > 0),

	CONSTRAINT fk_detallepedido_pedido
	FOREIGN KEY (NumPedido_fk)
	REFERENCES pedido (NumPedido),

	CONSTRAINT fk_detallepedido_producto
	FOREIGN KEY (NumProducto_fk)
	REFERENCES producto (NumProducto)

);
GO