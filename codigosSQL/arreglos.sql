ALTER TABLE cuenta ADD COLUMN tipo_cuenta INTEGER NOT NULL;

--Corregir el campo employee_hire_date de la tabla empleado con la fecha en formato YYYY-MM-DD
SELECT CONVERT(VARCHAR, GETDATE(), 111) AS [YYYY/MM/DD]
FROM employee_hire_date;