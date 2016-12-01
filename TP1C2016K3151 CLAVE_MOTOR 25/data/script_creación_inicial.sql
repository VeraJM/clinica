USE [GD1C2016]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE SCHEMA CLAVE_MOTOR AUTHORIZATION gd
GO

/*****************************************************************/
/***********************CREACION DE TABLAS************************/
/*****************************************************************/

/*
* Las posibles funcionalidades que conforman cada Rol definen a cuales acciones del sistema
* tienen acceso los Usuarios que tienen asignado ese Rol.
*/
PRINT 'Tabla Funcionalidades'
GO

CREATE TABLE CLAVE_MOTOR.Funcionalidad (
	func_id tinyint IDENTITY(1,1) PRIMARY KEY,
	func_descripcion nvarchar(50) NOT NULL
	)
GO

PRINT 'INSERT Funcionalidades'
GO

INSERT INTO CLAVE_MOTOR.Funcionalidad (func_descripcion) VALUES('ABM de Rol');
INSERT INTO CLAVE_MOTOR.Funcionalidad (func_descripcion) VALUES('ABM de Usuarios');
INSERT INTO CLAVE_MOTOR.Funcionalidad (func_descripcion) VALUES('ABM de Rubro');
INSERT INTO CLAVE_MOTOR.Funcionalidad (func_descripcion) VALUES('ABM de Visibilidad');
INSERT INTO CLAVE_MOTOR.Funcionalidad (func_descripcion) VALUES('Generar Publicaciones');
INSERT INTO CLAVE_MOTOR.Funcionalidad (func_descripcion) VALUES('Comprar-Ofertar');
INSERT INTO CLAVE_MOTOR.Funcionalidad (func_descripcion) VALUES('Historial del cliente');
INSERT INTO CLAVE_MOTOR.Funcionalidad (func_descripcion) VALUES('Calificar al Vendedor');
INSERT INTO CLAVE_MOTOR.Funcionalidad (func_descripcion) VALUES('Consulta de Facturas');
INSERT INTO CLAVE_MOTOR.Funcionalidad (func_descripcion) VALUES('Listado Estadistico');

-------------------------------------------------------------------------------

/*
* Los Roles son conjuntos de funcionalidades que son asignadas a los usuarios del sistema
*/

PRINT 'Tabla Rol'
GO

CREATE TABLE CLAVE_MOTOR.Rol (
	rol_id int IDENTITY(1,1) PRIMARY KEY,
	rol_descripcion nvarchar(50) NOT NULL,
	rol_habilitado tinyint DEFAULT 1 NOT NULL
	)
GO

PRINT 'INSERT Rol'
GO

INSERT INTO CLAVE_MOTOR.Rol(rol_descripcion) values ('Administrador');
INSERT INTO CLAVE_MOTOR.Rol(rol_descripcion) values ('Cliente');
INSERT INTO CLAVE_MOTOR.Rol(rol_descripcion) values ('Empresa');
GO

CREATE INDEX RolesPorNombre
    ON CLAVE_MOTOR.Rol (rol_descripcion);
GO

------------------------------------------------------------------------

/*
* La tabla FuncionalidadRol es usada para determinar que funcionalidades estan
* asignadas a los distintos roles
*/
PRINT 'Tabla FuncionalidadRol'
GO

CREATE TABLE CLAVE_MOTOR.FuncionalidadRol (
	furo_idFuncionalidad  tinyint REFERENCES CLAVE_MOTOR.Funcionalidad NOT NULL,
	furo_idRol  int REFERENCES CLAVE_MOTOR.Rol NOT NULL,
	PRIMARY KEY(furo_idFuncionalidad, furo_idRol)
	)
GO

PRINT 'INSERT FuncionalidadRol'
GO

/*
* El rol Administrador lleva todas las funciones del sistema
*/
INSERT INTO CLAVE_MOTOR.FuncionalidadRol (furo_idFuncionalidad,furo_idRol)
	(SELECT Funcionalidad.func_id, Rol.rol_id
	FROM CLAVE_MOTOR.Funcionalidad, CLAVE_MOTOR.Rol
	WHERE Rol.rol_descripcion = 'Administrador'
	AND func_descripcion = 'ABM de Rol'
	OR func_descripcion = 'ABM de Usuarios'
	OR func_descripcion = 'ABM de Rubro'
	OR func_descripcion = 'ABM de Visibilidad'
	OR func_descripcion = 'Consulta de Facturas'
	OR func_descripcion = 'Listado Estadistico');
/*
* Los clientes solo podran comprar o ofertar publicaciones
*/
INSERT INTO CLAVE_MOTOR.FuncionalidadRol (furo_idFuncionalidad,furo_idRol)
	(SELECT func_id, rol_id
	FROM CLAVE_MOTOR.Funcionalidad, CLAVE_MOTOR.Rol
	WHERE rol_descripcion = 'Cliente'
	AND func_descripcion = 'Comprar-Ofertar'
	OR func_descripcion = 'Historial del cliente'
	OR func_descripcion = 'Calificar al Vendedor');
/*
* Las empresas solo podran hacer publicaciones
*/
INSERT INTO CLAVE_MOTOR.FuncionalidadRol (furo_idFuncionalidad,furo_idRol)
	(SELECT func_id, rol_id
	FROM CLAVE_MOTOR.Funcionalidad, CLAVE_MOTOR.Rol
	WHERE rol_descripcion = 'Empresa'
	AND func_descripcion = 'Generar Publicaciones');
GO

----------------------------------------------------------------------------

PRINT 'Tabla Usuario'
GO

CREATE TABLE CLAVE_MOTOR.Usuario (
	usua_id int IDENTITY(1,1) PRIMARY KEY,
	usua_username varchar(30) NOT NULL,
	usua_password varchar(64) NOT NULL,
	usua_fechaCreacion datetime DEFAULT GETDATE() NOT NULL,
	usua_habilitado bit NOT NULL DEFAULT 1,
	/*usua_idRol int REFERENCES CLAVE_MOTOR.Rol NOT NULL, */
	usua_intentosLogin int NOT NULL DEFAULT 0
	)
GO

PRINT 'TABLA Asignaciones'
CREATE TABLE CLAVE_MOTOR.Asignaciones (
	usua_id int REFERENCES CLAVE_MOTOR.Usuario,
	idRol int REFERENCES CLAVE_MOTOR.Rol NOT NULL,)
GO

PRINT 'INSERT Usuario'
GO

/*
* Funcion de Hashing de password.
*
*/
CREATE FUNCTION CLAVE_MOTOR.FX_HASH_PASSWORD(@password varchar(50))
RETURNS varchar(64)
AS BEGIN
RETURN RIGHT(CONVERT(varchar(66),HASHBYTES('SHA2_256',@password),1),64)
END
GO

/*
* Se inserta el usuario admin
*/
INSERT INTO CLAVE_MOTOR.Usuario (usua_username, usua_password)
	VALUES ('admin', 
			CLAVE_MOTOR.FX_HASH_PASSWORD('admin')/*,
			(SELECT Rol.rol_id
				FROM CLAVE_MOTOR.Rol
				WHERE Rol.rol_descripcion = 'Administrador')*/
			);
GO

INSERT INTO CLAVE_MOTOR.Asignaciones (usua_id,idRol)
		VALUES((SELECT usua_id FROM [CLAVE_MOTOR].[Usuario] US WHERE usua_username = 'admin'),
			(SELECT rol_id FROM [CLAVE_MOTOR].[Rol] WHERE rol_descripcion = 'Administrador'));
GO

/*
* Se insertan los usuarios Empresa con su respectivo rol
* La password por default de los usarios existentes en 
* el sistema pre-migracion es 'password'
*/

/*
* Funcion para componer un username a partir de la razon social de una empresa pre-migracion.
* PARA LAS POST-MIGRACION NO DEBE USARSE YA QUE LA RAZON SOCIAL PUEDE NO POSSER EL MISMO FORMATO
*/

CREATE FUNCTION CLAVE_MOTOR.FX_USERNAME_EMPRESA(@Razonsocial varchar(50))
RETURNS varchar(50)
AS BEGIN
RETURN REPLACE(@Razonsocial,'º:','');
END
GO
/*
INSERT INTO CLAVE_MOTOR.Usuario(usua_username,usua_password,usua_idRol)
	(SELECT DISTINCT CLAVE_MOTOR.FX_USERNAME_EMPRESA(Maestra.Publ_Empresa_Razon_Social),
	CLAVE_MOTOR.FX_HASH_PASSWORD('password'), 
	(SELECT CLAVE_MOTOR.Rol.rol_id 
		FROM CLAVE_MOTOR.Rol
		WHERE rol.rol_descripcion = 'Empresa')
	FROM gd_esquema.Maestra
	WHERE Maestra.Publ_Empresa_Razon_Social IS NOT NULL
	);
GO
*/

CREATE PROCEDURE CLAVE_MOTOR.MIGRACION_EMPRESAS
AS BEGIN
DECLARE C_EMPRESAS CURSOR FOR (SELECT DISTINCT CLAVE_MOTOR.FX_USERNAME_EMPRESA(Maestra.Publ_Empresa_Razon_Social) 
								FROM gd_esquema.Maestra
								WHERE Maestra.Publ_Empresa_Razon_Social IS NOT NULL)
