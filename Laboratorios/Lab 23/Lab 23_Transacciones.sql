CREATE TABLE clientes
(
NoCliente	varChar(5) not null PRIMARY KEY,
Nombre		varchar(30),
Saldo		numeric(10,2)
)

CREATE TABLE movimientos
(
ClaveM			varchar(2) not null PRIMARY KEY,
Descripcion		varchar(30)
)



CREATE TABLE realizan
(
NoCliente	varchar(5) not null FOREIGN KEY REFERENCES clientes(NoCliente),
ClaveM		varchar(2) not null FOREIGN KEY REFERENCES movimientos(ClaveM),
Fecha		datetime not null,
Monto		numeric(10,2)
PRIMARY KEY (NoCliente,ClaveM,Fecha)
)


BEGIN TRANSACTION PRUEBA1
INSERT INTO clientes VALUES('001', 'Manuel Rios Maldonado', 9000);
INSERT INTO clientes VALUES('002', 'Pablo Perez Ortiz', 5000);
INSERT INTO clientes VALUES('003', 'Luis Flores Alvarado', 8000);
COMMIT TRANSACTION PRUEBA1 

BEGIN TRANSACTION PRUEBA2
INSERT INTO clientes VALUES('004','Ricardo Rios Maldonado',19000)
INSERT INTO clientes VALUES('005','Pablo Ortiz Arana',15000)
INSERT INTO clientes VALUES('006','Luis Manuel Alvarado',18000) 

ROLLBACK TRANSACTION PRUEBA2 

SELECT * FROM clientes

BEGIN TRANSACTION PRUEBA3
INSERT INTO movimientos VALUES('A','Retiro Cajero Automatico');
INSERT INTO movimientos VALUES('B','Deposito Ventanilla');
COMMIT TRANSACTION PRUEBA3

SELECT * FROM movimientos

BEGIN TRANSACTION PRUEBA4
INSERT INTO realizan VALUES('001','A',GETDATE(),500);
UPDATE clientes SET Saldo = Saldo -500
WHERE NoCliente='001'
COMMIT TRANSACTION PRUEBA4

SELECT * FROM clientes
SELECT * FROM realizan

BEGIN TRANSACTION PRUEBA5
INSERT INTO clientes VALUES('005','Rosa Ruiz Maldonado',9000);
INSERT INTO clientes VALUES('006','Luis Camino Ortiz',5000);
INSERT INTO clientes VALUES('001','Oscar Perez Alvarado',8000);


IF @@ERROR = 0
COMMIT TRANSACTION PRUEBA5
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION PRUEBA5
END

	SELECT * FROM Materiales
	SELECT * FROM clientes

	GO

	CREATE PROCEDURE REGISTRAR_RETIRO_CAJERO
		@NoCliente varchar(5),
		@Monto numeric(10,2)
	as
		BEGIN TRANSACTION PRUEBA4
		INSERT INTO realizan VALUES(@NoCliente,'A',GETDATE(),@Monto);
		UPDATE clientes SET Saldo = Saldo -@Monto
		WHERE NoCliente=@NoCliente
		IF @@ERROR = 0
		COMMIT TRANSACTION PRUEBA4
		ELSE
		BEGIN
		PRINT 'A transaction needs to be rolled back'
		ROLLBACK TRANSACTION PRUEBA4
		END
	GO

	SELECT * FROM clientes


	EXECUTE REGISTRAR_RETIRO_CAJERO '001',200

	SELECT * FROM realizan

	GO 

	CREATE PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
		@NoCliente varchar(5),
		@Monto		numeric(10,2)
	AS
		BEGIN TRANSACTION Retiro
		INSERT INTO realizan VALUES(@NoCliente,'B',GETDATE(),@Monto)
		UPDATE clientes SET Saldo=Saldo+@Monto
		WHERE NoCliente = @NoCliente
		IF @@ERROR = 0
		COMMIT TRANSACTION Retiro
		ELSE
		BEGIN
		PRINT 'A transaction needs to be rolled back'
		ROLLBACK TRANSACTION Retiro
		END
	GO
	
	SELECT * FROM realizan
	SELECT * FROM clientes

	EXECUTE REGISTRAR_DEPOSITO_VENTANILLA '001',500

