ALTER TABLE cuenta ADD COLUMN tipo_cuenta INTEGER NOT NULL;

--Corregir el campo employee_hire_date de la tabla empleado con la fecha en formato YYYY-MM-DD
UPDATE empleado SET employee_hire_date = substr(employee_hire_date, 7, 4) || '-' || substr(employee_hire_date, 4,2) || '-' || substr(employee_hire_date, 1,2)