OPEN C_EMPRESAS
DECLARE @EMPRESA VARCHAR(100)
FETCH NEXT FROM C_EMPRESAS INTO @EMPRESA
WHILE (@@FETCH_STATUS = 0)
BEGIN 
/*PRINT 'ESTO SE EJECUTAAAAAAAAAAAAAAAAAAAAAAAAAAA'*/
	INSERT INTO CLAVE_MOTOR.Usuario (usua_username,usua_password)
			VALUES (CLAVE_MOTOR.FX_USERNAME_EMPRESA(@EMPRESA),CLAVE_MOTOR.FX_HASH_PASSWORD('password'));
	
	DECLARE @ID_USUARIO INT
	SELECT @ID_USUARIO= SCOPE_IDENTITY()
	
	INSERT INTO CLAVE_MOTOR.Asignaciones(usua_id,idRol)
			VALUES (@ID_USUARIO,
					(SELECT CLAVE_MOTOR.Rol.rol_id FROM CLAVE_MOTOR.Rol WHERE rol.rol_descripcion = 'Empresa'));

	FETCH NEXT FROM C_EMPRESAS INTO @EMPRESA
END
CLOSE C_EMPRESAS
DEALLOCATE C_EMPRESAS
END
GO

EXEC CLAVE_MOTOR.MIGRACION_EMPRESAS;
GO

/*
* Funcion para componer un username a partir del nombre y apellido de un cliente.
* 
*/
CREATE FUNCTION CLAVE_MOTOR.FX_USERNAME_CLIENTE(@nombre varchar(50),@apellido varchar(50))
RETURNS varchar(100)
AS BEGIN
RETURN REPLACE(LOWER(@nombre + @apellido), ' ','')
END
GO

/*
* Se insertan los usuarios de clientes con su respectivo Rol.
*/
INSERT INTO CLAVE_MOTOR.Usuario(usua_username,usua_password)
	(SELECT DISTINCT CLAVE_MOTOR.FX_USERNAME_CLIENTE(Maestra.Cli_Nombre,Maestra.Cli_Apeliido),
	CLAVE_MOTOR.FX_HASH_PASSWORD('password')/*, 
	(SELECT CLAVE_MOTOR.Rol.rol_id 
		FROM CLAVE_MOTOR.Rol
		WHERE rol.rol_descripcion = 'Cliente')*/
	FROM gd_esquema.Maestra
	WHERE Maestra.Cli_Dni IS NOT NULL
	UNION
	SELECT DISTINCT CLAVE_MOTOR.FX_USERNAME_CLIENTE(Maestra.Publ_Cli_Nombre,Maestra.Publ_Cli_Apeliido),
	CLAVE_MOTOR.FX_HASH_PASSWORD('password')/*, 
	(SELECT CLAVE_MOTOR.Rol.rol_id 
		FROM CLAVE_MOTOR.Rol
		WHERE rol.rol_descripcion = 'Cliente')*/
	FROM gd_esquema.Maestra
	WHERE Maestra.Publ_Cli_Dni IS NOT NULL
	);
GO

/*
* Varios accesos a usuarios seran por su username.
*/
CREATE INDEX UsuariosPorNombre
    ON CLAVE_MOTOR.Usuario (usua_username);
GO

----------------------------------------------------------------------------

/*
* Creacion de domicilios.
*/
PRINT 'Tabla Domicilios'
GO
CREATE TABLE CLAVE_MOTOR.Domicilio (
	domi_id int IDENTITY(1,1) PRIMARY KEY,
	domi_calle nvarchar(100),
	domi_nro int,
	domi_piso int,
	domi_depto nvarchar(5),
	domi_codPostal nvarchar(20),
	domi_ciudad nvarchar(50),
	domi_localidad nvarchar(50),
	)
GO

PRINT 'INSERT Domicilios'
GO
INSERT INTO CLAVE_MOTOR.Domicilio(domi_calle,domi_nro,domi_piso,domi_depto,domi_codPostal)
(SELECT DISTINCT Maestra.Cli_Dom_Calle,Maestra.Cli_Nro_Calle,Maestra.Cli_Cod_Postal,Maestra.Cli_Depto,Maestra.Cli_Piso
FROM gd_esquema.Maestra
WHERE Maestra.Cli_Dni IS NOT NULL
UNION
SELECT DISTINCT Maestra.Publ_Cli_Dom_Calle, Maestra.Publ_Cli_Nro_Calle,Maestra.Publ_Cli_Cod_Postal,Maestra.Publ_Cli_Depto,Maestra.Publ_Cli_Piso
FROM gd_esquema.Maestra
WHERE Maestra.Publ_Cli_Dni IS NOT NULL
UNION 
SELECT DISTINCT Maestra.Publ_Empresa_Dom_Calle, Maestra.Publ_Empresa_Nro_Calle,Maestra.Publ_Empresa_Cod_Postal,Maestra.Publ_Empresa_Depto,Maestra.Publ_Empresa_Piso
FROM gd_esquema.Maestra
WHERE Maestra.Publ_Empresa_Cuit IS NOT NULL);

CREATE INDEX DomiciliosPorCalleYNro
    ON CLAVE_MOTOR.Domicilio (domi_calle,domi_nro);
GO

----------------------------------------------------------------------------
/*
* Los clientes son los compradores en el sistema. Se les asigna su usuario previamente creado.
*/
PRINT 'Tabla Clientes'
GO

CREATE TABLE CLAVE_MOTOR.Cliente (
	clie_id int IDENTITY(1,1) PRIMARY KEY,
	clie_idUsuario int REFERENCES CLAVE_MOTOR.Usuario NOT NULL,
	clie_tipoDocumento nvarchar(30) NOT NULL,
	clie_documento nvarchar(50) NOT NULL,
	clie_nombre nvarchar(50),
	clie_apellido nvarchar(50),
	clie_fechaNacimiento datetime,
	clie_mail nvarchar(100),
	clie_telefono nvarchar(50),
	clie_idDomicilio int REFERENCES CLAVE_MOTOR.Domicilio,
	)
GO

PRINT 'INSERT Cliente'
GO

/*
* 
*/
INSERT INTO CLAVE_MOTOR.Cliente (clie_idUsuario,clie_tipoDocumento,clie_documento,clie_nombre,clie_apellido,clie_fechaNacimiento,
		clie_mail,clie_idDomicilio)
		(SELECT DISTINCT (SELECT Usuario.usua_id
				FROM CLAVE_MOTOR.Usuario
				WHERE Usuario.usua_username = CLAVE_MOTOR.FX_USERNAME_CLIENTE(M.Cli_Nombre,M.Cli_Apeliido)),
				'DNI',
				M.Cli_Dni,
				M.Cli_Nombre,
				M.Cli_Apeliido,
				M.Cli_Fecha_Nac,
				M.Cli_Mail,
				(SELECT Domicilio.domi_id FROM CLAVE_MOTOR.Domicilio 
				WHERE Domicilio.domi_calle = M.Cli_Dom_Calle AND Domicilio.domi_nro = M.Cli_Nro_Calle)
		FROM gd_esquema.Maestra M
		WHERE M.Cli_Dni IS NOT NULL
		UNION
		SELECT DISTINCT (SELECT Usuario.usua_id
				FROM CLAVE_MOTOR.Usuario
				WHERE Usuario.usua_username = CLAVE_MOTOR.FX_USERNAME_CLIENTE(M.Publ_Cli_Nombre,M.Publ_Cli_Apeliido)),
				'DNI',
				M.Publ_Cli_Dni,
				M.Publ_Cli_Nombre,
				M.Publ_Cli_Apeliido,
				M.Publ_Cli_Fecha_Nac,
				M.Publ_Cli_Mail,
				(SELECT D.domi_id FROM CLAVE_MOTOR.Domicilio D
				WHERE D.domi_calle = M.Publ_Cli_Dom_Calle AND D.domi_nro = M.Publ_Cli_Nro_Calle)
		FROM gd_esquema.Maestra M
		WHERE M.Publ_Cli_Dni IS NOT NULL);

CREATE INDEX UsuariosPorApellidoYNombre
	ON CLAVE_MOTOR.Cliente(clie_apellido,clie_nombre);

/*
* Se insertan las asignaciones de rol a los usuarios de los clientes
*/
insert into CLAVE_MOTOR.Asignaciones([usua_id],[idRol])
(SELECT clie_idUsuario,2 FROM CLAVE_MOTOR.cliente )
---------------------------------------------------------------------------

PRINT 'Tabla Rubro'
GO
CREATE TABLE CLAVE_MOTOR.Rubro (
	rubr_id int IDENTITY(1,1) PRIMARY KEY,
	rubr_descripcionCorta nvarchar(30) NOT NULL,
	rubr_descripcionLarga nvarchar(100) NOT NULL,
	)
GO

PRINT 'INSERT Rubro'
GO
INSERT INTO CLAVE_MOTOR.Rubro (rubr_descripcionCorta, rubr_descripcionLarga)
(SELECT DISTINCT Publicacion_Rubro_Descripcion, ('Sin Descripcion')
FROM gd_esquema.Maestra);
---------------------------------------------------------------------------



PRINT 'Tabla Empresa'
GO

CREATE TABLE CLAVE_MOTOR.Empresa (
	empr_id int IDENTITY(1,1) PRIMARY KEY,
	empr_idUsuario int REFERENCES CLAVE_MOTOR.Usuario NOT NULL,
	empr_CUIT nvarchar(50) NOT NULL,
	empr_razonSocial nvarchar(50),
	empr_nombreContacto nvarchar(50),
	empr_rubroPrincipal int REFERENCES CLAVE_MOTOR.Rubro,
	empr_mail nvarchar(100),
	empr_telefono nvarchar(50),
	empr_idDomicilio int REFERENCES CLAVE_MOTOR.Domicilio,
	)
