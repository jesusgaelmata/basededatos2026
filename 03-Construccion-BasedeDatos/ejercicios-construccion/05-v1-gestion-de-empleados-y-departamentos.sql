CREATE DATABASE v1_gestion_empleados_departamentos;
GO

USE v1_gestion_empleados_departamentos;
GO


-- CREAR TABLA EMPLOYEE

CREATE TABLE employee(
	Ssn CHAR(9) NOT NULL,
	FirstName VARCHAR(40) NOT NULL,
	LastName VARCHAR(40) NOT NULL,
	Bdate DATE NOT NULL,
	Address VARCHAR(120) NOT NULL,
	Salary DECIMAL(10,2) NOT NULL,
	Sex CHAR(1) NOT NULL,
	NameProject VARCHAR(60),
	NumberProject INT,
	Jef CHAR(9),

	CONSTRAINT pk_employee
	PRIMARY KEY (Ssn),

	CONSTRAINT fk_employee_jef
	FOREIGN KEY (Jef)
	REFERENCES employee (Ssn)

);
GO


-- CREAR TABLA DEPARTAMENT

CREATE TABLE departament(
	Name VARCHAR(60) NOT NULL,
	Number INT NOT NULL,
	Ssn_fk CHAR(9),
	StartDate DATE NOT NULL,

	CONSTRAINT pk_departament
	PRIMARY KEY (Number),

	CONSTRAINT uq_departament_gerente
	UNIQUE (Ssn_fk),

	CONSTRAINT fk_departament_employee
	FOREIGN KEY (Ssn_fk)
	REFERENCES employee (Ssn)

);
GO


-- CREAR TABLA PROJECT

CREATE TABLE project(
	Name VARCHAR(60) NOT NULL,
	Number INT NOT NULL,
	Location VARCHAR(80) NOT NULL,
	NameProject VARCHAR(60),
	NumberProject INT,
	NumberDepartament INT NOT NULL,

	CONSTRAINT pk_project
	PRIMARY KEY (Number),

	CONSTRAINT fk_project_departament
	FOREIGN KEY (NumberDepartament)
	REFERENCES departament (Number)

);
GO


-- CREAR TABLA WORKS_ON

CREATE TABLE works_on(
	Ssn CHAR(9) NOT NULL,
	NameProject VARCHAR(60) NOT NULL,
	NumberProject INT NOT NULL,
	Hours DECIMAL(5,2) NOT NULL,

	CONSTRAINT pk_works_on
	PRIMARY KEY (Ssn, NameProject, NumberProject),

	CONSTRAINT fk_works_on_employee
	FOREIGN KEY (Ssn)
	REFERENCES employee (Ssn),

	CONSTRAINT fk_works_on_project
	FOREIGN KEY (NumberProject)
	REFERENCES project (Number)

);
GO


-- CREAR TABLA LOCATIONS

CREATE TABLE locations(
	NumLocation INT NOT NULL IDENTITY(1,1),
	NameDepartament VARCHAR(60) NOT NULL,
	NumberDepartament INT NOT NULL,
	Location VARCHAR(80) NOT NULL,

	CONSTRAINT pk_locations
	PRIMARY KEY (NumLocation),

	CONSTRAINT fk_locations_departament
	FOREIGN KEY (NumberDepartament)
	REFERENCES departament (Number)

);
GO


-- CREAR TABLA DEPENDENT

CREATE TABLE dependent(
	Name VARCHAR(60) NOT NULL,
	Sex CHAR(1) NOT NULL,
	Birthday DATE NOT NULL,
	Relationship VARCHAR(30) NOT NULL,
	Ssn CHAR(9) NOT NULL,

	CONSTRAINT pk_dependent
	PRIMARY KEY (Name),

	CONSTRAINT fk_dependent_employee
	FOREIGN KEY (Ssn)
	REFERENCES employee (Ssn)

);
GO


-- CREAR LA FOREIGN KEY DE EMPLOYEE CON DEPARTAMENT

ALTER TABLE employee
ADD NumberDepartament INT NOT NULL;
GO

ALTER TABLE employee
ADD CONSTRAINT fk_employee_departament
FOREIGN KEY (NumberDepartament)
REFERENCES departament (Number);
GO