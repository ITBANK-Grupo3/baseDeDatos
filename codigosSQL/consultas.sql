-- Consultar sobre cuál es el tipo de préstamo de mayor importe
SELECT * FROM prestamo 
WHERE loan_total = (
    SELECT MAX(CAST(loan_total as INT)) FROM prestamo
    );

-- Seleccionar el nombre, apellido y edad de los clientes que tengan en el apellido la letra Z
SELECT 
    customer_name,
    customer_surname,
    CURRENT_DATE - strftime(dob) as edad
FROM cliente 
WHERE customer_surname LIKE '%z%';

-- Seleccionar el nombre, apellido, edad y nombre de sucursal de las personas cuyo nombre sea “Brendan” y el resultado ordenarlo por nombre de sucursal
SELECT 
    customer_name,
    customer_surname,
    CURRENT_DATE - strftime(dob) as Edad,
    branch_name as Sucursal
FROM sucursal
INNER JOIN cliente ON sucursal.branch_id=cliente.branch_id
WHERE customer_name='Brendan'
ORDER BY branch_name

-- Contar la cantidad de clientes menores a 50 años
SELECT COUNT(*) as Menores_de_50_años FROM cliente
WHERE CURRENT_DATE - strftime(dob) < 50



