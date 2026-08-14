/*==================================

Tema: Filtrado de Registros con WHERE 

Archivo: 06-filtrado-where.sql

Descripcion: En este tema se filtraran registros mediante, condiciones,
comparaciones, operadores logicos y busqueda por patrones 


===================================*/

-- Seleccionar columnas y filtrar filas

-- Mostrar el producto cuyo precio es exactamente $400

SELECT 
    codigo,
    nombre,
    precio
FROM productos
WHERE precio > 400;

-- Mostrar el producto cuyo precio es exactamente $200

SELECT
    p.codigo AS [codigo],
    p.nombre,
    p.precio
FROM productos AS p
WHERE precio = 200 ;

SELECT 
    c.id_cliente,
    c.nombre,
    c.apellido_paterno,
    c.correo
FROM clientes AS c 
WHERE c.id_cliente = 25;


-- Comparacion de cadenas de texto

-- Los valores de texto deben escribirse entre comillas 
-- simples 

-- Seleccionar todas las categorias, donde el 
-- nombre sea computo

SELECT
    c.id_categoria,
    c.nombre
FROM categorias AS c 
WHERE c.nombre = 'C�mputo';

-- Mostrar los datos de los empleados que no pertenezcan 
-- al departamento 1 (numero de empleado, nombre, salario y
-- numero del departamento)

SELECT 
    e.id_empleado,
    e.nombre,
    e.salario,
    e.id_departamento
FROM empleados AS e
WHERE e.id_departamento > 1;

-- Seleccionar los productos cuyos precio sea superior a 450
-- codigo, nombre, precio, existencia, utilizar aliass de columnas
-- y de tabla

SELECT 
    p.codigo AS codigo,
    p.nombre AS Nombre_producto,
    p.precio,
    p.existencia
FROM productos AS p
WHERE p.precio > 450;


SELECT 
    p.codigo AS codigo,
    p.nombre AS Nombre_producto,
    p.precio,
    p.existencia
FROM productos AS p
WHERE p.precio < 450;

SELECT 
    p.codigo AS codigo,
    p.nombre AS Nombre_producto,
    p.precio,
    p.existencia
FROM productos AS p
WHERE p.precio <= 450;

SELECT 
    p.codigo AS codigo,
    p.nombre AS Nombre_producto,
    p.precio,
    p.existencia
FROM productos AS p
WHERE p.precio <> 450;

-- FILTRAR FECHAS
-- Las fechas deben escribirse entre comillas simples

-- se recomienda utilizar el formarto AAAA-MM-DD

-- Seleccionar todas las ventas realizadas el 24 de Diciembre de 2024,
-- mostrar numero de venta, fecha de venta, cliente al que se vendio, 
-- y el empleado al que lo vendio 

SELECT 
    v.id_venta AS [Numero de Venta],
    v.fecha AS [Fecha Venta],
    v.id_cliente AS [Cliente],
    v.id_empleado AS [Empleado]
FROM ventas AS v
WHERE fecha = '2025-12-24';

SELECT 
    v.id_venta AS [Numero de Venta],
    v.fecha AS [Fecha Venta],
    v.id_cliente AS [Cliente],
    v.id_empleado AS [Empleado]
FROM ventas AS v
INNER JOIN 
clientes AS c
ON v.id_cliente = c.id_cliente
INNER JOIN 
empleados AS e
ON v.id_empleado = e.id_empleado
WHERE fecha = '2025-12-24';
GO

-- Seleccionar todas las ventas anteriores al 1 de febrero de 2025

SELECT 
    v.id_venta AS numero_venta,
    v.fecha AS [fecha de venta],
    v.id_cliente cliente
FROM ventas AS v
WHERE v.fecha < '2025-02-01';
GO

-- Selecccionar todas las ventas desde el 1 de octubre de 2025
-- en adelante

SELECT 
    v.id_venta AS numero_venta,
    v.fecha AS [fecha de venta],
    v.id_cliente cliente
FROM ventas AS v
WHERE v.fecha >= '2025-10-01';
GO

-- COMPARACIONES CON EXPRESIONES CALCULADAS

-- Seleccionar los productos cuyo valor del inventario sea mayor
-- a $5000

-- Valor inventario = precio * existencia

-- Nota: SQL Server no reconoce el valor de alias dentro del 
-- WHERE en el mismo nivel de consulta, esto ocurre por el orden 
-- logico en que SQL Server procesa las partes de una consulta