GO

PRINT 'INSERT Empresa'
GO
/*
* Se insertan las empresas con sus usuarios y domicilios correspondientes.
* Ademas se elige que el rubro de la empresa, sea el rubro sobre el cual mas
* publicaciones hizo
*/
INSERT INTO CLAVE_MOTOR.Empresa (empr_idUsuario,empr_CUIT,empr_razonSocial,empr_nombreContacto,
		empr_rubroPrincipal,empr_mail,empr_idDomicilio)
		(SELECT DISTINCT (SELECT Usuario.usua_id
				FROM CLAVE_MOTOR.Usuario
				WHERE Usuario.usua_username = CLAVE_MOTOR.FX_USERNAME_EMPRESA(M.Publ_Empresa_Razon_Social)),
				M.Publ_Empresa_Cuit,
				M.Publ_Empresa_Razon_Social,
				null,
				(SELECT TOP 1 R.rubr_id
					FROM gd_esquema.Maestra M2 JOIN CLAVE_MOTOR.Rubro R ON R.rubr_descripcionCorta = M2.Publicacion_Rubro_Descripcion 
					WHERE M2.Publ_Empresa_Cuit = M.Publ_Empresa_Cuit
					GROUP BY R.rubr_id
					ORDER BY COUNT(*) DESC),
				M.Publ_Empresa_Mail,
				(SELECT D.domi_id FROM CLAVE_MOTOR.Domicilio D
				WHERE D.domi_calle = M.Publ_Empresa_Dom_Calle AND D.domi_nro = M.Publ_Empresa_Nro_Calle)
		FROM gd_esquema.Maestra M
		WHERE M.Publ_Empresa_Cuit IS NOT NULL);


---------------------------------------------------------------------------

PRINT 'Tabla VISIBILIDAD'
GO
/*
* Se crean las visibilidades existentes en el sistema.
* Para poder mantener los codigos actuales de cada una,
* se deshabilita el checkeo de identity manual.
* Luego se vuelve a habilitar que solo permita autogenerado.
*/
CREATE TABLE CLAVE_MOTOR.Visibilidad (
	visi_id int IDENTITY(1,1) PRIMARY KEY,
	visi_descripcion nvarchar(50) NOT NULL,
	visi_precioPublicar numeric(18, 2),
	visi_precioVenta numeric(18, 2),
	visi_precioEnvio numeric(18, 2),
	visi_permitirEnvio bit DEFAULT 1
	)
GO

SET IDENTITY_INSERT CLAVE_MOTOR.Visibilidad ON;
GO


INSERT INTO CLAVE_MOTOR.Visibilidad (visi_id,visi_descripcion,visi_precioPublicar,visi_precioVenta,visi_precioEnvio)
	(SELECT DISTINCT M.Publicacion_Visibilidad_Cod, M.Publicacion_Visibilidad_Desc,M.Publicacion_Visibilidad_Porcentaje,M.Publicacion_Visibilidad_Precio,0
	FROM gd_esquema.Maestra M);

UPDATE CLAVE_MOTOR.Visibilidad
SET visi_permitirEnvio = 0
WHERE visi_descripcion = 'Gratis'


SET IDENTITY_INSERT CLAVE_MOTOR.Visibilidad OFF;
GO


---------------------------------------------------------------------------

/*
* Las publicaciones pueden ser de tipo Compra Directa o Subasta.
* Para el codigo de las publicaciones existentes en el sistema se usara el mismo
* que tenian para mantener consistencia. Los de las nuevas seran autogenerados.
* 
*/

PRINT 'Tabla Publicacion'
GO

CREATE TABLE CLAVE_MOTOR.Publicacion (
	publ_id int IDENTITY(1,1) PRIMARY KEY,
	publ_descripcion nvarchar(50) NOT NULL,
	publ_stock int NOT NULL,
	publ_fechaInicio datetime NOT NULL,
	publ_fechaVencimiento datetime NOT NULL,
	publ_precio numeric(18, 2) NOT NULL,
	publi_costo numeric(18, 2) DEFAULT 0,
	publ_tipo VARCHAR(30) NOT NULL,
	publ_estado VARCHAR(30),
	publ_idVisibilidad int REFERENCES CLAVE_MOTOR.Visibilidad NOT NULL,
	publ_idUsuario int REFERENCES CLAVE_MOTOR.Usuario,
	publ_idRubro int REFERENCES CLAVE_MOTOR.Rubro NOT NULL,
	publ_aceptaPreguntas bit DEFAULT 1,
	publ_aceptaEnvio bit DEFAULT 0,
	)
GO

PRINT 'INSERT Publicacion'

SET IDENTITY_INSERT CLAVE_MOTOR.Publicacion ON;

INSERT INTO CLAVE_MOTOR.Publicacion (publ_id,publ_descripcion,publ_stock,publ_fechaInicio,publ_fechaVencimiento,
		publ_precio,publ_tipo,publ_estado,publ_idVisibilidad,publ_idUsuario,publ_idRubro)
	(SELECT DISTINCT M.Publicacion_Cod,M.Publicacion_Descripcion,M.Publicacion_Stock,M.Publicacion_Fecha,M.Publicacion_Fecha_Venc,
		M.Publicacion_Precio,
		M.Publicacion_Tipo,
		'Finalizada',
		M.Publicacion_Visibilidad_Cod,
		(SELECT U.usua_id
		FROM CLAVE_MOTOR.Usuario U
		WHERE U.usua_username = CLAVE_MOTOR.FX_USERNAME_EMPRESA(M.Publ_Empresa_Razon_Social)),
		(SELECT R.rubr_id
		FROM CLAVE_MOTOR.Rubro R
		WHERE R.rubr_descripcionCorta = M.Publicacion_Rubro_Descripcion)
	FROM gd_esquema.Maestra M
	WHERE M.Publ_Empresa_Cuit IS NOT NULL);
GO

INSERT INTO CLAVE_MOTOR.Publicacion (publ_id,publ_descripcion,publ_stock,publ_fechaInicio,publ_fechaVencimiento,
		publ_precio,publ_tipo,publ_estado,publ_idVisibilidad,publ_idUsuario,publ_idRubro)
	(SELECT DISTINCT M.Publicacion_Cod,M.Publicacion_Descripcion,M.Publicacion_Stock,M.Publicacion_Fecha,M.Publicacion_Fecha_Venc,
		M.Publicacion_Precio,
		M.Publicacion_Tipo,
		'Finalizada',
		M.Publicacion_Visibilidad_Cod,
		(SELECT U.usua_id
		FROM CLAVE_MOTOR.Usuario U
		WHERE U.usua_username = CLAVE_MOTOR.FX_USERNAME_EMPRESA(M.Publ_Empresa_Razon_Social)),/*NULL*/
		(SELECT R.rubr_id
		FROM CLAVE_MOTOR.Rubro R
		WHERE R.rubr_descripcionCorta = M.Publicacion_Rubro_Descripcion)
	FROM gd_esquema.Maestra M
	WHERE NOT EXISTS(SELECT P.publ_id
			FROM CLAVE_MOTOR.Publicacion P
			WHERE P.publ_id = M.Publicacion_Cod)
	AND M.Publ_Empresa_Cuit IS NULL);
                       
CREATE INDEX PublicacionPorPubliUsuario
    ON CLAVE_MOTOR.Publicacion (publ_id,publ_idUsuario);
GO

CREATE INDEX PublicacionPorPubliEnvio
    ON CLAVE_MOTOR.Publicacion (publ_id,publ_aceptaEnvio);
GO

SET IDENTITY_INSERT CLAVE_MOTOR.Publicacion OFF;
---------------------------------------------------------------------------

PRINT 'Tabla Compra'
GO
CREATE TABLE CLAVE_MOTOR.Compra (
	comp_id int IDENTITY(1,1) PRIMARY KEY,
	comp_fecha datetime NOT NULL,
	comp_cantidad int NOT NULL,
	comp_idPublicacion int REFERENCES CLAVE_MOTOR.Publicacion NOT NULL,
	comp_idUsuario int REFERENCES CLAVE_MOTOR.Usuario NOT NULL
	)
GO

/*
* Recordar que las publicaciones se migran con el mismo codigo que tenian. Se puede insertar directamente en 
* la compra
*/
PRINT 'INSERT Compra'
GO

INSERT INTO CLAVE_MOTOR.Compra(comp_fecha,comp_cantidad,comp_idPublicacion,comp_idUsuario)
	(SELECT M.Compra_Fecha,
		M.Compra_Cantidad,
		M.Publicacion_Cod,
		(SELECT U.usua_id
		FROM CLAVE_MOTOR.Usuario U
		WHERE U.usua_username = CLAVE_MOTOR.FX_USERNAME_CLIENTE(M.Cli_Nombre,M.Cli_Apeliido))
	FROM gd_esquema.Maestra M
	WHERE M.Compra_Cantidad IS NOT NULL);

CREATE INDEX CompraPorPubliUsuarioFecha
    ON CLAVE_MOTOR.Compra ([comp_idPublicacion],[comp_idUsuario],[comp_fecha]);
GO

---------------------------------------------------------------------------

PRINT 'Tabla Oferta'
GO

CREATE TABLE CLAVE_MOTOR.Oferta (
	ofer_id int IDENTITY(1,1) PRIMARY KEY,
	ofer_fecha datetime NOT NULL,
	ofer_monto numeric(18, 2) NOT NULL,
	ofer_idPublicacion int REFERENCES CLAVE_MOTOR.Publicacion NOT NULL,
	ofer_idUsuario int REFERENCES CLAVE_MOTOR.Usuario NOT NULL
	)
