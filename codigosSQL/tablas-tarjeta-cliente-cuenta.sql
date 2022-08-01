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

CREATE TABLE IF NOT EXISTS auditoria_cuenta (
	old_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
	new_id INTEGER NOT NULL
	old_balance INTEGER NOT NULL
	new_balance INTEGER NOT NULL
	old_iban INTEGER NOT NULL
	new_iban INTEGER NOT NULL
	old_type TEXT VARCHAR(30) NOT NULL
	new_type TEXT VARCHAR(30) NOT NULL
	user_action TEXT VARCHAR(30) NOT NULL
	created_at TEXT NOT NULL
);

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
 
SELECT CONVERT(VARCHAR, GETDATE(), 111) AS [YYYY/MM/DD],
FROM empleado;

/* vista cliente-edad */

CREATE VIEW clientes_edad
as

SELECT 
	customer_id,
	branch_id,
	customer_name,
	customer_surname,
	customer_DNI,
	CURRENT_DATE - strftime( dob) as edad
	
FROM cliente

/* vista ANNE y TYLeR */

CREATE VIEW Anne_y_Tyler
AS	
SELECT 
	customer_id,
	branch_id,
	customer_name,
	customer_surname,
	customer_DNI,
	CURRENT_DATE - strftime( dob) as edad

FROM cliente
WHERE customer_name = "Tyler" or customer_name = "Anne"

ORDER BY (CURRENT_DATE - strftime( dob))

SELECT *
FROM cuenta
WHERE balance<0

SELECT *
FROM prestamo
WHERE loan_total>8000000 AND loan_type="PRENDARIO"

SELECT *
FROM prestamo 
WHERE loan_date LIKE '-04-' OR '-06-' OR '08' 
ORDER BY loan_total DESC