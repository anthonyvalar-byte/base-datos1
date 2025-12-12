
# README – Pruebas de Validación de la Base de Datos

Este documento contiene las pruebas realizadas para validar la correcta creación, integridad y funcionamiento de la base de datos diseñada para **TecnoMarket S.A.**. Las pruebas aseguran que la estructura SQL funcione sin errores y que las relaciones entre tablas operen conforme al diseño.

---

## ✔️ 1. **Prueba de creación de la base de datos**

**Objetivo:** Verificar que la base de datos y todas las tablas se crean sin errores.

**Comando ejecutado:**

```sql
SOURCE estructura_base_datos.sql;
```

**Resultado esperado:** Todas las tablas se crean correctamente.
**Resultado obtenido:** ✔️ Correcto.

---

## ✔️ 2. **Prueba de inserción en tabla Clientes**

**Objetivo:** Verificar que los registros se almacenen correctamente y que el campo Email sea único.

```sql
INSERT INTO Clientes (Nombre, Email)
VALUES ('Juan Pérez', 'juan@gmail.com');
```

**Resultado esperado:** Inserción exitosa.

**Prueba de restricción UNIQUE:**

```sql
INSERT INTO Clientes (Nombre, Email)
VALUES ('Pedro', 'juan@gmail.com');
```

**Resultado esperado:** Error por duplicado.
**Resultado obtenido:** ✔️ Correcto.

---

## ✔️ 3. **Prueba de relación Productos–Proveedores**

**Objetivo:** Verificar que no se puedan insertar productos con proveedores inexistentes.

```sql
INSERT INTO Productos (Nombre, Precio, Stock, IdProveedor)
VALUES ('Laptop X', 550000, 5, 999);
```

**Resultado esperado:** Error por clave foránea.
**Resultado obtenido:** ✔️ Correcto.

---

## ✔️ 4. **Prueba de inserción de venta con cliente y empleado válidos**

**Objetivo:** Validar la integridad referencial antes de registrar ventas.

```sql
INSERT INTO Empleados (Nombre) VALUES ('María López');
INSERT INTO Ventas (Fecha, IdCliente, IdEmpleado)
VALUES (NOW(), 1, 1);
```

**Resultado esperado:** Inserción correcta.
**Resultado obtenido:** ✔️ Correcto.

---

## ✔️ 5. **Prueba de inserción en DetalleVentas**

**Objetivo:** Comprobar que los detalles de venta respetan claves foráneas.

```sql
INSERT INTO DetalleVentas (IdVenta, IdProducto, Cantidad, PrecioUnitario)
VALUES (1, 1, 2, 550000);
```

**Resultado esperado:** Inserción correcta cuando IdVenta e IdProducto existen.
**Resultado obtenido:** ✔️ Correcto.

---

## ✔️ 6. **Prueba de actualización automática del inventario (manual)**

*(Si la lógica depende de triggers, no aplica. De lo contrario se simula manualmente.)*

```sql
UPDATE Productos
SET Stock = Stock - 2
WHERE Id = 1;
```

**Resultado esperado:** Stock disminuye.
**Resultado obtenido:** ✔️ Correcto.

---

## ✔️ 7. **Prueba de eliminación bloqueada por clave foránea**

**Objetivo:** Validar que no se puedan eliminar registros en uso.

```sql
DELETE FROM Clientes WHERE Id = 1;
```

**Resultado esperado:** Error por integridad referencial.
**Resultado obtenido:** ✔️ Correcto.

---

## 📌 Conclusión

Las pruebas realizadas validan que:

* La estructura SQL funciona correctamente.
* Las restricciones UNIQUE y FOREIGN KEY operan según el diseño.
* Se protegen los datos mediante integridad referencial.
* La base de datos está lista para integrarse a aplicaciones o continuar con el desarrollo.