GO

PRINT 'INSERT Oferta'

INSERT INTO CLAVE_MOTOR.Oferta (ofer_fecha,ofer_monto,ofer_idPublicacion,ofer_idUsuario)
	(SELECT M.Oferta_Fecha,
		M.Oferta_Monto,
		M.Publicacion_Cod,
		(SELECT U.usua_id
		FROM CLAVE_MOTOR.Usuario U
		WHERE U.usua_username = CLAVE_MOTOR.FX_USERNAME_CLIENTE(M.Publ_Cli_Nombre,M.Publ_Cli_Apeliido))
	FROM gd_esquema.Maestra M
	WHERE M.Oferta_Fecha IS NOT NULL AND M.Publ_Cli_Nombre IS NOT NULL
	UNION
	SELECT M.Oferta_Fecha,
		M.Oferta_Monto,
		M.Publicacion_Cod,
		(SELECT U.usua_id
		FROM CLAVE_MOTOR.Usuario U
		WHERE U.usua_username = CLAVE_MOTOR.FX_USERNAME_CLIENTE(M.Cli_Nombre,M.Cli_Apeliido))
	FROM gd_esquema.Maestra M
	WHERE M.Oferta_Fecha IS NOT NULL AND M.Cli_Nombre IS NOT NULL);

---------------------------------------------------------------------------

PRINT 'Tabla Calificacion'
GO
CREATE TABLE CLAVE_MOTOR.Calificacion (
	cali_id int IDENTITY(1,1) PRIMARY KEY,
	cali_cantEstrellas int NOT NULL,
	cali_descripcion nvarchar(250),
	cali_idCompra int REFERENCES CLAVE_MOTOR.Compra,
	cali_idOferta int REFERENCES CLAVE_MOTOR.Oferta,
	cali_idUsuario int REFERENCES CLAVE_MOTOR.Usuario NOT NULL
	)
GO

PRINT 'INSERT Calificacion'
GO

SET IDENTITY_INSERT CLAVE_MOTOR.Calificacion ON;
GO

CREATE FUNCTION CLAVE_MOTOR.FX_GET_ID_CLIENTE(@dni int)
RETURNS INT
AS BEGIN
DECLARE @id int
SELECT @id = U.usua_id
	FROM CLAVE_MOTOR.Usuario U, CLAVE_MOTOR.Cliente C
	WHERE U.usua_username = CLAVE_MOTOR.FX_USERNAME_CLIENTE(C.clie_nombre,C.clie_apellido)
	AND C.clie_documento = @dni
RETURN @id
END
GO

CREATE FUNCTION CLAVE_MOTOR.FX_GET_IDCOMPRA(@codpubli int,@idcliente int,@fecha datetime)
RETURNS INT
AS BEGIN
DECLARE @idcompra int
SELECT @idcompra = C.comp_id
	FROM CLAVE_MOTOR.Compra C
	WHERE C.comp_idPublicacion = @codpubli
	AND C.comp_fecha = @fecha
	AND C.comp_idUsuario = @idcliente
RETURN @idcompra
END
GO

CREATE FUNCTION CLAVE_MOTOR.FX_GET_IDOFERTA(@codpubli int,@idcliente int,@fecha datetime)
RETURNS INT
AS BEGIN
DECLARE @idoferta int
SELECT @idoferta= O.ofer_id
	FROM CLAVE_MOTOR.Oferta O
	WHERE O.ofer_idPublicacion = @codpubli
	AND  O.ofer_fecha = @fecha
	AND  O.ofer_idUsuario = @idcliente
RETURN @idoferta
END
GO

INSERT INTO CLAVE_MOTOR.Calificacion (cali_id,cali_cantEstrellas, cali_descripcion,cali_idCompra,cali_idUsuario)
	(SELECT DISTINCT M.Calificacion_Codigo,
	M.Calificacion_Cant_Estrellas,
	M.Calificacion_Descripcion,
	CLAVE_MOTOR.FX_GET_IDCOMPRA(M.Publicacion_Cod,CLAVE_MOTOR.FX_GET_ID_CLIENTE(M.Cli_Dni),M.Compra_Fecha),
	CLAVE_MOTOR.FX_GET_ID_CLIENTE(M.Cli_Dni)
	FROM gd_esquema.Maestra M
	WHERE M.Calificacion_Codigo IS NOT NULL
	AND M.Publicacion_Tipo = 'Compra Inmediata');
GO

INSERT INTO CLAVE_MOTOR.Calificacion (cali_id,cali_cantEstrellas, cali_descripcion,cali_idCompra,cali_idUsuario)
	(SELECT DISTINCT M.Calificacion_Codigo,
	M.Calificacion_Cant_Estrellas,
	M.Calificacion_Descripcion,
	CLAVE_MOTOR.FX_GET_IDOFERTA(M.Publicacion_Cod,CLAVE_MOTOR.FX_GET_ID_CLIENTE(M.Cli_Dni),M.Compra_Fecha),
	CLAVE_MOTOR.FX_GET_ID_CLIENTE(M.Cli_Dni)
	FROM gd_esquema.Maestra M
	WHERE M.Calificacion_Codigo IS NOT NULL
	AND M.Publicacion_Tipo = 'Subasta');
GO

SET IDENTITY_INSERT CLAVE_MOTOR.Calificacion OFF;
GO
	/*
	(SELECT	c.comp_id
		WHERE M.Calificacion_Codigo IS NOT NULL
		AND C.comp_fecha = M.Publicacion_Fecha
		AND C.comp_idPublicacion = M.Publicacion_Cod
		AND C.comp_idUsuario = (SELECT U.usua_id
								FROM CLAVE_MOTOR.Usuario U
								WHERE U.usua_username = CLAVE_MOTOR.FX_USERNAME_CLIENTE(M.Cli_Nombre,M.Cli_Apeliido))),
	C.comp_idUsuario*/
	/*(SELECT U.usua_id
		FROM CLAVE_MOTOR.Usuario U
		WHERE U.usua_username = CLAVE_MOTOR.FX_USERNAME_CLIENTE(M.Cli_Nombre,M.Cli_Apeliido))
	FROM gd_esquema.Maestra M RIGHT JOIN CLAVE_MOTOR.Compra C ON M.Publicacion_Cod = C.comp_idPublicacion
	WHERE M.Calificacion_Codigo IS NOT NULL)
	*/
---------------------------------------------------------------------------
PRINT 'Tabla MEDIOPAGO'
GO

CREATE TABLE CLAVE_MOTOR.MedioPago (
	medi_id int IDENTITY(1,1) PRIMARY KEY,
	medi_descripcion nvarchar(50) NOT NULL,
	)
GO

INSERT INTO [CLAVE_MOTOR].[MedioPago](medi_descripcion)
VALUES('Efectivo')
GO

---------------------------------------------------------------------------
PRINT 'Tabla FACTURA'
GO

CREATE TABLE CLAVE_MOTOR.Factura (
	fact_id int IDENTITY(1,1) PRIMARY KEY,
	fact_fecha datetime NOT NULL,
	fact_total numeric(18, 2) NOT NULL,
	fact_idMedioPago int REFERENCES CLAVE_MOTOR.MedioPago NOT NULL,
	fact_idUsuario int REFERENCES CLAVE_MOTOR.Usuario NOT NULL
	)
GO

---------------------------------------------------------------------------
PRINT 'Tabla ITEMFACTURA'
GO

CREATE TABLE CLAVE_MOTOR.ItemFactura (
	item_id int IDENTITY(1,1) PRIMARY KEY,
	item_monto numeric(18, 2) NOT NULL,
	item_cantidad int NOT NULL,
	item_descripcion nvarchar(150) NOT NULL,
	item_idFactura int REFERENCES CLAVE_MOTOR.Factura NOT NULL,
	item_idPublicacion int REFERENCES CLAVE_MOTOR.Publicacion NOT NULL
	)
GO

SET IDENTITY_INSERT CLAVE_MOTOR.Factura ON;
GO

PRINT 'INSERT FACTURA'
GO

INSERT INTO CLAVE_MOTOR.Factura ([fact_id],[fact_fecha],[fact_total],[fact_idMedioPago],[fact_idUsuario])
(SELECT DISTINCT [Factura_Nro],
		[Factura_Fecha],
		[Factura_Total],
		1,
		(SELECT E.empr_idUsuario FROM CLAVE_MOTOR.Empresa E WHERE empr_razonSocial = M.[Publ_Empresa_Razon_Social])
	FROM gd_esquema.Maestra M
	WHERE m.[Factura_Nro] IS NOT NULL
	AND M.[Publ_Empresa_Razon_Social] IS NOT NULL)

SET IDENTITY_INSERT CLAVE_MOTOR.Factura OFF;
GO

PRINT 'INSERT ITEMFACTURA'
GO

CREATE PROCEDURE CLAVE_MOTOR.MIGRACION_FACTURAS
AS BEGIN
DECLARE C_ITEMS CURSOR FOR (SELECT [Publicacion_Precio],[Publicacion_Visibilidad_Porcentaje],[Publicacion_Visibilidad_Precio],[Item_Factura_Monto],
								[Item_Factura_Cantidad],[Factura_Nro],[Publicacion_Cod]
								FROM gd_esquema.Maestra M
								WHERE M.Publ_Empresa_Razon_Social IS NOT NULL
								AND M.[Factura_Nro] is not null)
