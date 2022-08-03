-- Crear un trigger que después de actualizar en la tabla cuentas los campos balance, IBAN o tipo de cuenta registre en la tabla auditoria
CREATE TRIGGER update_cuenta_AU AFTER UPDATE ON cuenta 
FOR EACH ROW INSERT INTO auditoria_cuenta (
    old_id,
	new_id,
	old_balance,
	new_balance,
	old_iban,
	new_iban,
	old_type,
	new_type,
	user_action,
	created_at)
VALUES (OLD.customer_id,
	NEW.customer_id,
	OLD.balance,
	NEW.balance,
	OLD.iban,
	NEW.iban,
	OLD.tipo_cuenta,
	NEW.tipo_cuenta,
	CURRENT_USER(),
	NOW()
)