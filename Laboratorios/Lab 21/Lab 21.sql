IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'creaMaterial' AND type = 'p')
		DROP PROCEDURE creaMaterial
	GO

	CREATE PROCEDURE creaMaterial
		@uclave NUMERIC(5,0),
		@udescripcion VARCHAR(50),
		@ucosto NUMERIC(8,2),
		@uimpuesto NUMERIC(6,2)

	AS
		INSERT INTO Materiales VALUES (@uclave,@udescripcion,@ucosto,@uimpuesto)
	GO


EXECUTE creaMaterial 5000,'Martillos Acme',250,15

SELECT * FROM Materiales
IF EXISTS (SELECT name FROM sysobjects 
                       WHERE name = 'modificaMaterial' AND type = 'P')
                DROP PROCEDURE modificaMaterial

GO

CREATE PROCEDURE modificaMaterial
	@uclave NUMERIC(5,0),
	@udescripcion VARCHAR(50),
	@ucosto NUMERIC(8,2),
	@uimpuesto NUMERIC(6,2)

AS
	UPDATE Materiales
	SET Descripcion = @udescripcion, Costo = @ucosto, PorcentajeImpuesto = @uimpuesto
	WHERE Clave = @uclave
GO

IF EXISTS (SELECT name FROM sysobjects 
                       WHERE name = 'eliminaMaterial' AND type = 'P')
                DROP PROCEDURE eliminaMaterial

GO

CREATE PROCEDURE eliminaMaterial
	@uclave NUMERIC(5,0)

AS 
	DELETE FROM Materiales WHERE Clave = @uclave
GO



IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'creaProyecto' AND type = 'p')
		DROP PROCEDURE creaProyecto
	GO

	CREATE PROCEDURE creaProyecto
		@unumero NUMERIC(5,0),
		@udenominacion VARCHAR(50)

	AS
		INSERT INTO Proyectos VALUES (@unumero,@udenominacion)
	GO



IF EXISTS (SELECT name FROM sysobjects 
                       WHERE name = 'modificaProyecto' AND type = 'P')
                DROP PROCEDURE modificaProyecto

GO

CREATE PROCEDURE modificaProyecto
	@unumero NUMERIC(5,0),
	@udenominacion VARCHAR(50)

AS
	UPDATE Proyectos
	SET Denominacion = @udenominacion
	WHERE Numero = @unumero
GO

IF EXISTS (SELECT name FROM sysobjects 
                       WHERE name = 'eliminaProyecto' AND type = 'P')
                DROP PROCEDURE eliminaProyecto

GO

CREATE PROCEDURE eliminaProyecto
	@unumero NUMERIC(5,0)

AS 
	DELETE FROM Proyectos WHERE Numero = @unumero
GO

--//////////////////////////////////////////////////////////////////////////////////////////////////////

IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'creaProveedores' AND type = 'p')
		DROP PROCEDURE creaProveedores
	GO

	CREATE PROCEDURE creaProveedores
		@urfc VARCHAR(13),
		@urazonsocial VARCHAR(13)

	AS
		INSERT INTO Proveedores VALUES (@urfc,@urazonsocial)
	GO



IF EXISTS (SELECT name FROM sysobjects 
                       WHERE name = 'modificaProveedores' AND type = 'P')
                DROP PROCEDURE modificaProveedores

GO

CREATE PROCEDURE modificaProveedores
	@urfc VARCHAR(13),
	@urazonsocial VARCHAR(13)

AS
	UPDATE Proveedores
	SET RazonSocial = @urazonsocial
	WHERE RFC = @urfc
GO

IF EXISTS (SELECT name FROM sysobjects 
                       WHERE name = 'eliminaProveedores' AND type = 'P')
                DROP PROCEDURE eliminaProveedores

GO

CREATE PROCEDURE eliminaProveedores
	@urfc VARCHAR(13)

AS 
	DELETE FROM Proveedores WHERE RFC = @urfc
GO
--/////////////////////////////////////////////////////////////////////////////////////////////////////
IF EXISTS (SELECT name FROM sysobjects
			WHERE name = 'creaEntregan' AND type = 'p')
		DROP PROCEDURE creaEntregan
	GO

	CREATE PROCEDURE creaEntregan
		@uclave NUMERIC(5,0),
		@urfc VARCHAR(13),
		@unumero NUMERIC(5,0),
		@ufecha DateTime,
		@ucantidad NUMERIC(8,2)

	AS
		INSERT INTO Entregan VALUES (@uclave,@urfc,@unumero,@ufecha,@ucantidad)
	GO



IF EXISTS (SELECT name FROM sysobjects 
                       WHERE name = 'modificaEntregan' AND type = 'P')
                DROP PROCEDURE modificaEntregan

GO

CREATE PROCEDURE modificaEntregan
	@uclave NUMERIC(5,0),
	@urfc VARCHAR(13),
	@unumero NUMERIC(5,0),
	@ufecha DateTime,
	@ucantidad NUMERIC(8,2)

AS
	UPDATE Entregan
	SET RFC = @urfc, Clave = @uclave, Numero =@unumero, Cantidad = @ucantidad
	WHERE Fecha = @ufecha
GO

IF EXISTS (SELECT name FROM sysobjects 
                       WHERE name = 'eliminaEntregan' AND type = 'P')
                DROP PROCEDURE eliminaEntregan

GO

CREATE PROCEDURE eliminaEntregan
	@uclave NUMERIC(5,0),
	@urfc VARCHAR(13),
	@unumero NUMERIC(5,0),
	@ufecha DateTime

AS 
	DELETE FROM Entregan WHERE RFC = @urfc AND Clave = @uclave AND Numero = @unumero AND Fecha = @ufecha
GO

EXECUTE creaMaterial 5000,'Martillos Acme',250,15
EXECUTE modificaMaterial 5000,'Martillos Huitz',500,20
EXECUTE eliminaMaterial 5000

SELECT * FROM Materiales

EXECUTE creaProyecto 6000,'Casa de Huitz'
EXECUTE modificaProyecto 6000,'Pepe vive ahi ahora'
EXECUTE eliminaProyecto 6000 


SELECT * FROM Proyectos


EXECUTE creaProveedores 'JJJJJOIKL','La Constructora'
EXECUTE modificaProveedores 'JJJJJOIKL', 'La constri'
EXECUTE eliminaProveedores 'JJJJJOIKL'

SELECT * FROM Proveedores


SET DATEFORMAT DMY
EXECUTE creaEntregan 1010,'AAAA800101',5001,'03/03/2018',50
EXECUTE modificaEntregan 1010,'AAAA800101',5001,'03/03/2018',600
EXECUTE eliminaEntregan 1010,'AAAA800101',5001,'03/03/2018'

SELECT * FROM Entregan 


IF EXISTS (SELECT name FROM sysobjects 
			WHERE name = 'queryMaterial' AND type = 'P')
	DROP PROCEDURE queryMaterial
GO
                            
	CREATE PROCEDURE queryMaterial
		@udescripcion VARCHAR(50),
        @ucosto NUMERIC(8,2)
                            
	AS
		SELECT * FROM Materiales WHERE descripcion 
        LIKE '%'+@udescripcion+'%' AND costo > @ucosto 
GO

EXECUTE queryMaterial 'Lad',20 