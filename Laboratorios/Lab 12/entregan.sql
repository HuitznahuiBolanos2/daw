 SET DATEFORMAT dmy

bulk insert a1207438.a1207438.[Entregan]
from 'e:\wwwroot\a1207438\Tablas de BD\entregan.csv'
with
(
CODEPAGE = 'ACP',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)