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