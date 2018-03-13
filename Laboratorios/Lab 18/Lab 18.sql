SET DATEFORMAT DMY

SELECT e.Clave,e.Fecha,e.RFC, sum((m.costo - M.PorcentajeImpuesto)*E.Cantidad) as 'Total de importe'
FROM Entregan e, Materiales m
WHERE E.Clave = m.Clave
AND E.Fecha BETWEEN '01-01-1997' AND '31-12-1997'
GROUP BY e.Clave,e.Fecha,e.RFC

SELECT pr.RazonSocial, count(e.RFC) as 'Total de entregas', sum((m.costo - M.PorcentajeImpuesto)*E.Cantidad) as 'Total de importe'
FROM Proveedores pr, Entregan e, Materiales m
WHERE m.Clave = e.Clave AND pr.RFC = e.RFC
GROUP BY  pr.RazonSocial

SELECT m.Clave, m.Descripcion, sum(e.Cantidad) as 'Total de cantidad entregas', min(e.cantidad) as 'Minimo', MAX(e.Cantidad) as 'Maximo'
FROM Materiales m, Entregan e
WHERE m.Clave = e. Clave
GROUP BY M.Clave, m.Descripcion
HAVING avg(e.Cantidad) > 400

SELECT pr.RazonSocial, m.clave, m.Descripcion , AVG(e.cantidad) as 'Promedio'
FROM Materiales m, Entregan e, Proveedores pr
WHERE m.Clave = e.Clave AND e.RFC = pr.RFC
GROUP BY pr.RazonSocial, m.Clave, m.Descripcion
HAVING avg(e.Cantidad)>500
ORDER BY pr.RazonSocial desc

SELECT pr.RazonSocial, m.clave, m.Descripcion , AVG(e.cantidad) as 'Promedio'
FROM Materiales m, Entregan e, Proveedores pr
WHERE m.Clave = e.Clave AND e.RFC = pr.RFC
GROUP BY pr.RazonSocial, m.Clave, m.Descripcion
HAVING avg(e.Cantidad)>450 or avg(e.cantidad)<370
ORDER BY pr.RazonSocial desc

Insert into Materiales Values(1500,'Pintura Azul',120,5)

Insert into Materiales Values(1510,'Cemento cruz azul',200,10)

Insert into Materiales Values(1520,'Hormigon',300,15)

Insert into Materiales Values(1530,'Loza',150,5)

Insert into Materiales Values(1540,'Tabla Roca',70,2)

SELECT m.clave, m.Descripcion
FROM Materiales m
WHERE Clave NOT IN (SELECT CLAVE FROM Entregan)

(SELECT distinct pr.RazonSocial
FROM Proveedores pr, Entregan e, Proyectos p
WHERE pr.RFC = e.RFC AND p.Numero = e.Numero
AND p.Denominacion = 'Vamos Mexico')
INTERSECT
(SELECT distinct pr.RazonSocial
FROM Proveedores pr, Entregan e, Proyectos p
WHERE pr.RFC = e.RFC AND p.Numero = e.Numero
AND p.Denominacion = 'Queretaro Limpio')

SELECT distinct	descripcion
FROM Materiales
WHERE Clave NOT IN (SELECT m.clave
					FROM Materiales M, Entregan e, Proyectos p
					WHERE M.Clave = e.Clave AND p.Numero = e.Numero
					AND p.Denominacion ='CIT Yucatan')

SELECT pr.RazonSocial, avg(e.cantidad) as 'Promedio de Cantidad Entregada'
FROM Proveedores pr, Entregan e
WHERE PR.RFC = E.RFC
GROUP BY pr.RazonSocial
Having avg(e.cantidad) > (SELECT avg(e.cantidad)
							FROM Proveedores pr, Entregan e
							WHERE pr.RFC = e.RFC
							AND pr.RFC = 'VAGO780901')
							
SELECT pr.RazonSocial, sum(e.cantidad) as 'Total cantidad'
FROM Proyectos p,Entregan e, Proveedores pr
WHERE P.Numero = e.Numero AND pr.RFC = e.RFC
AND p.Denominacion = 'Infonavit Durango'
AND e.Fecha BETWEEN '01-01-2000' AND '31-12-2000'
GROUP BY pr.RazonSocial
HAVING sum(e.cantidad) > (SELECT sum(e.cantidad) as 'Total cantidad'
							FROM Proyectos p,Entregan e, Proveedores pr
							WHERE P.Numero = e.Numero AND pr.RFC = e.RFC
							AND p.Denominacion = 'Infonavit Durango'
							AND e.Fecha BETWEEN '01-01-2001' AND '31-12-2001')

SELECT * FROM Proveedores


SELECT * FROM Materiales

SELECT * FROM Entregan where Fecha BETWEEN '01-01-1997' AND '31-12-1997'