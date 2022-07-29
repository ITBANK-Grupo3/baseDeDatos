--tipo clientes
CREATE TABLE tipo_cliente(
	tipo_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	nombre_tipo TEXT VARCHAR(30) NOT NULL
);

INSERT INTO tipo_cliente(nombre_tipo)
VALUES
	("Classic"),
	("Gold"),
	("Black");

--tipo cuenta
CREATE TABLE tipo_cuenta(
	tipo_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	nombre_tipo TEXT VARCHAR(30) NOT NULL
);

INSERT INTO tipo_cuenta(nombre_tipo)
VALUES
	("Caja de ahorro en pesos"),
	("Caja de ahorro en dólares"),
	("Cuenta Corriente");
	
--marca tarjeta
CREATE TABLE marca_tarjeta(
	marca_tarjeta_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	marca_tarjeta_nombre TEXT VARCHAR(30) NOT NULL
);

INSERT INTO marca_tarjeta(marca_tarjeta_nombre)
VALUES
	("Visa"),
	("MasterCard"),
	("American Express");

--creacion tarjeta
CREATE TABLE tarjeta(
	tarjeta_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	numero_tarjeta INT VARCHAR(20) UNIQUE NOT NULL,
	cvv INT VARCHAR(4) NOT NULL,
	fecha_creacion DATE NOT NULL,
	fecha_vencimiento DATE NOT NULL,
	tipo_tarjeta TEXT VARCHAR(10) NOT NULL, 
	marca_tarjeta_id INT NOT NULL,
	cliente_id INT NOT NULL,
	FOREIGN KEY(marca_tarjeta_id)
		REFERENCES marca_tarjeta(marca_tarjeta_id),
	FOREIGN KEY(cliente_id)
		REFERENCES cliente(customer_id)
);