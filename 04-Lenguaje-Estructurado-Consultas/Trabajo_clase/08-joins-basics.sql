/*================================================

INNER JOIN

¿Qué es un JOIN?

Un JOIN es una operación que permite combinar filas de dos o más tablas en una base de datos, basándose en una condición 
relacionada entre ellas. El INNER JOIN devuelve solo las filas que tienen coincidencias en ambas tablas.

=================================================*/

use Northwnd;

select
ProductID as [numero producto],
ProductName [nombre],
UnitPrice as[precio],
UnitsInStock as [existencia],
(p.UnitPrice * p.UnitsInStock) as [valor_inventario],
c.CategoryID as [numero_cateforia],
CategoryName as [nombre_categoria],
s.CompanyName
from Products as p
inner join 
Categories as c
on c.CategoryID=p.CategoryID
inner join Suppliers as s
on s.SupplierID=p.SupplierID
where p.UnitsInStock <>0
and 
c.CategoryName in ('Seafood','Confections', 'Beverages')
and 
p.ProductName like 'C%'
order by [valor_inventario] asc;

-- Seleccionar los datos de los clientes que han hecho pedidos (orders),
-- mostrando el numero de cliente, el nombre del cliente (companyName),
-- numero de orden y la fecha de orden

SELECT
	o.OrderID AS [numero_orden],
	o.OrderDAte AS [fecha_orden],
	UPPER(FORMAT(o.OrderDate, 'MMMM', 'es-ES')) AS [mes_orden],
	UPPER(FORMAT(o.OrderDate, 'dddd', 'es-ES')) AS [dia_orden],
	DATEPART(YEAR, o.OrderDate ) AS [año_orden],
	o.CustomerID AS [numero_cliente],
	UPPER(c.CompanyName) AS [nombre_cliente]
FROM Orders AS o
INNER JOIN
Customers AS c
ON c.CustomerID = o.customerID;

-- Seleccionar ademas del cliente al que se le vendieron los productos,
-- queremos saber el nombre del empleado en formato fullnam que atendio
-- el pedido

SELECT
	o.OrderID AS [numero_orden],
	o.OrderDAte AS [fecha_orden],
	UPPER(FORMAT(o.OrderDate, 'MMMM', 'es-ES')) AS [mes_orden],
	UPPER(FORMAT(o.OrderDate, 'dddd', 'es-ES')) AS [dia_orden],
	DATEPART(YEAR, o.OrderDate ) AS [año_orden],
	o.CustomerID AS [numero_cliente],
	UPPER(c.CompanyName) AS [nombre_cliente],
	CONCAT (e.FirstName, ' ', e.LastName) AS [nombre_completo]
FROM Orders AS o
INNER JOIN
Customers AS c
ON c.CustomerID = o.customerID
INNER JOIN Employees AS e
ON o.EmployeeID = e.EmployeeID;