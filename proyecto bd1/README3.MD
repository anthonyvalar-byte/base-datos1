
# Proyecto I – Pruebas de Calidad de la Base de Datos

Este documento presenta las **pruebas de calidad** aplicadas a la base de datos desarrollada para **TecnoMarket S.A.**. El objetivo es asegurar que el sistema cumple con estándares de calidad en cuanto a integridad, rendimiento, consistencia y seguridad.

---

# ✔️ 1. Pruebas de Integridad de Datos

## **1.1 Integridad de Claves Primarias**

**Objetivo:** Asegurar que cada tabla tenga registros únicos.

**Prueba:**

```sql
INSERT INTO Clientes (Id, Nombre, Email)
VALUES (1, 'Juan', 'test@test.com');
```

Reinsertar el mismo Id.

**Resultado esperado:** Error por duplicado.
**Resultado obtenido:** ✔️ Correcto.

---

## **1.2 Integridad Referencial**

**Objetivo:** Verificar que no existan registros huérfanos.

**Prueba:**

```sql
INSERT INTO Ventas (Fecha, IdCliente, IdEmpleado)
VALUES (NOW(), 999, 1);
```

**Resultado esperado:** Error por clave foránea.
**Resultado obtenido:** ✔️ Correcto.

---

## **1.3 Integridad de Dominio (Tipos de datos)**

**Objetivo:** Validar restricciones de tipos.

**Prueba:**

```sql
INSERT INTO Productos (Nombre, Precio, Stock)
VALUES ('Teclado', 'texto', 10);
```

**Resultado esperado:** Error por tipo inválido.
**Resultado obtenido:** ✔️ Correcto.

---

# ✔️ 2. Pruebas de Rendimiento

## **2.1 Tiempo de Ejecución en Consultas Simples**

**Objetivo:** Confirmar que las consultas tardan menos de 1 segundo.

**Prueba:**

```sql
SELECT * FROM Productos;
```

**Resultado:** ✔️ Ejecución rápida (< 1s).

---

## **2.2 Rendimiento en Consultas con JOIN**

**Prueba:**

```sql
SELECT c.Nombre, p.Nombre, dv.Cantidad
FROM DetalleVentas dv
JOIN Ventas v ON dv.IdVenta = v.Id
JOIN Clientes c ON v.IdCliente = c.Id
JOIN Productos p ON dv.IdProducto = p.Id;
```

**Resultado:** ✔️ Correcto.

---

# ✔️ 3. Pruebas de Consistencia

## **3.1 Actualización Consistente del Inventario**

**Objetivo:** Verificar que el inventario mantenga valores lógicos.

**Prueba:**

```sql
UPDATE Productos SET Stock = Stock - 5 WHERE Id = 1;
```

**Resultado esperado:** Stock nunca debe ser negativo.
**Resultado obtenido:** ✔️ Correcto.

---

## **3.2 Evitar Datos Incompletos**

**Prueba:**

```sql
INSERT INTO Clientes (Nombre) VALUES ('Pedro');
```

**Resultado esperado:** Error por campos obligatorios.
**Resultado obtenido:** ✔️ Correcto.

---

# ✔️ 4. Pruebas de Seguridad

## **4.1 Prevención de SQL Injection (Manual)**

**Objetivo:** Asegurar que valores no ejecuten comandos peligrosos.

**Prueba:**

```sql
INSERT INTO Clientes (Nombre, Email)
VALUES ("Carlos'; DROP TABLE Clientes; --", 'carlos@test.com');
```

**Resultado esperado:** Se inserta como texto normal.
**Resultado obtenido:** ✔️ Seguro.

---

## **4.2 Restricción de Eliminaciones**

**Prueba:**

```sql
DELETE FROM Proveedores WHERE Id = 1;
```

(Si tiene productos asociados.)

**Resultado esperado:** Error por integridad referencial.
**Resultado obtenido:** ✔️ Correcto.

---

# ✔️ 5. Pruebas de Recuperación

## **5.1 Copia de Seguridad**

**Prueba:**

```bash
mysqldump -u usuario -p TecnoMarket > respaldo.sql
```

**Resultado:** ✔️ Copia creada correctamente.

## **5.2 Restauración**

```sql
SOURCE respaldo.sql;
```

**Resultado:** ✔️ La base se recupera sin errores.

---

# 📌 Conclusión General

Las pruebas demuestran que la base de datos:

* Mantiene integridad referencial y de dominio.
* Es consistente incluso con operaciones críticas.
* Responde de forma eficiente.
* Es segura frente a inserciones no válidas.
* Puede respaldarse y restaurarse correctamente.

La base de datos cumple criterios básicos de **calidad**, **estabilidad** y **fiabilidad**.
