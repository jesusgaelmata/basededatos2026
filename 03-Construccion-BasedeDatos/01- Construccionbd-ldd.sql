-- CREA UNA BASE DE DATOS

CREATE DATABASE universidad;
GO

-- UTILIZAR LA BASE DE DATOS

USE universidad;
GO

-- CREAR UNA TABLA

CREATE TABLE alumno(
    alumno_id INT,
    nombre VARCHAR(100),
    edad INT
);
GO

-- CREAR OTRA TABLA

CREATE TABLE alumno_2(
    alumno_id INT,
    nombre VARCHAR(100),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    fecha_nacimiento DATE,
    correo VARCHAR(45)
);
GO

-- PRIMARY KEY DIRECTA

CREATE TABLE alumno_3(
    alumno_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(40)
);
GO

-- PRIMARY KEY CON CONSTRAINT

CREATE TABLE alumno_4(
    alumno_id INT NOT NULL,
    nombre VARCHAR(100),
    correo VARCHAR(40),
    CONSTRAINT pk_alumno_4 PRIMARY KEY (alumno_id)
);
GO

-- INSERTS

INSERT INTO alumno_4
VALUES (1, 'Panfilo', 'correo@correo.com');

INSERT INTO alumno_4
VALUES (2, 'Monico', 'correo2@correo.com');
GO

-- PRIMARY KEY CON IDENTITY

CREATE TABLE profesor(
    profesor_id INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    edad INT NULL,
    CONSTRAINT pk_profesor PRIMARY KEY (profesor_id)
);
GO

INSERT INTO profesor(nombre, edad)
VALUES
('German', 29),
('Mari', 22);
GO

SELECT *
FROM profesor;
GO

-- UNIQUE

CREATE TABLE materia(
    materia_id INT IDENTITY(1,1) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    CONSTRAINT pk_materia PRIMARY KEY (materia_id),
    CONSTRAINT uq_materia_correo UNIQUE (correo)
);
GO

INSERT INTO materia(correo)
VALUES ('correo@correo.com');

INSERT INTO materia(correo)
VALUES ('correo2@correo.com');
GO

-- Restricción Default
CREATE TABLE categoria (
    categoria_id INT NOT NULL IDENTITY (1,1),
    nombre VARCHAR(30) NOT NULL,
    activo BIT DEFAULT 1

);
GO


CREATE TABLE categoria (
    categoria_id INT NOT NULL IDENTITY (1,1)
    CONSTRAINT  pk_categoria
    PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
    CONSTRAINT uq_categoria_nombre
    UNIQUE,
    activo BIT 
    CONSTRAINT df_categoria_activo
    DEFAULT 1

);
GO

CREATE TABLE categoria (
    categoria_id INT NOT NULL IDENTITY (1,1),
    nombre VARCHAR(30) NOT NULL,
    activo BIT 
    CONSTRAINT df_categoria_activo
    DEFAULT 1,
    CONSTRAINT pk_categoria
    PRIMARY KEY (categoria_id),
    CONSTRAINT uq_categoria_nombre
    UNIQUE (nombre)

);
GO

DROP TABLE categoria;


INSERT INTO categoria
VALUES ('Carnes Frias',1);

INSERT INTO categoria
VALUES ('Carnes Calientes', DEFAULT);

INSERT INTO categoria (nombre)
VALUES ('Chochos', DEFAULT);

-- Restricción Check
-- Opción de construcción 1

CREATE TABLE producto(
    producto_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL UNIQUE,
    precio DECIMAL (10,2) NOT NULL CHECK (precio>0),
    existencia INT NOT NULL CHECK (existencia > 0 AND existencia<=100),
    activo BIT NOT NULL DEFAULT 1



);
GO

-- Opción de construcción 2

CREATE TABLE producto(
    producto_id INT IDENTITY(1,1)
    CONSTRAINT pk_producto
    PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL
    CONSTRAINT uq_producto_nombre
    UNIQUE,
    precio DECIMAL (10, 2) NOT NULL
    CONSTRAINT ck_producto_precio
    CHECK (precio>0),
    existencia INT NOT NULL
    CONSTRAINT ck_producto_existencia
    CHECK (existencia > 0 AND existencia<=100),
    activo BIT NOT NULL
    CONSTRAINT df_producto_activo
    DEFAULT 1
 
);
GO


-- Opción de construcción 3

