-- Mediante índices mejorar la performance la búsqueda de clientes por DNI
CREATE INDEX dni_cliente_idx
ON cliente(customer_DNI);