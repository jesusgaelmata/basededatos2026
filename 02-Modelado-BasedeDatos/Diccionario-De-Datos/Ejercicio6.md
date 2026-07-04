# Diccionario de Datos Ejercicio 6

---

# 1. Información General

| Campo | Información |
| :----- | :---------- |
| Proyecto | Sistema de Gestión Académica Universitaria |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Jesús Gael Mata Jimpenez |
| SGBD | SQL Server |

---

# 2. Descripción de la Base de Datos

La base de datos administra la información correspondiente a un sistema de gestión académica universitaria, permitiendo almacenar la información de alumnos, profesores, materias, departamentos, credenciales, proyectos y dependientes.

El sistema registra la inscripción de alumnos en las materias, la asignación de profesores a las materias, la participación de profesores en proyectos institucionales, así como la administración de los departamentos a los que pertenecen y los dependientes asociados a cada profesor.

Las tablas principales que conforman la base de datos son:

- Alumno
- Credencial
- Materia
- Profesor
- Departamento
- Proyecto
- Dependiente
- Cursa
- Participa
- Imparte

El objetivo principal de la base de datos es mantener organizada la información académica y administrativa de la institución, garantizando la integridad de los datos y facilitando su consulta mediante relaciones entre las diferentes entidades.

---

# 3. Catálogo de Restricciones

| Catálogo | Significado |
| :-------- | :---------- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment o Identity |
| CK | Check |
| DF | Default |

---

# 4. Diccionario de Datos

## Tabla: Alumno

### Descripción

Almacena la información general de los alumnos registrados en la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| Matricula | INT | 4 | PK, NN | Identificador único del alumno |
| Nombre | VARCHAR | 50 | NN | Nombre del alumno |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NN | Segundo apellido |
| Correo | VARCHAR | 100 | NN, UQ | Correo electrónico institucional |
| Tel | VARCHAR | 15 | NN | Número telefónico del alumno |

---

## Tabla: Credencial

### Descripción

Almacena la información de la credencial asignada a cada alumno.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| NumCredencial | INT | 4 | PK, NN | Número único de la credencial |
| FechaInscripcion | DATE | - | NN | Fecha de expedición de la credencial |
| Vigencia | DATE | - | NN | Fecha de vencimiento de la credencial |
| Matricula | INT | 4 | FK, NN, UQ | Alumno propietario de la credencial |

---

## Tabla: Materia

### Descripción

Almacena la información de las materias impartidas en la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| ClaveMateria | VARCHAR | 10 | PK, NN | Clave única de la materia |
| NombreMat | VARCHAR | 100 | NN | Nombre de la materia |
| Creditos | INT | 2 | NN | Número de créditos asignados |

---

## Tabla: Profesor

### Descripción

Almacena la información general de los profesores de la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| NumProf | INT | 4 | PK, NN | Identificador único del profesor |
| Nombre | VARCHAR | 50 | NN | Nombre del profesor |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NN | Segundo apellido |
| NumDepto | INT | 4 | FK, NN | Departamento al que pertenece |

---

## Tabla: Departamento

### Descripción

Almacena la información de los departamentos académicos de la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| NumDepto | INT | 4 | PK, NN | Identificador del departamento |
| Nombre | VARCHAR | 60 | NN | Nombre del departamento |
| Edificio | VARCHAR | 40 | NN | Edificio donde se ubica el departamento |

---

## Tabla: Proyecto

### Descripción

Almacena la información de los proyectos institucionales en los que participan los profesores.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| NumProyecto | INT | 4 | PK, NN | Identificador único del proyecto |
| NombreProyecto | VARCHAR | 100 | NN | Nombre del proyecto |
| Presupuesto | DECIMAL | 12,2 | NN | Presupuesto asignado al proyecto |

---

## Tabla: Dependiente

### Descripción

Almacena la información de los dependientes registrados para cada profesor.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| IdDependiente | INT | 4 | PK, NN | Identificador único del dependiente |
| Nombre | VARCHAR | 100 | NN | Nombre completo del dependiente |
| FechaNaci | DATE | - | NN | Fecha de nacimiento del dependiente |
| Parentesco | VARCHAR | 30 | NN | Parentesco con el profesor |
| NumProf | INT | 4 | FK, NN | Profesor al que pertenece el dependiente |

---

## Tabla: Cursa

### Descripción

Relaciona a los alumnos con las materias que cursan y almacena información de su inscripción y calificación final.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| Matricula | INT | 4 | PK, FK, NN | Alumno inscrito |
| ClaveMateria | VARCHAR | 10 | PK, FK, NN | Materia cursada |
| FechaInscripcion | DATE | - | NN | Fecha en la que el alumno se inscribió |
| CaliFinal | DECIMAL | 4,2 | CK | Calificación final obtenida por el alumno |