-- Orden de ejecucion
/*==========================
    FROM/JOIN
    WHERE
    GROUP BY
    HAVING 
    SELECT 
    DISTINCT
    ORDEN BY 
    TOP 
=============================*/

-- Orden de escritura
/*==========================
    SELECT / TOP
    FROM / JOIN 
    WHERE
    GROUP BY
    HAVING 
    ORDEN BY 
=============================*/


SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia,
    (precio * existencia) AS valor_inventario
FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY valor_inventario DESC;
GO

SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia,
    (precio * existencia) AS valor_inventario
FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY (precio * existencia) DESC;
GO

SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia,
    (precio * existencia) AS valor_inventario
FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY 5 ASC;
GO

/*Consultas con Operadores Logicos (NOT, AND, OR)*/

-- Operador logico AND

/* 
    condicion 1 | condicion 2 | Resultado
    TRUE            TRUE          TRUE
    TRUE            FALSE         FALSE 
    FALSE           TRUE          FALSE
    FALSE           FALSE         FALSE
*/

-- mOSTRA PRODUCTOS CON PRECIO ENTRE $200 y $300 que ademas
-- Tengan menos de unidades 

SELECT 
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia
FROM productos AS p
WHERE precio >= 200.0 
    AND p.precio<=300.0
    AND p.existencia < 50;

SELECT 
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia
FROM productos AS p
WHERE precio >= 200.0 
    AND p.precio<=300.0
    AND p.existencia < 50;

-- Seleccionar los empleados del departamento 1 cuyo salario sea
-- superior a $25.0

SELECT -- yo
    e.id_empleado AS empleado,
    e.salario AS salario,
    e.id_departamento AS departamento
FROM empleados AS e
WHERE e.id_departamento = 1 AND e.salario > 25.0;

SELECT -- Profe
    e.id_empleado AS empleado,
    CONCAT(e.nombre, ' ', 
    e.apellido_paterno, ' ',
    e.apellido_materno) AS [nombre_completo],
    e.salario AS salario,
    e.id_departamento AS departamento
FROM empleados AS e
WHERE e.id_departamento = 1 
    AND e.salario > 25.0;

-- Operador logico OR

/*=======================================================
    OR requiere que menos una condición sea (BINARIO)
 =========================================================*/

    
/* 
    condicion 1 | condicion 2 | Resultado
    TRUE            TRUE          TRUE
    TRUE            FALSE         TRUE 
    FALSE           TRUE          TRUE
    FALSE           FALSE         FALSE
*/


-- Seleccionar los productos con existencia inferior a 10 o superior
-- a 190

SELECT  
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia
FROM productos AS p 
WHERE p.existencia < 10
    OR p.precio > 190
ORDER BY nombre DESC;


-- Operador logico OR

/*=======================================================
    NOT niega una condición (UNARIO)
 =========================================================*/
 
/* 
    condicion 1 | Resultado
    TRUE            FALSE
    FALSE           TRUE
*/

--  Seleccionar los productos que no sea mayor a 400

SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia
FROM productos AS p
WHERE NOT p.precio > 400;

SELECT
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia
FROM productos AS p
WHERE p.precio <= 400;

-- Mostrar los productos que no se encuentran dentro del 
-- rango de $100 a $400

SELECT 
    p.id_producto,
    p.codigo,
    p.nombre,
    p.precio
FROM productos AS p
WHERE NOT p.precio >= 100 
AND p.precio <= 400;


-- TODO: Instruccion BETWEEN E IN, LIKE COMPARACIONES CON NULL

-- OPERADOR BETWEEN
-- Permite comprobar si un valor se encuenntra dentro de un rango inclusivo

-- Sintaxis 
-- WHERE columna BETWEEN limite_inferior AND limite_superior

-- Mostrar empleados con salario entre $15000 y $20000

SELECT 
    e.id_empleado AS empleado,
    e.nombre,
    e.salario
FROM empleados AS e
WHERE e.salario BETWEEN 15000 AND 20000;

SELECT 
    e.id_empleado AS empleado,
    e.nombre,
    e.salario
FROM empleados AS e
WHERE e.salario>=15000
AND e.salario <=20000;

-- Seleccionar las ventas del primero de enero del 2025 al 
-- 10 de enero de 2025

