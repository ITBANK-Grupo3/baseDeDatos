CREATE TABLE IF NOT EXISTS correspondencia_direcciones(
	correspondencia_id INTEGER PRIMARY KEY AUTOINCREMENT,
	tipo TEXT NOT NULL);
INSERT INTO correspondencia_direcciones(tipo)
VALUES 
('cliente'),
('empleado'),
('sucursal');

-- Creacion tabla direcciones
CREATE TABLE IF NOT EXISTS direcciones(
	dire_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	correspondencia_id INTEGER NOT NULL,
	titular_id INTEGER NOT NULL,
	calle TEXT NOT NULL,
	numero INTEGER NOT NULL, 
	ciudad TEXT NOT NULL,
	provincia TEXT NOT NULL,
	pais TEXT NOT NULL,
	FOREIGN KEY (correspondencia_id) REFERENCES correspondencia_direcciones(tipo),
	FOREIGN KEY (titular_id) REFERENCES cliente(customer_id),
	FOREIGN KEY (titular_id) REFERENCES empleado(employee_id),
	FOREIGN KEY (titular_id) REFERENCES sucursal(branch_id)
	);



CREATE VIEW IF NOT EXISTS total_sucursales AS
SELECT count(DISTINCT branch_address_id) as 'total_suc' 
from sucursal;

CREATE VIEW IF NOT EXISTS id_sucursales as 
SELECT DISTINCT branch_address_id
FROM sucursal;

CREATE VIEW IF NOT EXISTS id_empleados AS
SELECT employee_id 
FROM empleado;

CREATE VIEW IF NOT EXISTS id_clientes AS
SELECT customer_id
FROM cliente;