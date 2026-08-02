CREATE DATABASE escuela;
GO

USE escuela;
GO


-- CREAR TABLA ALUMNO

CREATE TABLE alumno(
	NumAlumno INT NOT NULL IDENTITY(1,1),
	Matricula VARCHAR(15) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Ap1 VARCHAR(50) NOT NULL,
	Ap2 VARCHAR(50),
	Semestre INT NOT NULL,

	CONSTRAINT pk_alumno
	PRIMARY KEY (NumAlumno),

	CONSTRAINT uq_alumno_matricula
	UNIQUE (Matricula)

);
GO



-- CREAR TABLA MATERIA

CREATE TABLE materia(
	ClaveMateria VARCHAR(10) NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
	Creditos INT NOT NULL,

	CONSTRAINT pk_materia
	PRIMARY KEY (ClaveMateria),

	CONSTRAINT uq_materia_nombre
	UNIQUE (Nombre)

);
GO



-- CREAR TABLA INSCRIBE

CREATE TABLE inscribe(
	NumAlumno INT NOT NULL,
	ClaveMateria VARCHAR(10) NOT NULL,
	FechaInscripcion DATE NOT NULL,
	Calificaciones DECIMAL(4,2) NOT NULL,

	CONSTRAINT pk_inscribe
	PRIMARY KEY (NumAlumno, ClaveMateria),

	CONSTRAINT fk_inscribe_alumno
	FOREIGN KEY (NumAlumno)
	REFERENCES alumno (NumAlumno),

	CONSTRAINT fk_inscribe_materia
	FOREIGN KEY (ClaveMateria)
	REFERENCES materia (ClaveMateria)

);
GO