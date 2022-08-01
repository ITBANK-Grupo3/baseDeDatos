-- Ampliar el alcance de la entidad cuenta para que identifique el tipo de la misma
ALTER TABLE cuenta ADD COLUMN tipo_cuenta INTEGER NOT NULL;

-- Corregir el campo employee_hire_date de la tabla empleado con la fecha en formato YYYY-MM-DD
SELECT CONVERT(VARCHAR, GETDATE(), 111) AS [YYYY/MM/DD]
FROM employee_hire_date;

-- Error de sucursal clientes nuevos
UPDATE cliente SET branch_id=10 
WHERE customer_id IN (
    SELECT TOP 5 customer_id FROM cliente
    ORDER BY customer_id DESC
    );

-- Eliminar a Noel David
DELETE cliente 
WHERE  customer_name='David' AND customer_surname='Noel';


