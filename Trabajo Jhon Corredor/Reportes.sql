USE Fit;
GO
--TRUNCATE
TRUNCATE TABLE Feria;
TRUNCATE TABLE Persona;
TRUNCATE TABLE TipoVisitante;
TRUNCATE TABLE Tematica;
TRUNCATE TABLE Empresa;
TRUNCATE TABLE Demostracion;
TRUNCATE TABLE Charla;
TRUNCATE TABLE Responsable;
TRUNCATE TABLE Ponente;
TRUNCATE TABLE Visitante;
TRUNCATE TABLE Pabellon;
TRUNCATE TABLE Stand;
TRUNCATE TABLE Producto;
TRUNCATE TABLE Registro;

--SELECT
SELECT * FROM Fit;

SELECT nombre, apellido FROM Persona;

SELECT * FROM Producto
WHERE nombre = 'Pantalla Portatil';

--SELECT CON JOINS

SELECT 
    p.nombre AS NombreVisitante,
    p.apellido AS ApellidoVisitante,
    tv.nombre AS TipoDeVisitante
FROM 
    Visitante v
JOIN 
    Persona p ON v.id_persona = p.id_persona
JOIN 
    TipoVisitante tv ON v.id_tipo_visitante = tv.id_tipo_visitante;


SELECT 
    s.id_stand AS StandID,
    e.nombre AS NombreEmpresa,
    p.id_pabellon AS PabellonID
FROM 
    Stand s
JOIN 
    Empresa e ON s.id_empresa = e.id_empresa
JOIN 
    Pabellon p ON s.id_pabellon = p.id_pabellon;



SELECT 
    prod.nombre AS NombreProducto,
    s.id_stand AS StandID,
    per.nombre + ' ' + per.apellido AS NombreResponsable
FROM 
    Producto prod
JOIN 
    Stand s ON prod.id_stand = s.id_stand
JOIN 
    Responsable r ON prod.id_responsable = r.id_responsable
JOIN 
    Persona per ON r.id_persona = per.id_persona;


SELECT 
    c.nombre AS NombreCharla,
    p.nombre + ' ' + p.apellido AS NombrePonente
FROM 
    Registro r
JOIN 
    Charla c ON r.id_charla = c.id_charla
JOIN 
    Ponente po ON r.id_ponente = po.id_ponente
JOIN 
    Persona p ON po.id_persona = p.id_persona;


SELECT
    dem.nombre AS NombreDemostracion,
    e.nombre AS NombreEmpresa,
    t.nombre AS Tematica
FROM
    Demostracion dem
JOIN
    Empresa e ON dem.id_demostracion = e.id_empresa
JOIN
    Tematica t ON e.id_empresa = t.id_tematica;


--UPDATES
UPDATE Persona
SET email = 'tomas.perez.nuevo@gmail.com'
WHERE id_persona = 3;


UPDATE Producto
SET nombre = 'Robot de limpieza avanzada'
WHERE id_producto = 4;


DELETE FROM Registro WHERE id_registro = 3;


DELETE FROM Producto WHERE id_producto = 5;


