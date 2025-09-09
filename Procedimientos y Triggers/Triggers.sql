USE FeriaInternacional;
GO

--Este trigger sirve para auditar INSERT en Producto
CREATE TRIGGER trg_Producto_Insert
ON Producto
AFTER INSERT
AS
BEGIN
    INSERT INTO Log (usuario, accion, tabla_afectada, descripcion)
    SELECT SYSTEM_USER, 'INSERT', 'Producto',
           CONCAT('Se insertó producto con id_producto = ', CAST(id_producto AS VARCHAR))
    FROM inserted;
END;
GO

--Este trigger sirve para auditar UPDATE en Producto
CREATE TRIGGER trg_Producto_Update
ON Producto
AFTER UPDATE
AS
BEGIN
    INSERT INTO Log (usuario, accion, tabla_afectada, descripcion)
    SELECT SYSTEM_USER, 'UPDATE', 'Producto',
           CONCAT('Se actualizó producto con id_producto = ', CAST(id_producto AS VARCHAR))
    FROM inserted;
END;
GO

--Este trigger sirve para auditar DELETE en Producto 
CREATE TRIGGER trg_Producto_Delete
ON Producto
AFTER DELETE
AS
BEGIN
    INSERT INTO Log (usuario, accion, tabla_afectada, descripcion)
    SELECT SYSTEM_USER, 'DELETE', 'Producto',
           CONCAT('Se eliminó producto con id_producto = ', CAST(id_producto AS VARCHAR))
    FROM deleted;
END;
GO