CREATE TABLE producto (
    producto_id INT NOT NULL,
    nombre VARCHAR (20) NOT NULL,
    descripcion VARCHAR (80),
    precio DECIMAL (10,2) NOT NULL,
    existencia INT NOT NULL,
    activo BIT NOT NULL
    CONSTRAINT df_producto_activo
    DEFAULT 1
    --Restriccion PK
    CONSTRAINT pk_producto
    PRIMARY KEY (producto_id),
    --Restriccion UNIQUE
    CONSTRAINT uq_producto_nombre
    UNIQUE (nombre),
    --Restrccion check precio
    CONSTRAINT ck_producto_precio
    CHECK(precio>0),
    --Restriccion check existencia
    CONSTRAINT ck_producto_existencia
    CHECK (existencia BETWEEN 1 AND 100)

);
GO

INSERT INTO producto
VALUES(1, 'Pitufo', NULL,  200, 99, 0);


INSERT INTO producto
VALUES(2, 'Pitufina',NULL, 200, 100, DEFAULT);


INSERT INTO producto (producto_id,nombre,existencia, precio)
VALUES(3, 'Pantera Rosa', 47, 80);


SELECT *
FROM producto;


-- Crear UNA BASE DE DATOS PARA EMPRESA PATITO

-- CREAR BASE DE DATOS

CREATE DATABASE empresa_patitos
GO

-- USAR LA BASE DE DATOS
USE empresa_patitos;
GO

-- RESTRICCION DE FOREIGN KEY
CREATE TABLE proveedor (
    proveedor_id INT NOT NULL IDENTITY(1,1),
    empresa VARCHAR(35) NOT NULL,
    direccion VARCHAR (80) NULL,
    limite_credito DECIMAL (10,2) NOT NULL,
    --PRIMARY KEY
    CONSTRAINT pk_provedor
    PRIMARY KEY(proveedor_id),
    --UNIQUE
    CONSTRAINT uq_proveedor_empresa
    UNIQUE (empresa),
    --CHECK limite_credito
    CONSTRAINT ck_proveedor_limite_credito
    CHECK (limite_credito >0.0 AND limite_credito <= 100000)
);
GO

CREATE TABLE producto(
    fabricante_id CHAR(3) NOT NULL,
    producto_id INT NOT NULL,
    nombre VARCHAR(20) NOT NULL
    CONSTRAINT uq_producto_nombre
    UNIQUE,
    stock INT NOT NULL
    CONSTRAINT ck_producto_stock
    CHECK (stock BETWEEN 1 AND 100),
    precio DECIMAL (10,2) NOT NULL,
    CONSTRAINT ck_producto_precio
    CHECK (precio > 0.0),
    activo BIT NOT NULL
    CONSTRAINT df_producto-activo
    DEFAULT 1,
    proveedor_id INT NOT NULL;
    CONSTRAINT pk_producto
    PRIMARY KEY (fabricante_id , producto_id),
    CONSTRAINT fk_producto_proveedor
    FOREIGN KEY (proveedor_id)
    REFERENCES proveedor (proveedor_id)




);
GO


-- INTEGRIDADES REFERENCIALES ON DELETE ON UPDATE
-- NO ACTION, CASCADE, SET NULL, SET DEFAULT

DROP DATABASE IF EXISTS construccion;
GO

CREATE DATABASE construccion;
GO

USE construccion;
GO

-- NO ACTION

CREATE TABLE cliente(
    cliente_id INT
    CONSTRAINT pk_cliente
    PRIMARY KEY,
    empresa VARCHAR (20)
    CONSTRAINT uq_cliente_empresa
    UNIQUE,
    direccion VARCHAR (50),
    tel VARCHAR (15) NOT NULL,
    activo BIT NOT NULL,
    created_at DATETIME2 NOT NULL
    CONSTRAINT df_cliente_created_at
    DEFAULT SYSDATETIME (),
    updated_at DATETIME2 NOT NULL
    CONSTRAINT df_cliente_updated_at
    DEFAULT SYSDATETIME ()
);
GO

