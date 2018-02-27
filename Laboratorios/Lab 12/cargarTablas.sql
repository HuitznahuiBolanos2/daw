bulk insert a1207438.a1207438.[Proyectos]
from 'e:\wwwroot\a1207438\Tablas de BD\proyectos.csv'
with
(
CODEPAGE = 'ACP',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)

 bulk insert a1207438.a1207438.[Proveedores]
from 'e:\wwwroot\a1207438\Tablas de BD\proveedores.csv'
with
(
CODEPAGE = 'ACP',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
 
 bulk insert a1207438.a1207438.[Materiales]
From 'e:\wwwroot\a1207438\Tablas de BD\materiales.csv'
with
(
CODEPAGE = 'ACP',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
 
 SET DATEFORMAT dmy

bulk insert a1207438.a1207438.[Entregan]
from 'e:\wwwroot\a1207438\Tablas de BD\entregan.csv'
with
(
CODEPAGE = 'ACP',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)