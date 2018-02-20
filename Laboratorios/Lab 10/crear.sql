Create table Materiales
(
Clave numeric(5),
Descripcion varchar(50),
Costo numeric(8,2)
)

CREATE TABLE Proveedores
(
RFC char(13),
RazonSocial varchar(50)
)

create table Proyectos
(
Numero numeric(5),
Denominacion varchar(50)
)
create table Entregan
(
Clave numeric(5),
RFC char(13),
Numero numeric(5),
Fecha datetime,
Cantidad numeric(8,2)
)