SELECT 
    v.id_venta,
    v.fecha,
    FORMAT(v.fecha, 'MM') AS [Nombre Mes],
    FORMAT(v.fecha, 'MMMM') AS [Nombre Mes en Ingles],
    FORMAT(v.fecha, 'dd') AS [Dia en digito],
    FORMAT(v.fecha, 'dddd') AS [Nombre del Dia en Ingles],
    UPPER(FORMAT(v.fecha, 'MMMM', 'es-ES'))AS [Nombre del Mes Español],
    UPPER(FORMAT(v.fecha, 'dddd', 'es-ES'))AS [Nombre del Dia Español],
    DATEPART(MONTH, v.fecha) AS [Mes del año],
    v.id_cliente
FROM ventas AS v
WHERE v.fecha BETWEEN '2025,01,01' AND '2025-01-10';

-- sELECCIONAR LOS PRODUCTOS QUE NO SE ENCUENTREN EN EL RANGO DE PRECIOS
-- de $100 a $400

SELECT 
    p.id_producto,
    p.nombre,
    p.precio
FROM productos AS p
WHERE precio NOT BETWEEN 100 AND 400;

-- OPERADOR IN
-- Permite comparar una columna con una lista de valores
-- Sintaxis: WHERE columna IN (valor_1,valor_2,valor_n);
-- Equivalee a varias condiciones OR conectadas

-- Mostrar los productos pertenecientes a las categorias 1,7,12

SELECT 
   p.id_producto,
   p.nombre,
   p.precio,
   p.id_categoria
FROM productos AS p
WHERE p.id_categoria IN (1,7,12)
ORDER BY id_categoria;

SELECT 
   p.id_producto,
   p.nombre,
   p.precio,
   p.id_categoria
FROM productos AS p
WHERE p.id_categoria = 1
OR p.id_categoria = 7
OR p.id_categoria = 12;

-- Seleccionar los datos de los clientes 1, 10, 25, 50, 100

SELECT 
    c.id_cliente,
    c.nombre,
    c.correo
FROM clientes AS c
WHERE id_cliente IN (1, 10, 25 , 50, 100);

-- Seleccionar los datos de los departamentos de Ventas, TI o Direecion

SELECT
    d.id_departamento AS numero,
    d.nombre AS nombre_departamento
FROM departamentos AS d
WHERE .nombre IN ('Ventas', 'TI', 'Dirección');

-- Seleccionar todos los departamentos que no correspondan al departamento 1 o 2 
-- NOT IN 

SELECT
    d.id_departamento AS numero,
    d.nombre AS nombre_departamento
FROM departamentos AS d
WHERE d.id_departamento NOT IN (1,2);


SELECT
    d.id_departamento AS numero,
    d.nombre AS nombre_departamento
FROM departamentos AS d
WHERE NOT (d.id_departamento = 1
OR d.id_departamento = 2)

-- PRECAUCIÓN CON NOT IN Y NULL.
-- Cuando una columna contiene NULL, una comparación con NOT IN puede comportarse
-- de manera diferente a lo esperado

-- Seleccionar todos los empleados que no tengan jefe 
SELECT * FROM empleados;


SELECT 
    e.id_empleado,
    e.salario,
    e.nombre,
    e.id_jefe
FROM empleados AS e
WHERE e.id_jefe IS NULL;

SELECT 
    e.id_empleado,
    e.salario,
    e.nombre,
    e.id_jefe
FROM empleados AS e
WHERE e.id_jefe IS NOT NULL;


SELECT 
    e.id_empleado,
    e.salario,
    e.nombre,
    e.id_jefe
FROM empleados AS e
WHERE e.id_jefe NOT IN (1,2,3)
    OR e.id_jefe IS NULL;

SELECT 
    e.id_empleado,
    e.nombre,
    e.salario,
    e.id_jefe
FROM empleados AS e 
WHERE NOT(e.id_jefe IS  NULL 
OR e.id_jefe = 1);


-- Operador LIKE 
-- permite buscar patrones dentro de valores de texto

-- SINTAXIS 

-- WHERE columna LIKE 'patron'

-- los patrones son:

-- comodin          signidicado 
-- %                cero, uno o varios caracteres
--  _               Exactamente un caracter incluido en el rango
--  [abc]           un caracter incluido en la lista 
--  [a-f]           un caracter incluido en el rango 
--  [^abc]          un caracter no incluido en la lista

-- Seleccionar los datos de los productos donde eoll codigo comience con 
-- P001

SELECT 
*
FROM productos 
WHERE codigo LIKE 'P001%'