OPEN C_ITEMS
DECLARE @PRECIO numeric
DECLARE @PORCENTAJE numeric 
DECLARE @VISIPRECIO numeric 
DECLARE @MONTOITEM numeric 
DECLARE @CANTIDAD INT 
DECLARE @IDFACTURA INT
DECLARE @IDPUBLICACION INT
DECLARE @DESCRIPCION VARCHAR(150)

FETCH NEXT FROM C_ITEMS INTO @PRECIO,@PORCENTAJE,@VISIPRECIO,@MONTOITEM,@CANTIDAD,@IDFACTURA,@IDPUBLICACION 
WHILE(@@FETCH_STATUS = 0)
BEGIN 

	IF(@VISIPRECIO = @MONTOITEM)
	BEGIN
		SET @DESCRIPCION = 'Comision por publicacion. Publicacion: '+ CONVERT(VARCHAR(12),@IDPUBLICACION)
	END
	IF(@PRECIO * @PORCENTAJE* @CANTIDAD = @MONTOITEM)
	BEGIN
		SET @DESCRIPCION = 'Comision por Productos. Publicacion: '+ CONVERT(VARCHAR(12),@IDPUBLICACION)
	END

	INSERT INTO CLAVE_MOTOR.ItemFactura([item_monto],[item_cantidad],[item_descripcion],[item_idFactura],[item_idPublicacion])
		VALUES(@MONTOITEM,@CANTIDAD,@DESCRIPCION,@IDFACTURA,@IDPUBLICACION)

	FETCH NEXT FROM C_ITEMS INTO @PRECIO,@PORCENTAJE,@VISIPRECIO,@MONTOITEM,@CANTIDAD,@IDFACTURA,@IDPUBLICACION 
END
CLOSE C_ITEMS
DEALLOCATE C_ITEMS
END
GO

EXEC CLAVE_MOTOR.MIGRACION_FACTURAS;

---------------------------------------------------------------------------

PRINT 'PROCEDURE ACTUALIZAR INTENTOS '
GO

/*
 * sp_MODIFINTENTOS actualiza la cantidad de intentos de inicio de sesion consecutivos de un
 * Usuario que fallaron.
 */
CREATE PROCEDURE [CLAVE_MOTOR].[sp_ACTINTENTOS] (@USERNAME NVARCHAR(20),@INTENTOS INT)
AS
BEGIN
	UPDATE CLAVE_MOTOR.Usuario
	SET usua_intentosLogin = @INTENTOS
	WHERE usua_username = @USERNAME;
END
GO

PRINT 'PROCEDURE LOGIN'
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_LOGIN (@USERNAME NVARCHAR(20), @PASS NVARCHAR(65))
AS
BEGIN

	DECLARE @INTENTOS INT
	DECLARE @USER NVARCHAR(20)
	SET @USER = @USERNAME
	
	SET @INTENTOS = (SELECT usua_intentosLogin FROM CLAVE_MOTOR.Usuario WHERE usua_username=@USERNAME)
	IF (@USERNAME IN (SELECT usua_username FROM CLAVE_MOTOR.USUARIO))
		IF ((SELECT usua_username FROM CLAVE_MOTOR.USUARIO 
			WHERE usua_username=@USERNAME AND usua_intentosLogin >2)IS NOT NULL)
			BEGIN
				SELECT 'USUARIO BLOQUEADO'
			END
		ELSE
			BEGIN
				IF ((SELECT usua_username FROM CLAVE_MOTOR.USUARIO 
					WHERE usua_username=@USERNAME AND usua_password=@PASS )IS NOT NULL)
					BEGIN
						IF (@INTENTOS <> 3)
							BEGIN
								SET @INTENTOS = 0
								EXEC CLAVE_MOTOR.sp_ACTINTENTOS @USER, @INTENTOS
							END
						SELECT rol_id FROM  CLAVE_MOTOR.ROL AS ROL JOIN  CLAVE_MOTOR.ASIGNACIONES AS ASIG ON ASIG.idRol = ROL.rol_id
								JOIN  CLAVE_MOTOR.USUARIO AS US ON ASIG.usua_id = US.usua_id
							WHERE US.usua_username = @USERNAME	
					END
				ELSE
					BEGIN
						SET @INTENTOS = @INTENTOS + '1'
						EXEC CLAVE_MOTOR.sp_ACTINTENTOS @USERNAME, @INTENTOS
						SELECT 'CONTRASEÑA INVALIDA',@intentos,@pass
					END
			END
		ELSE
		BEGIN
			SELECT 'NO EXISTE EN LA BASE'
		END
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_FUNC_ROL(@IDROL INT)
AS
BEGIN
	SELECT F.func_descripcion FROM CLAVE_MOTOR.Funcionalidad F JOIN CLAVE_MOTOR.FuncionalidadRol FUNROL ON F.func_id = FUNROL.furo_idFuncionalidad
		JOIN CLAVE_MOTOR.Rol R ON FUNROL.furo_idRol = R.rol_id
		WHERE R.rol_id = @IDROL
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_NUEVO_USUARIO(@USERNAME VARCHAR(50), @PASSWORD VARCHAR(64))
AS
BEGIN
	DECLARE @ID INT
	INSERT INTO CLAVE_MOTOR.Usuario(usua_username,usua_password)
			VALUES(@USERNAME,@PASSWORD)
	SELECT @ID=usua_id FROM CLAVE_MOTOR.Usuario WHERE usua_username = @USERNAME
	RETURN @ID
END 
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_NUEVO_CLIENTE(@USERNAME VARCHAR(50),@PASSWORD VARCHAR(64),@NOMBRE VARCHAR(50),@APELLIDO VARCHAR(50),
									@DNI VARCHAR(50),@TIPODOC VARCHAR(30),@MAIL VARCHAR(100),@DIRECCION VARCHAR(100),@FECHANAC datetime,
									@TELEFONO VARCHAR(50))
AS
BEGIN
	IF(EXISTS(SELECT 1 FROM CLAVE_MOTOR.Cliente WHERE clie_documento = @DNI AND clie_tipoDocumento = @TIPODOC))
		BEGIN
			SELECT 'Cliente ya existente en el sistema'
		END
	ELSE
		BEGIN
			DECLARE @IDUSUARIO INT
			EXECUTE @IDUSUARIO=CLAVE_MOTOR.sp_NUEVO_USUARIO @USERNAME,@PASSWORD

			INSERT INTO CLAVE_MOTOR.Asignaciones(usua_id,idRol)
				VALUES(@IDUSUARIO,(SELECT rol_id FROM CLAVE_MOTOR.Rol WHERE rol_descripcion = 'Cliente'));

			INSERT INTO CLAVE_MOTOR.Cliente (clie_idUsuario,clie_tipoDocumento,clie_documento,clie_nombre,clie_apellido,clie_fechaNacimiento,
			clie_mail,clie_idDomicilio,clie_telefono)
				VALUES (@IDUSUARIO,@TIPODOC,@DNI,@NOMBRE,@APELLIDO,@FECHANAC,@MAIL,1,@TELEFONO);

			SELECT 'CLIENTE CREADO'
		END
END
GO


CREATE PROCEDURE CLAVE_MOTOR.sp_UPDATE_CLIENTE(@NOMBRE VARCHAR(50),@APELLIDO VARCHAR(50),
									@DNI VARCHAR(50),@TIPODOC VARCHAR(30),@MAIL VARCHAR(100),@DIRECCION VARCHAR(100),@FECHANAC datetime,
									@TELEFONO VARCHAR(50),@ID INT)
AS
BEGIN
	UPDATE CLAVE_MOTOR.Cliente 
	SET clie_nombre=@NOMBRE, clie_apellido=@APELLIDO,
		clie_fechaNacimiento=@FECHANAC, clie_mail=@MAIL, clie_telefono=@TELEFONO, clie_documento = @DNI, clie_tipoDocumento = @TIPODOC
	WHERE clie_id = @ID;
	SELECT 'CLIENTE ACTUALIZADO'
END
GO

PRINT 'PROCEDURE EMPRESA ACTUALIZAR'
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_UPDATE_EMPRESA(@MAIL VARCHAR(50),@TELEFONO VARCHAR(50),
									@CALLE VARCHAR(50),@NRO VARCHAR(30),@PISO VARCHAR(100),@DEPTO VARCHAR(10),@LOCALIDAD VARCHAR(30),
									@CP VARCHAR(10),@CONTACTO VARCHAR(30),@RUBRO INT,@CUIT VARCHAR(50),@RAZONSOCIAL varchar(50),@ID INT)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE CLAVE_MOTOR.Empresa
			SET empr_razonSocial=@RAZONSOCIAL, [empr_CUIT]=@CUIT, [empr_mail]=@MAIL, [empr_telefono]=@TELEFONO, [empr_nombreContacto]=@CONTACTO,
			empr_rubroPrincipal=@RUBRO
			WHERE empr_id = @ID

			UPDATE CLAVE_MOTOR.Domicilio
			SET domi_calle=@CALLE,domi_nro=@NRO,domi_piso=@PISO,domi_depto=@DEPTO,domi_localidad=@LOCALIDAD,domi_codPostal=@CP

			SELECT 'EMPRESA ACTUALIZADA'
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF(ERROR_PROCEDURE()='TR_DUPLICADO_EMPRESA')
		BEGIN 
			ROLLBACK TRANSACTION
			SELECT 'EMPRESA DUPLICADA'
		END
	END CATCH

END
GO

