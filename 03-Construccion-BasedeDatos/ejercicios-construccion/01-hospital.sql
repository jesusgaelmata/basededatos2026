CREATE DATABASE hospital;
GO

USE hospital;
GO


-- CREAR TABLA PACIENTE

CREATE TABLE paciente(
	NumPaciente INT NOT NULL IDENTITY(1,1),
	Nombre VARCHAR(50) NOT NULL,
	Apellido1 VARCHAR(50) NOT NULL,
	Apellido2 VARCHAR(50),
	FechaNaci DATE NOT NULL,

	CONSTRAINT pk_paciente
	PRIMARY KEY (NumPaciente)
);
GO



-- CREAR TABLA EXPEDIENTE

CREATE TABLE expediente(
	NumExpediente INT NOT NULL IDENTITY(1,1),
	FechaApertura DATE NOT NULL,
	TipoSangre VARCHAR(5) NOT NULL,
	NumPaciente INT NOT NULL,

	CONSTRAINT pk_expediente
	PRIMARY KEY (NumExpediente),

	CONSTRAINT uq_expediente_paciente
	UNIQUE (NumPaciente),

	CONSTRAINT fk_expediente_paciente
	FOREIGN KEY (NumPaciente)
	REFERENCES paciente (NumPaciente)

);
GO