---

## Tabla: Imparte

### Descripción

Relaciona a los profesores con las materias que imparten.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| ClaveMateria | VARCHAR | 10 | PK, FK, NN | Materia impartida |
| NumProf | INT | 4 | PK, FK, NN | Profesor que imparte la materia |

---

## Tabla: Participa

### Descripción

Relaciona a los profesores con los proyectos institucionales en los que participan.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| NumProf | INT | 4 | PK, FK, NN | Profesor participante |
| NumProyecto | INT | 4 | PK, FK, NN | Proyecto en el que participa |
| FechaInicio | DATE | - | NN | Fecha de inicio de participación en el proyecto |

---

# 5. Relaciones en la Base de Datos

| Relación | Cardinalidad | Descripción |
| :-------- | :----------- | :---------- |
| Alumno → Credencial | 1 : 1 | Cada alumno posee una única credencial y cada credencial pertenece a un solo alumno. |
| Alumno → Cursa | 1 : N | Un alumno puede cursar varias materias. |
| Materia → Cursa | 1 : N | Una materia puede ser cursada por varios alumnos. |
| Profesor → Imparte | 1 : N | Un profesor puede impartir varias materias. |
| Materia → Imparte | 1 : N | Una materia es impartida por un profesor. |
| Departamento → Profesor | 1 : N | Un departamento puede tener varios profesores asignados. |
| Profesor → Dependiente | 1 : N | Un profesor puede registrar varios dependientes. |
| Profesor → Participa | 1 : N | Un profesor puede participar en varios proyectos. |
| Proyecto → Participa | 1 : N | Un proyecto puede tener varios profesores participantes. |

---

# 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencias |
| :---- | :------- | :---------- |
| Credencial | Matricula | Alumno(Matricula) |
| Profesor | NumDepto | Departamento(NumDepto) |
| Dependiente | NumProf | Profesor(NumProf) |
| Cursa | Matricula | Alumno(Matricula) |
| Cursa | ClaveMateria | Materia(ClaveMateria) |
| Imparte | NumProf | Profesor(NumProf) |
| Imparte | ClaveMateria | Materia(ClaveMateria) |
| Participa | NumProf | Profesor(NumProf) |
| Participa | NumProyecto | Proyecto(NumProyecto) |

---

# 7. Integridad Referencial

| Clave | Regla |
| :---- | :---- |
| Credencial.Matricula | Debe existir previamente un alumno registrado. |
| Profesor.NumDepto | Debe existir previamente un departamento registrado. |
| Dependiente.NumProf | Debe existir previamente un profesor registrado. |
| Cursa.Matricula | Debe existir previamente un alumno registrado. |
| Cursa.ClaveMateria | Debe existir previamente una materia registrada. |
| Imparte.NumProf | Debe existir previamente un profesor registrado. |
| Imparte.ClaveMateria | Debe existir previamente una materia registrada. |
| Participa.NumProf | Debe existir previamente un profesor registrado. |
| Participa.NumProyecto | Debe existir previamente un proyecto registrado. |

---

# 8. Reglas del Negocio

| Clave | Regla |
| :---- | :---- |
| RN-01 | Cada alumno debe estar identificado mediante una matrícula única. |
| RN-02 | Cada alumno puede poseer únicamente una credencial. |
| RN-03 | Una credencial pertenece únicamente a un alumno. |
| RN-04 | Un alumno puede inscribirse en una o varias materias. |
| RN-05 | Una materia puede ser cursada por varios alumnos. |
| RN-06 | Cada profesor pertenece a un único departamento. |
| RN-07 | Un departamento puede tener varios profesores. |
| RN-08 | Un profesor puede impartir una o varias materias. |
| RN-09 | Una materia debe ser impartida por un profesor. |
| RN-10 | Un profesor puede participar en uno o varios proyectos. |
| RN-11 | Un proyecto puede tener varios profesores participantes. |
| RN-12 | Un profesor puede registrar cero o varios dependientes. |
| RN-13 | La fecha de inscripción de una credencial debe ser válida. |
| RN-14 | La vigencia de la credencial debe ser posterior a la fecha de inscripción. |
| RN-15 | La calificación final registrada en una materia debe estar dentro de la escala permitida por la institución. |

---

# 9. Diagrama Relacional
### Modelo E-R
![Ejercicio6](../ER/ER6.png)


### Modelo Relacional
![Ejercicio6](../MR/E6.png)

# Fin del Documento
