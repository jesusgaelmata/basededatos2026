# Diccionario de Datos Ejercicio 3

## 1. Información General

| Elemento | Valor                   |
| :------- | :---------------------- |
| Proyecto | Escuela                 |
| Versión  | 1.0                     |
| Fecha    | Junio 2026              |
| Elaboró  | Jesús Gael Mata Jiménez |
| SGBD     | SQL Server              |

---

## 2. Descripción de la Base de Datos

Esta base de datos administra la información de:

* Alumno
* Materia
* Inscribe

Permite registrar los alumnos, las materias disponibles y las inscripciones realizadas por cada alumno, almacenando la fecha de inscripción y la calificación obtenida.

---

## 3. Catálogo de Restricciones

| Catálogo | Significado               |
| :------- | :------------------------ |
| PK       | Primary Key               |
| FK       | Foreign Key               |
| NN       | Not Null                  |
| UQ       | Unique                    |
| AI       | Auto Increment o Identity |
| CK       | Check                     |
| DF       | Default                   |

---

## 4. Diccionario de Datos

### **Tabla:** *Alumno*

**Descripción**

Almacena la información de los alumnos inscritos en la institución.

| Campo     | Tipo    | Longitud | Restricciones | Descripción                         |
| :-------- | :------ | :------- | :------------ | :---------------------------------- |
| NumAlumno | INT     | -        | PK, NN        | Identificador único del alumno.     |
| Matricula | VARCHAR | 15       | UQ, NN        | Matrícula institucional del alumno. |
| Nombre    | VARCHAR | 50       | NN            | Nombre del alumno.                  |
| Ap1       | VARCHAR | 50       | NN            | Primer apellido del alumno.         |
| Ap2       | VARCHAR | 50       | NULL          | Segundo apellido del alumno.        |
| Semestre  | INT     | -        | NN            | Semestre que cursa el alumno.       |

---

### **Tabla:** *Materia*

**Descripción**

Almacena la información de las materias disponibles.

| Campo        | Tipo    | Longitud | Restricciones | Descripción                       |
| :----------- | :------ | :------- | :------------ | :-------------------------------- |
| ClaveMateria | VARCHAR | 10       | PK, NN        | Clave única de la materia.        |
| Nombre       | VARCHAR | 100      | UQ, NN        | Nombre de la materia.             |
| Creditos     | INT     | -        | NN            | Número de créditos de la materia. |

---

### **Tabla:** *Inscribe*

**Descripción**

Registra las materias en las que se inscribe cada alumno.

| Campo            | Tipo    | Longitud | Restricciones | Descripción                                |
| :--------------- | :------ | :------- | :------------ | :----------------------------------------- |
| NumAlumno        | INT     | -        | PK, FK, NN    | Alumno inscrito.                           |
| ClaveMateria     | VARCHAR | 10       | PK, FK, NN    | Materia inscrita.                          |
| FechaInscripcion | DATE    | -        | NN            | Fecha en que se realizó la inscripción.    |
| Calificaciones   | DECIMAL | 4,2      | NN            | Calificación final obtenida por el alumno. |

---

## 5. Relaciones en la Base de Datos

| Relación           | Cardinalidad | Descripción                                                                   |
| :----------------- | :----------- | :---------------------------------------------------------------------------- |
| Alumno → Inscribe  | 1:N          | Un alumno puede tener varias inscripciones.                                   |
| Materia → Inscribe | 1:N          | Una materia puede estar asociada a muchos alumnos mediante las inscripciones. |

---

## 6. Matriz de Claves Foráneas

| Tabla    | Campo FK     | Referencias           |
| :------- | :----------- | :-------------------- |
| Inscribe | NumAlumno    | Alumno(NumAlumno)     |
| Inscribe | ClaveMateria | Materia(ClaveMateria) |

---

## 7. Integridad Referencial

| Clave | Regla                                                                      |
| :---- | :------------------------------------------------------------------------- |
| IR-01 | No se puede registrar una inscripción para un alumno inexistente.          |
| IR-02 | No se puede registrar una inscripción para una materia inexistente.        |
| IR-03 | Cada inscripción debe estar asociada a un alumno y una materia existentes. |

---

## 8. Reglas del Negocio

| Clave | Regla                                                                            |
| :---- | :------------------------------------------------------------------------------- |
| RN-01 | Un alumno puede inscribirse en varias materias.                                  |
| RN-02 | Una materia puede tener varios alumnos inscritos.                                |
| RN-03 | Puede existir una materia sin alumnos inscritos.                                 |
| RN-04 | Todo alumno debe estar inscrito en al menos una materia.                         |
| RN-05 | De cada inscripción se almacena la fecha de inscripción y la calificación final. |

---

## 9. Diagrama Relacional
### Modelo E-R
![Ejercicio3](../ER/ER3.png)


### Modelo Relacional
![Ejercicio3](../MR/E3.png)

--
