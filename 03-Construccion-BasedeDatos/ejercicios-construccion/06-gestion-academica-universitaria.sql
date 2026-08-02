CREATE DATABASE gestion_academica_universitaria;  
GO

USE gestion_academica_universitaria;
GO


-- TABLA DEPARTAMENTO
CREATE TABLE departamento(
	num_depto INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(60) NOT NULL,
	edificio VARCHAR(40) NOT NULL,

	CONSTRAINT pk_departamento
	PRIMARY KEY (num_depto)

);
GO


-- TABLA PROFESOR
CREATE TABLE profesor(
	num_prof INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(50) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50) NOT NULL,
	num_depto INT NOT NULL,

	CONSTRAINT pk_profesor
	PRIMARY KEY (num_prof),

	CONSTRAINT fk_profesor_departamento
	FOREIGN KEY (num_depto)
	REFERENCES departamento(num_depto)

);
GO


-- TABLA ALUMNO
CREATE TABLE alumno(
	matricula INT NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50) NOT NULL,
	correo VARCHAR(100) NOT NULL,
	tel VARCHAR(15) NOT NULL,

	CONSTRAINT pk_alumno
	PRIMARY KEY (matricula),

	CONSTRAINT uq_alumno_correo
	UNIQUE (correo)

);
GO


-- TABLA CREDENCIAL
CREATE TABLE credencial(
	num_credencial INT NOT NULL IDENTITY(1,1),
	fecha_inscripcion DATE NOT NULL,
	vigencia DATE NOT NULL,
	matricula INT NOT NULL,

	CONSTRAINT pk_credencial
	PRIMARY KEY (num_credencial),

	CONSTRAINT uq_credencial_matricula
	UNIQUE (matricula),

	CONSTRAINT fk_credencial_alumno
	FOREIGN KEY (matricula)
	REFERENCES alumno(matricula)

);
GO


-- TABLA MATERIA
CREATE TABLE materia(
	clave_materia VARCHAR(10) NOT NULL,
	nombre_mat VARCHAR(100) NOT NULL,
	creditos INT NOT NULL,

	CONSTRAINT pk_materia
	PRIMARY KEY (clave_materia)

);
GO


-- TABLA CURSA
CREATE TABLE cursa(
	matricula INT NOT NULL,
	clave_materia VARCHAR(10) NOT NULL,
	fecha_inscripcion DATE NOT NULL,
	cali_final DECIMAL(4,2),

	CONSTRAINT pk_cursa
	PRIMARY KEY (matricula, clave_materia),

	CONSTRAINT ck_cursa_calificacion
	CHECK (cali_final BETWEEN 0 AND 10),

	CONSTRAINT fk_cursa_alumno
	FOREIGN KEY (matricula)
	REFERENCES alumno(matricula),

	CONSTRAINT fk_cursa_materia
	FOREIGN KEY (clave_materia)
	REFERENCES materia(clave_materia)

);
GO


-- TABLA IMPARTE
CREATE TABLE imparte(
	clave_materia VARCHAR(10) NOT NULL,
	num_prof INT NOT NULL,

	CONSTRAINT pk_imparte
	PRIMARY KEY (clave_materia,num_prof),

	CONSTRAINT fk_imparte_materia
	FOREIGN KEY (clave_materia)
	REFERENCES materia(clave_materia),

	CONSTRAINT fk_imparte_profesor
	FOREIGN KEY (num_prof)
	REFERENCES profesor(num_prof)

);
GO


-- TABLA PROYECTO
CREATE TABLE proyecto(
	num_proyecto INT NOT NULL IDENTITY(1,1),
	nombre_proyecto VARCHAR(100) NOT NULL,
	presupuesto DECIMAL(12,2) NOT NULL,

	CONSTRAINT pk_proyecto
	PRIMARY KEY(num_proyecto),

	CONSTRAINT ck_proyecto_presupuesto
	CHECK(presupuesto > 0)

);
GO


-- TABLA DEPENDIENTE
CREATE TABLE dependiente(
	id_dependiente INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(100) NOT NULL,
	fecha_naci DATE NOT NULL,
	parentesco VARCHAR(30) NOT NULL,
	num_prof INT NOT NULL,

	CONSTRAINT pk_dependiente
	PRIMARY KEY(id_dependiente),

	CONSTRAINT fk_dependiente_profesor
	FOREIGN KEY(num_prof)
	REFERENCES profesor(num_prof)

);
GO


-- TABLA PARTICIPA
CREATE TABLE participa(
	num_prof INT NOT NULL,
	num_proyecto INT NOT NULL,
	fecha_inicio DATE NOT NULL,

	CONSTRAINT pk_participa
	PRIMARY KEY(num_prof,num_proyecto),

	CONSTRAINT fk_participa_profesor
	FOREIGN KEY(num_prof)
	REFERENCES profesor(num_prof),

	CONSTRAINT fk_participa_proyecto
	FOREIGN KEY(num_proyecto)
	REFERENCES proyecto(num_proyecto)

);
GO