PRINT 'PROCEDURE EMPRESA CREAR'
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_CREAR_EMPRESA(@MAIL VARCHAR(50),@TELEFONO VARCHAR(50),
									@CALLE VARCHAR(50),@NRO INT,@PISO INT,@DEPTO VARCHAR(10),@LOCALIDAD VARCHAR(30),
									@CP VARCHAR(10),@CONTACTO VARCHAR(30),@RUBRO INT,@CUIT VARCHAR(50),@RAZONSOCIAL varchar(50),
									@USER VARCHAR(50),@PASSWORD VARCHAR(50))
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			/*DOMICILIO*/
			INSERT INTO CLAVE_MOTOR.Domicilio
			(domi_calle,domi_nro,domi_piso,domi_depto,domi_localidad,domi_codPostal)
			VALUES(@CALLE,@NRO,@PISO,@DEPTO,@LOCALIDAD,@CP)
			DECLARE @ID_DOMI INT 
			SELECT @ID_DOMI = SCOPE_IDENTITY()

			/*USUARIO Y ASIGNACION*/
			INSERT INTO CLAVE_MOTOR.Usuario (usua_username, usua_password)
					VALUES (@USER, CLAVE_MOTOR.FX_HASH_PASSWORD(@PASSWORD))
			DECLARE @ID_USUARIO INT 
			SELECT @ID_USUARIO = SCOPE_IDENTITY()

			INSERT INTO CLAVE_MOTOR.Asignaciones (usua_id,idRol)
					VALUES(@ID_USUARIO,(SELECT rol_id FROM [CLAVE_MOTOR].[Rol] WHERE rol_descripcion = 'Empresa'));

			/*EMPRESA*/
			INSERT INTO CLAVE_MOTOR.Empresa
			(empr_idUsuario,empr_razonSocial, [empr_CUIT], [empr_mail], [empr_telefono], [empr_nombreContacto],empr_rubroPrincipal,empr_idDomicilio)
			VALUES (@ID_USUARIO,@RAZONSOCIAL,@CUIT,@MAIL,@TELEFONO,@CONTACTO,@RUBRO,@ID_DOMI)
			

			SELECT 'EMPRESA CREADA'
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF(ERROR_PROCEDURE()='TR_DUPLICADO_EMPRESA')
			SELECT 'EMPRESA DUPLICADA'
		ELSE
		SELECT ERROR_MESSAGE()
		ROLLBACK TRANSACTION
	END CATCH

END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_ELIMINAR_EMPRESA(@ID INT)
AS 
BEGIN
	UPDATE CLAVE_MOTOR.Usuario
	SET usua_habilitado = 0
	WHERE usua_id = (SELECT empr_idUsuario FROM CLAVE_MOTOR.Empresa E WHERE E.[empr_id] = @ID)
	SELECT 'EMPRESA DESHABILITADA'
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_ELIMINAR_CLIENTE(@ID INT)
AS 
BEGIN
	UPDATE CLAVE_MOTOR.Usuario
	SET usua_habilitado = 0
	WHERE usua_id = (SELECT clie_idUsuario FROM CLAVE_MOTOR.Cliente C WHERE C.[clie_id] = @ID)
	SELECT 'CLIENTE DESHABILITADO'
END
GO


CREATE TRIGGER CLAVE_MOTOR.TR_DUPLICADO_EMPRESA
ON CLAVE_MOTOR.Empresa
AFTER UPDATE,INSERT AS
BEGIN
	IF(EXISTS(SELECT 1 FROM CLAVE_MOTOR.Empresa E
				WHERE E.EMPR_CUIT IS NOT NULL
				GROUP BY E.EMPR_CUIT, E.EMPR_RAZONSOCIAL
				HAVING COUNT(*)>1))
		ROLLBACK TRANSACTION
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_UPDATE_VISIBILIDAD(@ID INT,@NOMBRE VARCHAR(50),@PRECIOPORPUBLI FLOAT,@PRECIOPORPROD FLOAT,
													@PRECIOPORENVIO FLOAT,@PERMITIRENVIO BIT)
AS
BEGIN
	UPDATE CLAVE_MOTOR.Visibilidad
	SET visi_descripcion = @NOMBRE,visi_precioEnvio=@PRECIOPORENVIO,visi_precioPublicar=@PRECIOPORPUBLI,visi_precioVenta=@PRECIOPORPROD,
	visi_permitirEnvio = @PERMITIRENVIO
	WHERE visi_id=@ID
	SELECT 'VISIBILIDAD ACTUALIZADA'
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_CREAR_VISIBILIDAD(@NOMBRE VARCHAR(50),@PRECIOPORPUBLI FLOAT,@PRECIOPORPROD FLOAT,
													@PRECIOPORENVIO FLOAT,@PERMITIRENVIO BIT)
AS
BEGIN
	INSERT INTO CLAVE_MOTOR.Visibilidad
	(visi_descripcion,visi_precioEnvio,visi_precioPublicar,visi_precioVenta,visi_permitirEnvio)
	VALUES(@NOMBRE,@PRECIOPORENVIO,@PRECIOPORPUBLI,@PRECIOPORPROD,@PERMITIRENVIO)
	SELECT 'VISIBILIDAD CREADA'
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_ELIMINAR_VISIBILIDAD(@ID INT)
AS
BEGIN
	DELETE CLAVE_MOTOR.Visibilidad
	WHERE visi_id=@ID
	SELECT 'VISIBILIDAD ELIMINADA'
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_NUEVA_PUBLICACION(@NOMBRE VARCHAR(50),@STOCK INT,@FECHAVENCIMIENTO DATETIME,@FECHAINICIO DATETIME,@PRECIO NUMERIC(18,2),
											 @RUBRO INT, @VISIBILIDAD INT, @VENDEDOR INT, @ESTADO VARCHAR(30),@TIPO VARCHAR(30),@ACEPTAPREGUNTAS BIT,
											@ACEPTAENVIO BIT)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO CLAVE_MOTOR.Publicacion([publ_descripcion],[publ_stock],[publ_fechaVencimiento],[publ_fechaInicio],[publ_precio],[publ_tipo],
								[publ_estado],[publ_idVisibilidad],[publ_idUsuario],[publ_idRubro],[publ_aceptaPreguntas],[publ_aceptaEnvio],[publi_costo])
			VALUES(@NOMBRE,@STOCK,@FECHAVENCIMIENTO,@FECHAINICIO,@PRECIO,@TIPO,@ESTADO,@VISIBILIDAD,@VENDEDOR,@RUBRO,@ACEPTAPREGUNTAS,@ACEPTAENVIO,
				(SELECT visi_precioPublicar FROM CLAVE_MOTOR.Visibilidad WHERE visi_id = @VISIBILIDAD));

			SELECT'PUBLICACION CREADA'
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()
		ROLLBACK TRANSACTION
	END CATCH
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_UPDATE_PUBLICACION(@NOMBRE VARCHAR(50),@STOCK INT,@FECHAVENCIMIENTO DATETIME,@FECHAINICIO DATETIME,@PRECIO NUMERIC(18,2),
											@RUBRO INT, @VISIBILIDAD INT, @VENDEDOR INT, @ESTADO VARCHAR(30),@TIPO VARCHAR(30),@ACEPTAPREGUNTAS BIT,
											@ACEPTAENVIO BIT,@ID INT)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE CLAVE_MOTOR.Publicacion
			SET [publ_descripcion]=@NOMBRE,[publ_stock]=@STOCK,[publ_fechaVencimiento]=@FECHAVENCIMIENTO,[publ_fechaInicio]=@FECHAINICIO,
			[publ_precio]=@PRECIO,[publ_tipo]=@TIPO,
								[publ_estado]=@ESTADO,[publ_idVisibilidad]=@VISIBILIDAD,[publ_idUsuario]=@VENDEDOR
								,[publ_idRubro]=@RUBRO,[publ_aceptaPreguntas]=@ACEPTAPREGUNTAS,[publ_aceptaEnvio]=@ACEPTAENVIO
			WHERE publ_id = @ID

			SELECT 'PUBLICACION ACTUALIZADA'
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()
		ROLLBACK TRANSACTION
	END CATCH
END
GO


CREATE PROCEDURE CLAVE_MOTOR.sp_GENERAR_FACTURA_POR_COMPRA(@IDCOMPRA INT,@FECHA DATETIME)
AS
BEGIN
	DECLARE @ID INT
	DECLARE @TOTAL INT
	DECLARE @PRECIOENVIO DECIMAL
	DECLARE @PRECIOPORPRODUCTOS DECIMAL
	DECLARE @CANTIDAD INT
	DECLARE @IDPUBLICACION INT

	SELECT	@PRECIOPORPRODUCTOS = V.visi_precioVenta, @CANTIDAD = C.comp_cantidad, @PRECIOENVIO = V.visi_precioEnvio, @IDPUBLICACION = P.publ_id
	FROM CLAVE_MOTOR.Compra C JOIN CLAVE_MOTOR.Publicacion P ON P.publ_id = C.comp_idPublicacion
	JOIN CLAVE_MOTOR.Visibilidad V ON P.publ_idVisibilidad = V.visi_id
	WHERE C.comp_id = @IDCOMPRA

	SET @TOTAL = @PRECIOPORPRODUCTOS * @CANTIDAD

	IF(EXISTS(SELECT 1 FROM CLAVE_MOTOR.Publicacion WHERE publ_id = @IDPUBLICACION AND publ_aceptaEnvio = 1))
		BEGIN
			SET @TOTAL = @TOTAL + @PRECIOENVIO
		END

	INSERT INTO CLAVE_MOTOR.Factura([fact_fecha],[fact_total],[fact_idMedioPago],[fact_idUsuario])
			VALUES(@FECHA,@TOTAL,
			(SELECT medi_id FROM CLAVE_MOTOR.MedioPago WHERE medi_descripcion ='Efectivo'),
			(SELECT comp_idUsuario FROM CLAVE_MOTOR.Compra WHERE comp_id = @IDCOMPRA))

	SET	@ID = SCOPE_IDENTITY()

	/* ITEM POR PRECIO POR ENVIO */
	IF(EXISTS(SELECT 1 FROM CLAVE_MOTOR.Publicacion WHERE publ_id = @IDPUBLICACION AND publ_aceptaEnvio = 1))
		BEGIN
			INSERT INTO CLAVE_MOTOR.ItemFactura([item_monto],[item_cantidad],[item_descripcion],[item_idFactura],[item_idPublicacion])
				VALUES (@PRECIOENVIO, 1, 'Publicacion N ' + CONVERT(VARCHAR(8),@IDPUBLICACION) + 
				' : Coste de envio de Compra ' + CONVERT(VARCHAR(8),@IDCOMPRA),@ID,@IDPUBLICACION)
		END

