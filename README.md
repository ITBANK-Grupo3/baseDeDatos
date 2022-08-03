# Consigna final Sprint 6 - Manejo de datos con SQL
## Organizacion 
- Para crear las tablas que pide la consigna se debe ejecutar tablas.sql
- Para crear las views, ejecutar views.sql
- Lo relacionado a modificación de datos en la base de datos (actualizaciones y eliminaciones) se encuentran en arreglos.sql
- Las consultas espeíficas que pide realizar la consigna se pueden encontrar en consultas.sql. Cada búsqueda se encuentra especificada en los comentarios del código.

## Cosas a tener en cuenta
- Antes que nada se debe abrir la base de datos itbank.db
- Para la creación de las tarjetas aleatorias y su agregado a la tabla tarjeta se debe ejecutar agregadoTarjetas.sql
- Para asignar un tipo de cuenta a cada registro de cuenta de forma aleatoria se debe ejecutar tipocuenta_aleatorio.sql
- Para crear la tabla de direcciones se debe ejecutar direcciones.sql y luego direcciones.py para insertarle las mismas. Para ejecutar direcciones.py se precisa tener instalado ????? (faker)
- Para leer el archivo JSON dado y agregar los nuevos clientes a la tabla cliente, ejecutar cargaDatosJSON.py 
<hr>
Falta: 

- Mediante índices mejorar la performance la búsqueda de clientes por DNI
- Crear la tabla “movimientos” con los campos de identificación del movimiento, número de cuenta, monto, tipo de operación y hora
  - Mediante el uso de transacciones, hacer una transferencia de 1000$ desde la cuenta 200 a la cuenta 400
  - Registrar el movimiento en la tabla movimientos
  - En caso de no poder realizar la operación de forma completa, realizar un ROLLBACK
