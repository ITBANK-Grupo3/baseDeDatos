--tipo clientes
CREATE TABLE IF NOT EXISTS tipo_cliente(
	tipo_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	nombre_tipo TEXT VARCHAR(30) NOT NULL
);

INSERT INTO tipo_cliente(nombre_tipo)
VALUES 
	('Classic'),
	('Gold'),
	('Black');

--tipo cuenta
CREATE TABLE IF NOT EXISTS tipo_cuenta(
	tipo_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	nombre_tipo TEXT VARCHAR(30) NOT NULL
);

INSERT INTO tipo_cuenta(nombre_tipo)
VALUES
	('Caja de ahorro en pesos'),
	('Caja de ahorro en dólares'),
	('Cuenta corriente en pesos'),
	('Cuenta corriente en dolares'),
	('Cuenta inversion');

--marca tarjeta
CREATE TABLE IF NOT EXISTS marca_tarjeta(
	marca_tarjeta_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	marca_tarjeta_nombre TEXT VARCHAR(30) NOT NULL
);

INSERT INTO marca_tarjeta(marca_tarjeta_nombre)
VALUES
	('Visa'),
	('MasterCard'),
	('American Express');
	
--creacion tarjeta
CREATE TABLE IF NOT EXISTS tarjeta(
	tarjeta_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	numero_tarjeta VARCHAR(20) UNIQUE NOT NULL,
	cvv INT VARCHAR(4) NOT NULL,
	fecha_creacion TEXT NOT NULL,
	fecha_vencimiento TEXT NOT NULL,
	tipo_tarjeta TEXT VARCHAR(10) NOT NULL, 
	cliente_id INTEGER NOT NULL,
	marca_tarjeta_id INTEGER NOT NULL,
	FOREIGN KEY(cliente_id) REFERENCES cliente(customer_id),
	FOREIGN KEY(marca_tarjeta_id) REFERENCES marca_tarjeta(marca_tarjeta_id)
);


ALTER TABLE cuenta ADD COLUMN tipo_cuenta INTEGER NOT NULL;

--Corregir el campo employee_hire_date de la tabla empleado con la fecha en formato YYYY-MM-DD
SELECT CONVERT(VARCHAR, GETDATE(), 111) AS [YYYY/MM/DD]
FROM employee_hire_date;

/* vista cliente-edad */

CREATE VIEW clientes_edad AS
SELECT 
	customer_id,
	branch_id,
	customer_name,
	customer_surname,
	customer_DNI,
	CURRENT_DATE - strftime( dob) AS edad	
FROM cliente

--Mostrar las columnas de los clientes, ordenadas por el DNI de menor a mayor y cuya edad sea superior a 40 años
CREATE VIEW clientes_mayores40 AS
SELECT customer_name, customer_surname, customer_DNI 
FROM cliente
WHERE CURRENT_DATE - strftime(dob)>= 40
ORDER BY CAST(customer_DNI as INT)