CREATE TABLE telefono(
telefono_id INT IDENTITY (1,1),
numero_telefono VARCHAR (15) NOT NULL,
created_at DATETIME2 NOT NULL
CONSTRAINT df_telefono_created_at
DEFAULT SYSDATETIME(),
updated_at DATETIME2 NOT NULL
CONSTRAINT df_telefono_updated_at
DEFAULT SYSDATETIME(),
cliente_id INT,
CONSTRAINT pk_telefono
PRIMARY KEY (telefono_id),
CONSTRAINT uq_telefono_numero_telefono
UNIQUE (numero_telefono),
CONSTRAINT ck_telefono_numero_telefono
CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
CONSTRAINT fk_telefono_cliente
FOREIGN KEY (cliente_id)
REFERENCES cliente (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

INSERT INTO cliente
VALUES (1, 'Patito de Hule', NULL, '773-123-4567', 1, DEFAULT, DEFAULT);

INSERT INTO cliente (cliente_id, empresa, tel, activo)
VALUES (2, 'Taqueria Mr. Linux', '773-168-0461', 1);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('111-345-2345', 1);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('111-345-3456', 1),
       ('455-678-1234', 1),
       ('866-672-2345', 1),
       ('466-674-5678', 2);

SELECT * FROM cliente;

SELECT * FROM telefono;


-- ELIMINAR con ON DELETE EN NO ACTION
-- ELIMINAR LOS HIJOS

DELETE FROM telefono
WHERE cliente_id =1;

-- ELIMINA el padre
DELETE FROM telefono
WHERE cliente_id = 1;

-- Actualizar ON UPDATE en NO ACTION

--Actualiza el hijo (poniendo en nulo)
UPDATE telefono
SET cliente_id = NULL
WHERE cliente_id = 2;

-- ACTUALIZA el hijo con el nuevo id del padre
UPDATE telefono
SET cliente_id = 3
WHERE cliente_id IS NULL;


UPDATE cliente
SET cliente_id = 3
WHERE cliente_id = 1;












CREATE TABLE telefono(
telefono_id INT IDENTITY (1,1),
numero_telefono VARCHAR (15) NOT NULL,
created_at DATETIME2 NOT NULL
CONSTRAINT df_telefono_created_at
DEFAULT SYSDATETIME(),
updated_at DATETIME2 NOT NULL
CONSTRAINT df_telefono_updated_at
DEFAULT SYSDATETIME(),
cliente_id INT,
CONSTRAINT pk_telefono
PRIMARY KEY (telefono_id),
CONSTRAINT uq_telefono_numero_telefono
UNIQUE (numero_telefono),
CONSTRAINT ck_telefono_numero_telefono
CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
CONSTRAINT fk_telefono_cliente
FOREIGN KEY (cliente_id)
REFERENCES cliente (cliente_id)
ON DELETE SET NULL
ON UPDATE SET NULL
);
GO

INSERT INTO cliente (cliente_id,empresa,tel,activo)
VALUES (11,'Bimbo', '566788999',1);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('111-345-2379', 11);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('162-342-3451', 11),
       ('485-673-1556', 11),
       ('747-789-7731', 11),
       ('453-123-5536', 11);


DELETE FROM cliente
WHERE cliente_id= 11;


SELECT *
FROM cliente;

SELECT *
FROM telefono;

-- ON DELETE Y OM UPDATE SET NULL


CREATE TABLE telefono(
telefono_id INT IDENTITY (1,1),
numero_telefono VARCHAR (15) NOT NULL,
created_at DATETIME2 NOT NULL
CONSTRAINT df_telefono_created_at
DEFAULT SYSDATETIME(),
updated_at DATETIME2 NOT NULL
CONSTRAINT df_telefono_updated_at
DEFAULT SYSDATETIME(),
cliente_id INT
CONSTRAINT df_telefono_cliente_id
DEFAULT 0,
CONSTRAINT pk_telefono
PRIMARY KEY (telefono_id),
CONSTRAINT uq_telefono_numero_telefono
UNIQUE (numero_telefono),
CONSTRAINT ck_telefono_numero_telefono
CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
CONSTRAINT fk_telefono_cliente
FOREIGN KEY (cliente_id)
REFERENCES cliente (cliente_id)
ON DELETE SET DEFAULT
ON UPDATE SET DEFAULT
);
GO

INSERT INTO cliente (cliente_id,empresa,tel,activo)
VALUES (0,'Mostrador', '77777777',1);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('111-345-2379', 1);

INSERT INTO telefono (numero_telefono, cliente_id)
VALUES ('162-342-3451', 1),
       ('485-673-1556', 1),
       ('747-789-7731', 1),
       ('453-123-5536', 2);



DELETE FROM cliente
WHERE cliente_id = 1;

UPDATE cliente
SET cliente_id = 20
WHERE cliente_id = 2;

SELECT *
FROM cliente;

SELECT *
FROM telefono;