/* ITEM POR PRECIO POR PRODUCTO */
	INSERT INTO CLAVE_MOTOR.ItemFactura([item_monto],[item_cantidad],[item_descripcion],[item_idFactura],[item_idPublicacion])
				VALUES (@PRECIOPORPRODUCTOS, @CANTIDAD, 'Publicacion N ' + CONVERT(VARCHAR(12),@IDPUBLICACION) + 
				' : Coste de venta de productos de Compra ' + CONVERT(VARCHAR(12),@IDCOMPRA),@ID,@IDPUBLICACION)

	RETURN @ID
END 
GO


CREATE PROCEDURE CLAVE_MOTOR.sp_CHECK_STOCK_PUBLICACION(@ID INT)
AS
BEGIN
	UPDATE CLAVE_MOTOR.Publicacion
	SET publ_estado='Finalizada'
	WHERE publ_id=@ID AND publ_stock=0
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_NUEVA_COMPRA(@FECHA DATETIME,@CANTIDAD INT, @PUBLICACION INT, @USUARIO INT)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			/*Nueva compra*/
			INSERT INTO CLAVE_MOTOR.Compra([comp_fecha],[comp_cantidad],[comp_idPublicacion],[comp_idUsuario])
			VALUES(@FECHA,@CANTIDAD,@PUBLICACION,@USUARIO);

			/*Hago las facturas*/
			DECLARE @IDFACTURA INT
			DECLARE @IDCOMPRA INT
			SET @IDCOMPRA = SCOPE_IDENTITY()
			EXECUTE @IDFACTURA=CLAVE_MOTOR.sp_GENERAR_FACTURA_POR_COMPRA @IDCOMPRA,@FECHA

			/*Actualizo el stock*/
			UPDATE CLAVE_MOTOR.Publicacion
			SET publ_stock = publ_stock - @CANTIDAD
			WHERE publ_id = @PUBLICACION

			/*Fijarse si hay que finalizar la publicacion*/
			EXECUTE CLAVE_MOTOR.sp_CHECK_STOCK_PUBLICACION @PUBLICACION

			SELECT 'COMPRA CREADA' AS 'RESULT',@IDFACTURA AS 'IDFACTURA'
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()
		ROLLBACK TRANSACTION
	END CATCH
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_NUEVA_OFERTA(@FECHA DATETIME,@MONTO INT, @PUBLICACION INT, @USUARIO INT)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO CLAVE_MOTOR.Oferta([ofer_fecha],[ofer_monto],[ofer_idPublicacion],[ofer_idUsuario])
			VALUES(@FECHA,@MONTO,@PUBLICACION,@USUARIO);

			UPDATE CLAVE_MOTOR.Publicacion
			SET publ_precio = @MONTO
			WHERE publ_id = @PUBLICACION

			SELECT'OFERTA CREADA'
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()
		ROLLBACK TRANSACTION
	END CATCH
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_CALIFICACIONES_PENDIENTES(@IDUSUARIO INT)
AS
BEGIN
	DECLARE @PENDCOMPRAS INT
	DECLARE @PENDOFERTAS INT

	SELECT @PENDCOMPRAS = COUNT(comp_id) FROM CLAVE_MOTOR.COMPRA WHERE comp_idUsuario = @IDUSUARIO
	AND NOT EXISTS(SELECT 1 FROM CLAVE_MOTOR.Calificacion WHERE cali_idCompra = comp_id)

	SELECT @PENDOFERTAS = COUNT(ofer_id) FROM CLAVE_MOTOR.Oferta O JOIN CLAVE_MOTOR.Publicacion P 
		ON O.ofer_idPublicacion=P.publ_id 
		WHERE ofer_idUsuario = @IDUSUARIO
		AND O.ofer_monto = P.publ_precio
		AND NOT EXISTS(SELECT 1 FROM CLAVE_MOTOR.Calificacion WHERE cali_idOferta = ofer_id)

	SELECT @PENDCOMPRAS + @PENDOFERTAS
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_PROMEDIO_ESTRELLAS(@IDUSUARIO INT)
AS
BEGIN
	SELECT AVG(cali_cantEstrellas) FROM CLAVE_MOTOR.Calificacion WHERE cali_idUsuario = @IDUSUARIO
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_ESTRELLAS_CALIFICACION_SUBASTAS(@IDUSUARIO INT)
AS
BEGIN
	SELECT C1.cali_cantEstrellas AS 'Estrellas',COUNT(*) AS 'Cantidad' FROM CLAVE_MOTOR.Calificacion C1
	WHERE C1.cali_idUsuario = @IDUSUARIO
	AND C1.cali_idOferta IS NOT NULL
	GROUP BY cali_cantEstrellas
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_ESTRELLAS_CALIFICACION_COMPRAS(@IDUSUARIO INT)
AS
BEGIN
	SELECT C1.cali_cantEstrellas AS 'Estrellas',COUNT(*) AS 'Cantidad' FROM CLAVE_MOTOR.Calificacion C1
	WHERE C1.cali_idUsuario = @IDUSUARIO
	AND C1.cali_idCompra IS NOT NULL
	GROUP BY cali_cantEstrellas
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_CALIFICACION_RECIENTES(@IDUSUARIO INT)
AS
BEGIN
	SELECT TOP 5 cali_idCompra AS 'Compra',[cali_idOferta] AS 'Subasta',[cali_cantEstrellas] AS 'Estrellas',[cali_descripcion] AS 'Descripcion' FROM CLAVE_MOTOR.Calificacion C1
	WHERE C1.cali_idUsuario = @IDUSUARIO
	ORDER BY cali_id DESC
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_CALIFICACION_PENDIENTES(@IDUSUARIO INT)
AS
BEGIN
	SELECT [comp_id] AS 'ID','Compra' AS 'Operacion',[comp_fecha] AS 'Fecha',[comp_cantidad] AS 'Cantidad',[comp_idPublicacion] AS 'Publicacion',P.publ_descripcion AS 'Descripcion'
	FROM CLAVE_MOTOR.Compra C
	JOIN CLAVE_MOTOR.Publicacion P ON C.comp_idPublicacion = P.publ_id
	WHERE comp_idUsuario = @IDUSUARIO
	AND NOT EXISTS(SELECT 1 FROM CLAVE_MOTOR.Calificacion WHERE cali_idCompra = C.comp_id)
	UNION
	SELECT [ofer_id] AS 'ID','Subasta' AS 'Operacion',[ofer_fecha] AS 'Fecha',[ofer_monto] AS 'Cantidad',[ofer_idPublicacion] AS 'Publicacion',P.publ_descripcion AS 'Descripcion'
	FROM CLAVE_MOTOR.Oferta O
	JOIN CLAVE_MOTOR.Publicacion P ON O.ofer_idPublicacion = P.publ_id
	WHERE [ofer_idUsuario] = @IDUSUARIO
	AND NOT EXISTS(SELECT 1 FROM CLAVE_MOTOR.Calificacion WHERE cali_idOferta = O.ofer_id)
	AND P.publ_precio = O.ofer_monto
	AND P.publ_estado = 'Finalizada'
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_CALIFICAR_COMPRA(@ESTRELLAS INT, @DESCRIPCION VARCHAR(250),@IDCOMPRA INT, @IDUSUARIO INT)
AS
BEGIN
	INSERT INTO CLAVE_MOTOR.Calificacion([cali_cantEstrellas],[cali_descripcion],[cali_idCompra],[cali_idUsuario])
		VALUES(@ESTRELLAS,@DESCRIPCION,@IDCOMPRA,@IDUSUARIO)

	SELECT 'CALIFICACION CREADA'
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_CALIFICAR_SUBASTA(@ESTRELLAS INT, @DESCRIPCION VARCHAR(250),@IDOFERTA INT, @IDUSUARIO INT)
AS
BEGIN
	INSERT INTO CLAVE_MOTOR.Calificacion([cali_cantEstrellas],[cali_descripcion],[cali_idOferta],[cali_idUsuario])
		VALUES(@ESTRELLAS,@DESCRIPCION,@IDOFERTA,@IDUSUARIO)

	SELECT 'CALIFICACION CREADA'
END
GO

/*
* SP para el vencimiento de las publicaciones por cambio de fecha de sistema
*/

