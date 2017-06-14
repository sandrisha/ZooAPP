-- CREAMOS EL PROCEDIMIENTO ALMACENADO
--ALTER PROCEDURE GetAnimalPorEspecie
--AS
--BEGIN
--	SELECT 
--	Especies.nombre as NombreEspecie
--	, Clasificaciones.denominacion as Clasificacion
--	, TiposAnimal.denominacion as TiposAnimal
--	FROM Clasificaciones
--		INNER JOIN Especies ON Clasificaciones.idClasificacion = Especies.idEspecie
--		INNER JOIN TiposAnimal ON Especies.idTipoAnimal = TiposAnimal.idTipoAnimal
--	ORDER BY Especies.nombre
--END

-- PROCEDIMIENTO ALMACENADO PARA OBTENER TODOS LOS DATOS DE LA TABLA TIPOSANIMALES
ALTER PROCEDURE GetTiposAnimales
AS
BEGIN
    SELECT idTipoAnimal, denominacion
    FROM TiposAnimal
END

-- PROCEDIMIENTO PARA OBTENER LOS DATOS POR ID DE LA TABLA TIPOSANIMALES
ALTER PROCEDURE GetTiposAnimalesPorId
	@idTipoAnimal bigint
AS
BEGIN
    SELECT denominacion, idTipoAnimal
    FROM TiposAnimal
    WHERE TiposAnimal.idTipoAnimal = @idTipoAnimal
END

-- PROCEDIMIENTO PARA INSERTAR UN NUEVO TIPOANIMAL
ALTER PROCEDURE AgregarTipoAnimal
	@denominacion nvarchar(50)
AS
BEGIN
	INSERT INTO TiposAnimal(denominacion) VALUES (@denominacion)
END


-- PROCEDIMIENTO PARA ACTUALIZAR LOS DATOS DEL TIPOANIMAL
ALTER PROCEDURE ActualizarTiposAnimales
	@id bigint
	,@denominacion nvarchar(50)
AS
BEGIN
	UPDATE TiposAnimal SET 
		denominacion = @denominacion
		WHERE idTipoAnimal = @id
END

-- PROCEDIMIENTO PARA ELIMINAR UN TIPOANIMAL
ALTER PROCEDURE EliminarTipoAnimal
	@id bigint
AS
BEGIN
	DELETE FROM TiposAnimal WHERE idTipoAnimal = @id
END

-- PROCEDIMIENTO OBTENER TODOS LOS DATOS DE LA TABLA CLASIFICACION
ALTER PROCEDURE GetClasificacion
AS
BEGIN
    SELECT idClasificacion, denominacion
    FROM Clasificaciones
END

-- PROCEDIMIENTO OBTENER TODOS LOS DATOS DE LA TABLA CLASIFICACION POR ID
ALTER PROCEDURE GetClasificacionPorId
	@idClasificacion bigint
AS
BEGIN
    SELECT denominacion, idClasificacion
    FROM Clasificaciones
    WHERE Clasificaciones.idClasificacion = @idClasificacion
END

-- PROCEDIMIENTO PARA INSERTAR UNA NUEVA CLASIFICACION
ALTER PROCEDURE AgregarClasificacion
	@denominacion nvarchar(50)
AS
BEGIN
	INSERT INTO Clasificaciones(denominacion) VALUES (@denominacion)
END


-- PROCEDIMIENTO PARA ACTUALIZAR LOS DATOS DE CLASIFICION
ALTER PROCEDURE ActualizarClasificacion
	@id bigint
	,@denominacion nvarchar(50)
AS
BEGIN
	UPDATE Clasificaciones SET 
		denominacion = @denominacion
		WHERE idClasificacion = @id
END

-- PROCEDIMIENTO PARA ELIMINAR UNA CLASIFICACION
ALTER PROCEDURE EliminarClasificacion
	@id bigint
AS
BEGIN
	DELETE FROM Clasificaciones WHERE idClasificacion = @id
END

-- PROCEDIMIENTO OBTENER TODOS LOS DATOS DE LA TABLA ESPECIES
ALTER PROCEDURE GetEspecies
AS
	BEGIN
		SELECT idEspecie, idClasificacion, idTipoAnimal, nombre, nPatas, esMascota
		FROM Especies
END

-- PROCEDIMIENTO OBTENER TODOS LOS DATOS DE LA TABLA ESPECIES POR ID
ALTER PROCEDURE GetEspeciesPorId
	@idEspecie bigint
AS
BEGIN
    SELECT idEspecie, idClasificacion, idTipoAnimal, nombre, nPatas, esMascota
    FROM Especies
    WHERE Especies.idEspecie = @idEspecie
END

-- PROCEDIMIENTO PARA INSERTAR UNA NUEVA ESPECIE
ALTER PROCEDURE AgregarEspecie
	@nombre nvarchar(50)
AS
BEGIN
	INSERT INTO Especies(nombre) VALUES (@nombre)
END

-- PROCEDIMIENTO PARA ACTUALIZAR LOS DATOS DE ESPECIE
ALTER PROCEDURE ActualizarEspecie
	@id bigint
	,@nombre nvarchar(50)
AS
BEGIN
	UPDATE Especies SET 
		nombre = @nombre
		WHERE idEspecie = @id
END

-- PROCEDIMIENTO PARA ELIMINAR UNA ESPECIE
ALTER PROCEDURE EliminarEspecie
	@id bigint
AS
BEGIN
	DELETE FROM Especies WHERE idEspecie = @id
END