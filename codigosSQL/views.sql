-- Vista con las columnas id, numero sucursal, nombre, apellido, DNI y edad
CREATE VIEW IF NOT EXISTS clientes_edad AS
SELECT 
	customer_id,
	branch_id,
	customer_name,
	customer_surname,
	customer_DNI,
	CURRENT_DATE - strftime( dob) AS edad	
FROM cliente

-- Mostrar las columnas de los clientes, ordenadas por el DNI de menor a mayor y cuya edad sea superior a 40 años
CREATE VIEW IF NOT EXISTS clientes_mayores40 AS
SELECT 
	customer_id,
	branch_id,
	customer_name,
	customer_surname,
	customer_DNI
FROM cliente
WHERE CURRENT_DATE - strftime(dob)>= 40
ORDER BY CAST(customer_DNI as INT)

-- Mostrar todos los clientes que se llaman “Anne” o “Tyler” ordenados por edad de menor a mayor 
CREATE VIEW IF NOT EXISTS Anne_y_Tyler AS	
SELECT 
	customer_id,
	branch_id,
	customer_name,
	customer_surname,
	customer_DNI,
	CURRENT_DATE - strftime( dob) as edad
FROM cliente
WHERE customer_name = "Tyler" or customer_name = "Anne"
ORDER BY (CURRENT_DATE - strftime(dob))