CREATE PROCEDURE CLAVE_MOTOR.sp_FECHA_DE_SISTEMA(@FECHASISTEMA Datetime)
AS
BEGIN
	DECLARE @FECHADATE DATETIME
	SET @FECHADATE = @FECHASISTEMA

	DECLARE C_PUBLICACIONES CURSOR FOR (SELECT DISTINCT publ_id FROM CLAVE_MOTOR.Publicacion
									WHERE publ_fechaVencimiento < @FECHADATE
									AND publ_estado <> 'Finalizada')
	OPEN C_PUBLICACIONES
	DECLARE @PUBLICACION INT
	FETCH NEXT FROM C_PUBLICACIONES INTO @PUBLICACION
	WHILE (@@FETCH_STATUS = 0)
	BEGIN 
	/*PRINT 'ESTO SE EJECUTAAAAAAAAAAAAAAAAAAAAAAAAAAA'*/
		EXECUTE CLAVE_MOTOR.sp_FINALIZAR_PUBLICACION @PUBLICACION

		FETCH NEXT FROM C_PUBLICACIONES INTO @PUBLICACION
	END
	CLOSE C_PUBLICACIONES
	DEALLOCATE C_PUBLICACIONES
END
GO

CREATE PROCEDURE CLAVE_MOTOR.sp_FINALIZAR_PUBLICACION(@ID INT)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @TOTAL INT
			DECLARE @PRECIOENVIO DECIMAL
			DECLARE @PRECIOPORPRODUCTOS DECIMAL
			DECLARE @CANTIDAD INT
			Declare @PRECIO DECIMAL

			DECLARE @IDOFERTA INT
			DECLARE @IDFACTURA INT

			UPDATE CLAVE_MOTOR.Publicacion
			SET publ_estado = 'Finalizada'
			WHERE publ_id = @ID

			IF((SELECT publ_tipo FROM CLAVE_MOTOR.Publicacion WHERE publ_id = @ID
				AND EXISTS (SELECT 1 FROM CLAVE_MOTOR.Oferta WHERE ofer_idPublicacion= @ID)) = 'Subasta')
			BEGIN
				SELECT	@PRECIOPORPRODUCTOS = V.visi_precioVenta, @CANTIDAD = P.publ_stock, @PRECIOENVIO = V.visi_precioEnvio,@PRECIO=P.publ_precio
				FROM CLAVE_MOTOR.Publicacion P JOIN CLAVE_MOTOR.Visibilidad V ON P.publ_idVisibilidad = V.visi_id
				WHERE P.publ_id = @ID
				SET @TOTAL = @PRECIOPORPRODUCTOS * @CANTIDAD * @PRECIO

				SELECT @IDOFERTA = OFER_ID FROM CLAVE_MOTOR.Oferta O JOIN CLAVE_MOTOR.Publicacion P ON O.ofer_idPublicacion = P.publ_id
				WHERE O.ofer_monto = P.publ_precio
				
				IF(EXISTS(SELECT 1 FROM CLAVE_MOTOR.Publicacion WHERE publ_id = @ID AND publ_aceptaEnvio = 1))
				BEGIN
					SET @TOTAL = @TOTAL + @PRECIOENVIO
				END

				INSERT INTO CLAVE_MOTOR.Factura([fact_fecha],[fact_total],[fact_idMedioPago],[fact_idUsuario])
					VALUES(GETDATE(),@TOTAL,
					(SELECT medi_id FROM CLAVE_MOTOR.MedioPago WHERE medi_descripcion ='Efectivo'),
					(SELECT ofer_idUsuario FROM CLAVE_MOTOR.Oferta WHERE ofer_id = @IDOFERTA))

				SET @IDFACTURA = SCOPE_IDENTITY()

				IF(EXISTS(SELECT 1 FROM CLAVE_MOTOR.Publicacion WHERE publ_id = @ID AND publ_aceptaEnvio = 1))
				BEGIN
					INSERT INTO CLAVE_MOTOR.ItemFactura([item_monto],[item_cantidad],[item_descripcion],[item_idFactura],[item_idPublicacion])
						VALUES (@PRECIOENVIO, 1, 'Publicacion N ' + CONVERT(VARCHAR(8),@ID) + 
						' : Coste de envio de Subasta :' + CONVERT(VARCHAR(8),@IDOFERTA),@IDFACTURA,@ID)
				END

				/* ITEM POR PRECIO POR PRODUCTO */
				INSERT INTO CLAVE_MOTOR.ItemFactura([item_monto],[item_cantidad],[item_descripcion],[item_idFactura],[item_idPublicacion])
							VALUES (@PRECIOPORPRODUCTOS*@PRECIO, @CANTIDAD, 'Publicacion N ' + CONVERT(VARCHAR(12),@ID) + 
							' : Coste de venta de productos de Subasta: ' + CONVERT(VARCHAR(12),@IDOFERTA),@IDFACTURA,@ID)

			END

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()
		ROLLBACK TRANSACTION
	END CATCH

END
GO

PRINT 'CONSTRAINTS'
GO

ALTER TABLE CLAVE_MOTOR.FuncionalidadRol ADD CONSTRAINT fk_Func_IDFunc
FOREIGN KEY (furo_idFuncionalidad) REFERENCES CLAVE_MOTOR.Funcionalidad(func_id)
GO

/*ALTER TABLE CLAVE_MOTOR.FuncionalidadRol ADD CONSTRAINT fk_Func_IDRol
FOREIGN KEY (furo_idRol) REFERENCES CLAVE_MOTOR.Rol(rol_id)*/

ALTER TABLE CLAVE_MOTOR.ItemFactura ADD CONSTRAINT fk_Func_ItemFactura
FOREIGN KEY (item_idFactura) REFERENCES CLAVE_MOTOR.Factura(fact_id)
GO

ALTER TABLE CLAVE_MOTOR.Factura ADD CONSTRAINT fk_Fact_IDMediPago
FOREIGN KEY (fact_idMedioPago) REFERENCES CLAVE_MOTOR.MedioPago(medi_id)
GO

ALTER TABLE CLAVE_MOTOR.Factura ADD CONSTRAINT fk_Fact_IDUsuario
FOREIGN KEY (fact_idUsuario) REFERENCES CLAVE_MOTOR.Usuario(usua_id)
GO

ALTER TABLE CLAVE_MOTOR.Publicacion ADD CONSTRAINT fk_Publ_idVisibilidad
FOREIGN KEY (publ_idVisibilidad) REFERENCES CLAVE_MOTOR.Visibilidad(visi_id)
GO

ALTER TABLE CLAVE_MOTOR.Publicacion ADD CONSTRAINT fk_Publ_idUsuario
FOREIGN KEY (publ_idUsuario) REFERENCES CLAVE_MOTOR.Usuario(usua_id)
GO

ALTER TABLE CLAVE_MOTOR.Publicacion ADD CONSTRAINT fk_Publ_IDRubro
FOREIGN KEY (publ_idRubro) REFERENCES CLAVE_MOTOR.Rubro(rubr_id)
GO

/*ALTER TABLE CLAVE_MOTOR.Usuario ADD CONSTRAINT fk_Usu_IDRol
FOREIGN KEY (usua_idRol) REFERENCES CLAVE_MOTOR.Rol(rol_id)*/

ALTER TABLE CLAVE_MOTOR.Empresa ADD CONSTRAINT fk_Emp_IDUsuario
FOREIGN KEY (empr_idUsuario) REFERENCES CLAVE_MOTOR.Usuario(usua_id)
GO

ALTER TABLE CLAVE_MOTOR.Empresa ADD CONSTRAINT fk_Emp_IDDomicilio
FOREIGN KEY (empr_idDomicilio) REFERENCES CLAVE_MOTOR.Domicilio(domi_id)
GO

ALTER TABLE CLAVE_MOTOR.Cliente ADD CONSTRAINT fk_Clie_IDUsuario
FOREIGN KEY (clie_idUsuario) REFERENCES CLAVE_MOTOR.Usuario(usua_id)
GO

ALTER TABLE CLAVE_MOTOR.Cliente ADD CONSTRAINT fk_Clie_IDDomicilio
FOREIGN KEY (clie_idDomicilio) REFERENCES CLAVE_MOTOR.Domicilio(domi_id)
GO

ALTER TABLE CLAVE_MOTOR.Oferta ADD CONSTRAINT fk_Ofer_IDPublicacion
FOREIGN KEY (ofer_idPublicacion) REFERENCES CLAVE_MOTOR.Publicacion(publ_id)
GO

ALTER TABLE CLAVE_MOTOR.Oferta ADD CONSTRAINT fk_Oferta_IDUsuario
FOREIGN KEY (ofer_idUsuario) REFERENCES CLAVE_MOTOR.Usuario(usua_id)
GO

ALTER TABLE CLAVE_MOTOR.Compra ADD CONSTRAINT fk_Comp_IDUsuario
FOREIGN KEY (comp_idUsuario) REFERENCES CLAVE_MOTOR.Usuario(usua_id)
GO

ALTER TABLE CLAVE_MOTOR.Compra ADD CONSTRAINT fk_Comp_IDPublicacion
FOREIGN KEY (comp_idPublicacion) REFERENCES CLAVE_MOTOR.Publicacion(publ_id)
GO

ALTER TABLE CLAVE_MOTOR.Calificacion ADD CONSTRAINT fk_Cali_IDUsuario
FOREIGN KEY (cali_idUsuario) REFERENCES CLAVE_MOTOR.Usuario(usua_id)
GO

ALTER TABLE CLAVE_MOTOR.Calificacion ADD CONSTRAINT fk_Cali_IDCompra
FOREIGN KEY (cali_idCompra) REFERENCES CLAVE_MOTOR.Compra(comp_id)
GO