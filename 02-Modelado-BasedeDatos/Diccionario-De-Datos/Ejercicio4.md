# Diccionario de Datos Ejercicio 4

---

# 1. Información General

| Campo | Información |
| :----- | :---------- |
| Proyecto | Sistema de Gestión de Pedidos |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Jesús Gael Mata Jiménez|
| SGBD | SQL Server |

---

# 2. Descripción de la Base de Datos

La base de datos administra la información correspondiente al registro de clientes, pedidos realizados y los productos comercializados.

El sistema permite almacenar los pedidos efectuados por cada cliente y registrar el detalle de los productos vendidos en cada pedido, incluyendo el precio de venta y la cantidad vendida.

Las tablas principales que conforman la base de datos son:

- Cliente
- Pedido
- Producto
- DetallePedido

El objetivo principal de la base de datos es mantener la integridad de la información relacionada con las ventas, permitiendo consultar clientes, pedidos y productos de manera eficiente.

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

## Tabla: Cliente

### Descripción

Almacena la información general de los clientes registrados.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| NumCliente | INT | 4 | PK, NN, AI | Identificador del cliente |
| Nombre | VARCHAR | 50 | NN | Nombre del cliente |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NN | Segundo apellido |

---

## Tabla: Pedido

### Descripción

Almacena los pedidos realizados por los clientes.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| NumPedido | INT | 4 | PK, NN, AI | Identificador del pedido |
| FechaPedido | DATE | - | NN | Fecha del pedido |
| Cliente_fk | INT | 4 | FK, NN | Cliente que realizó el pedido |

---

## Tabla: Producto

### Descripción

Almacena la información de los productos disponibles para venta.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| NumProducto | INT | 4 | PK, NN, AI | Identificador del producto |
| Nombre | VARCHAR | 100 | NN, UQ | Nombre del producto |
| Precio | DECIMAL | 10,2 | NN | Precio del producto |

---

## Tabla: DetallePedido

### Descripción

Relaciona los pedidos con los productos vendidos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :---- | :--- | :------- | :------------ | :---------- |
| NumPedido_fk | INT | 4 | PK, FK, NN | Pedido asociado |
| NumProducto_fk | INT | 4 | PK, FK, NN | Producto vendido |
| PrecioVenta | DECIMAL | 10,2 | NN | Precio de venta del producto |
| CantidadVendida | INT | 4 | NN, CK | Cantidad vendida |

---

# 5. Relaciones en la Base de Datos

| Relación | Cardinalidad | Descripción |
| :-------- | :----------- | :---------- |
| Cliente → Pedido | 1 : N | Un cliente puede realizar varios pedidos |
| Pedido → DetallePedido | 1 : N | Un pedido puede contener varios productos |
| Producto → DetallePedido | 1 : N | Un producto puede aparecer en varios pedidos |

---

# 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencias |
| :---- | :------- | :---------- |
| Pedido | Cliente_fk | Cliente(NumCliente) |
| DetallePedido | NumPedido_fk | Pedido(NumPedido) |
| DetallePedido | NumProducto_fk | Producto(NumProducto) |

---

# 7. Integridad Referencial

| Clave | Regla |
| :---- | :---- |
| Pedido.Cliente_fk | Debe existir previamente un cliente registrado. |
| DetallePedido.NumPedido_fk | Debe existir previamente un pedido. |
| DetallePedido.NumProducto_fk | Debe existir previamente un producto. |

---

# 8. Reglas del Negocio

| Clave | Regla |
| :---- | :---- |
| RN-01 | Un cliente puede registrar uno o varios pedidos. |
| RN-02 | Cada pedido pertenece a un único cliente. |
| RN-03 | Un pedido debe contener al menos un producto. |
| RN-04 | Un producto puede venderse en diferentes pedidos. |
| RN-05 | La cantidad vendida debe ser mayor que cero. |
| RN-06 | El precio de venta debe ser mayor que cero. |
| RN-07 | El nombre del producto debe ser único. |

---

# 9. Diagrama Relacional
### Modelo E-R
![Ejercicio4](../ER/ER4.jpeg)


### Modelo Relacional
![Ejercicio4](../MR/E4.png)

--