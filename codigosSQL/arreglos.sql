-- Ampliar el alcance de la entidad cuenta para que identifique el tipo de la misma
ALTER TABLE cuenta ADD COLUMN tipo_cuenta INTEGER NOT NULL;

-- Corregir el campo employee_hire_date de la tabla empleado con la fecha en formato YYYY-MM-DD
UPDATE empleado SET employee_hire_date = substr(employee_hire_date, 7, 4) || '-' || substr(employee_hire_date, 4,2) || '-' || substr(employee_hire_date, 1,2)

-- Error de sucursal clientes nuevos
UPDATE cliente SET branch_id=10 
WHERE customer_id IN (
    SELECT TOP 5 customer_id FROM cliente
    ORDER BY customer_id DESC
    );

-- Eliminar a Noel David
DELETE cliente 
WHERE  customer_name='David' AND customer_surname='Noel';

<<<<<<< HEAD

-- Seleccionar las primeras 5 cuentas con saldo mayor a 8.000$

SELECT * from cuenta
WHERE balance >=8000 
ORDER by balance ASC
LIMIT 5

-- Obtener el importe total de los prestamos agrupados por tipo de préstamos. Por cada tipo de préstamo de la tabla préstamo, calcular la suma de susimportes. Renombrar la columna como loan_total_accu
SELECT loan_type, 
sum(loan_total) loan_total_accu

from prestamo
where loan_type in ("HIPOTECARIO","PERSONAL","PRENDARIO")
GROUP BY loan_type


-- Cheques otorgado por sucursal

SELECT cliente.branch_id sucursal,
count(cliente.branch_id) creditos_otorgados

FROM prestamo, cliente
where prestamo.customer_id = cliente.customer_id  


GROUP by branch_id
=======
>>>>>>> 4ad1d4ff556df23e7b7d2431fef0a65a4c252c63
