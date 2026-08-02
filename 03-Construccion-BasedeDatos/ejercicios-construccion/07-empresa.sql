CREATE DATABASE empresa;
GO

USE empresa;
GO


-- TABLA PUESTO
CREATE TABLE puesto(
	clave VARCHAR(10) NOT NULL,
	nombre VARCHAR(60) NOT NULL,
	salario_min DECIMAL(10,2) NOT NULL,
	salario_max DECIMAL(10,2) NOT NULL,
	nivel_jerarquico INT NOT NULL,

	CONSTRAINT pk_puesto
	PRIMARY KEY (clave),

	CONSTRAINT ck_puesto_salario_min
	CHECK (salario_min > 0),

	CONSTRAINT ck_puesto_salario_max
	CHECK (salario_max > 0)

);
GO


-- TABLA SUCURSAL
CREATE TABLE sucursal(
	clave VARCHAR(10) NOT NULL,
	nombre VARCHAR(60) NOT NULL,
	telefono VARCHAR(15) NOT NULL,
	ciudad VARCHAR(50) NOT NULL,
	estado VARCHAR(50) NOT NULL,

	CONSTRAINT pk_sucursal
	PRIMARY KEY (clave)

);
GO


-- TABLA DEPARTAMENTO
CREATE TABLE departamento(
	clave_depto INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(60) NOT NULL,
	ubicacion VARCHAR(60) NOT NULL,
	presupuesto DECIMAL(12,2) NOT NULL,
	num_empl_admin INT NOT NULL,

	CONSTRAINT pk_departamento
	PRIMARY KEY (clave_depto),

	CONSTRAINT ck_departamento_presupuesto
	CHECK (presupuesto > 0)

);
GO


-- TABLA EMPLEADO
CREATE TABLE empleado(
	num_empl INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(50) NOT NULL,
	ap1 VARCHAR(50) NOT NULL,
	ap2 VARCHAR(50) NOT NULL,
	fecha_nac DATE NOT NULL,
	curp VARCHAR(18) NOT NULL,
	num_empl_jefe INT,
	clave_depto INT NOT NULL,
	clave_puesto VARCHAR(10) NOT NULL,
	clave_sucursal VARCHAR(10) NOT NULL,

	CONSTRAINT pk_empleado
	PRIMARY KEY (num_empl),

	CONSTRAINT uq_empleado_curp
	UNIQUE(curp),

	CONSTRAINT fk_empleado_jefe
	FOREIGN KEY(num_empl_jefe)
	REFERENCES empleado(num_empl),

	CONSTRAINT fk_empleado_departamento
	FOREIGN KEY(clave_depto)
	REFERENCES departamento(clave_depto),

	CONSTRAINT fk_empleado_puesto
	FOREIGN KEY(clave_puesto)
	REFERENCES puesto(clave),

	CONSTRAINT fk_empleado_sucursal
	FOREIGN KEY(clave_sucursal)
	REFERENCES sucursal(clave)

);
GO


-- CREAR FOREIGN KEY DEPARTAMENTO - EMPLEADO
ALTER TABLE departamento
ADD CONSTRAINT fk_departamento_empleado_admin
FOREIGN KEY(num_empl_admin)
REFERENCES empleado(num_empl);
GO


-- TABLA CAPACITACIONES
CREATE TABLE capacitaciones(
	clave_cap INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(100) NOT NULL,

	CONSTRAINT pk_capacitaciones
	PRIMARY KEY(clave_cap)

);
GO


-- TABLA PROYECTO
CREATE TABLE proyecto(
	clave INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(100) NOT NULL,
	presupuesto DECIMAL(12,2) NOT NULL,
	fecha_ini DATE NOT NULL,
	fecha_termino DATE NOT NULL,

	CONSTRAINT pk_proyecto
	PRIMARY KEY(clave),

	CONSTRAINT ck_proyecto_presupuesto
	CHECK(presupuesto > 0)

);
GO


-- TABLA ASISTIR
CREATE TABLE asistir(
	num_empl INT NOT NULL,
	clave_cap INT NOT NULL,
	fecha_ins DATE NOT NULL,
	calificacion DECIMAL(4,2),
	status VARCHAR(20) NOT NULL,

	CONSTRAINT pk_asistir
	PRIMARY KEY(num_empl, clave_cap),

	CONSTRAINT ck_asistir_calificacion
	CHECK(calificacion BETWEEN 0 AND 10),

	CONSTRAINT fk_asistir_empleado
	FOREIGN KEY(num_empl)
	REFERENCES empleado(num_empl),

	CONSTRAINT fk_asistir_capacitacion
	FOREIGN KEY(clave_cap)
	REFERENCES capacitaciones(clave_cap)

);
GO


-- TABLA PARTICIPA
CREATE TABLE participa(
	num_empl INT NOT NULL,
	clave_proyecto INT NOT NULL,
	fecha_asignacion DATE NOT NULL,
	rol VARCHAR(40) NOT NULL,
	horas INT NOT NULL,

	CONSTRAINT pk_participa
	PRIMARY KEY(num_empl, clave_proyecto),

	CONSTRAINT ck_participa_horas
	CHECK(horas > 0),

	CONSTRAINT fk_participa_empleado
	FOREIGN KEY(num_empl)
	REFERENCES empleado(num_empl),

	CONSTRAINT fk_participa_proyecto
	FOREIGN KEY(clave_proyecto)
	REFERENCES proyecto(clave)

);
GO