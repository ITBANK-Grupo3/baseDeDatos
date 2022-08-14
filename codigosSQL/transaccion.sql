-- Ejecutar ejecución por ejeción en el entorno
BEGIN TRANSACTION;

	UPDATE cuenta
	SET balance = balance - 1000
	WHERE account_id = 200;
	
	UPDATE cuenta
	SET balance = balance + 1000
	WHERE account_id = 400;
	
  INSERT INTO movimientos(
    account_id_emi,
	account_id_rec,
    amount,
    type,
    created_at
  )VALUES(
    200,
    400,
	1000,
	"transferencia",
	date('now')
	);

COMMIT TRANSACTION;

