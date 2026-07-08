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

SELECT *
FROM materia;
GO