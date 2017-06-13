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

-- PROCEDIMIENTO ALMACENADO PARA LLAMAR LA TABLA TIPOSANIMALES
ALTER PROCEDURE GetTiposAnimales
AS
BEGIN
    SELECT idTipoAnimal, denominacion
    FROM TiposAnimal
END

ALTER PROCEDURE GetTiposAnimalesPorId
	@idTipoAnimal bigint
AS
BEGIN
    SELECT denominacion, idTipoAnimal
    FROM TiposAnimal
    WHERE TiposAnimal.idTipoAnimal = @idTipoAnimal
END

ALTER PROCEDURE GetEspecies
AS
	BEGIN
		SELECT idEspecie, idClasificacion, idTipoAnimal, nombre, nPatas, esMascota
		FROM Especies
END

ALTER PROCEDURE GetEspeciesPorId
	@idEspecie bigint
AS
BEGIN
    SELECT idEspecie, idClasificacion, idTipoAnimal, nombre, nPatas, esMascota
    FROM Especies
    WHERE Especies.idEspecie = @idEspecie
END

ALTER PROCEDURE GetClasificacion
AS
BEGIN
    SELECT idClasificacion, denominacion
    FROM Clasificaciones
END

ALTER PROCEDURE GetClasificacionPorId
	@idClasificacion bigint
AS
BEGIN
    SELECT denominacion, idClasificacion
    FROM Clasificaciones
    WHERE Clasificaciones.idClasificacion = @idClasificacion
END