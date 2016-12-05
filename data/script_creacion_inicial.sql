USE [GD2C2016]
GO

--DROP SCHEMA HELLFISH
--GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE SCHEMA HELLFISH AUTHORIZATION gd
GO

-- Drop de constraints existentes

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_AgendaProfesional_ProfesionalEspecialidad') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.AgendaProfesional DROP CONSTRAINT FK_AgendaProfesional_ProfesionalEspecialidad
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_VentaDeBonos_Afiliado') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.VentaDeBonos DROP CONSTRAINT FK_VentaDeBonos_Afiliado
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_VentaDeBonos_PlanMedico') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.VentaDeBonos DROP CONSTRAINT FK_VentaDeBonos_PlanMedico
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_CambioDePlan_Afiliado') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.CambioDePlan DROP CONSTRAINT FK_CambioDePlan_Afiliado
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_CambioDePlan_PlanMedico') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.CambioDePlan DROP CONSTRAINT FK_CambioDePlan_PlanMedico
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_CambioDePlan_PlanMedicoOrigen') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.CambioDePlan DROP CONSTRAINT FK_CambioDePlan_PlanMedicoOrigen
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_RolFuncionalidad_Funcionalidad') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.RolFuncionalidad DROP CONSTRAINT FK_RolFuncionalidad_Funcionalidad
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_RolFuncionalidad_Rol') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.RolFuncionalidad DROP CONSTRAINT FK_RolFuncionalidad_Rol
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Usuario_Persona') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Usuario DROP CONSTRAINT FK_Usuario_Persona
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_UsuarioRol_Rol') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.UsuarioRol DROP CONSTRAINT FK_UsuarioRol_Rol
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_UsuarioRol_Usuario') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.UsuarioRol DROP CONSTRAINT FK_UsuarioRol_Usuario
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Bono_VentaDeBonos') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Bono DROP CONSTRAINT FK_Bono_VentaDeBonos
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Bono_GrupoFamiliar') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Bono DROP CONSTRAINT FK_Bono_GrupoFamiliar
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Bono_PlanMedico') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Bono DROP CONSTRAINT FK_Bono_PlanMedico
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_BonoConsulta_Bono') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.BonoConsulta DROP CONSTRAINT FK_BonoConsulta_Bono
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_BonoConsulta_Consulta') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.BonoConsulta DROP CONSTRAINT FK_BonoConsulta_Consulta
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Consulta_Turno') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Consulta DROP CONSTRAINT FK_Consulta_Turno
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Cancelacion_TipoCancelacion') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Cancelacion DROP CONSTRAINT FK_Cancelacion_TipoCancelacion
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Cancelacion_Turno') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Cancelacion DROP CONSTRAINT FK_Cancelacion_Turno
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Turno_Afiliado') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Turno DROP CONSTRAINT FK_Turno_Afiliado
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Turno_ProfesionalEspecialidad') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Turno DROP CONSTRAINT FK_Turno_ProfesionalEspecialidad
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Especialidad_TipoEspecialidad') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Especialidad DROP CONSTRAINT FK_Especialidad_TipoEspecialidad
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Profesional_Persona') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Profesional DROP CONSTRAINT FK_Profesional_Persona
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_ProfesionalEspecialidad_Especialidad') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.ProfesionalEspecialidad DROP CONSTRAINT FK_ProfesionalEspecialidad_Especialidad
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_ProfesionalEspecialidad_Profesional') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.ProfesionalEspecialidad DROP CONSTRAINT FK_ProfesionalEspecialidad_Profesional
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Afilidado_EstadoCivil') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Afiliado DROP CONSTRAINT FK_Afilidado_EstadoCivil
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Afilidado_GrupoFamiliar') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Afiliado DROP CONSTRAINT FK_Afilidado_GrupoFamiliar
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Afilidado_Persona') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Afiliado DROP CONSTRAINT FK_Afilidado_Persona
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Afilidado_PlanMedico') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Afiliado DROP CONSTRAINT FK_Afilidado_PlanMedico
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Persona_TipoDocumento') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Persona DROP CONSTRAINT FK_Persona_TipoDocumento
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_Persona_TipoPersona') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.Persona DROP CONSTRAINT FK_Persona_TipoPersona
GO

-- Drop de tablas existentes

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.AgendaProfesional') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.AgendaProfesional
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.VentaDeBonos') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.VentaDeBonos
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.CambioDePlan') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.CambioDePlan
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.Funcionalidad') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.Funcionalidad
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.RolFuncionalidad') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.RolFuncionalidad
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.Rol') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.Rol
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.Usuario') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.Usuario
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.UsuarioRol') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.UsuarioRol
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.Bono') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.Bono
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.BonoConsulta') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.BonoConsulta
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.Consulta') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.Consulta
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.Cancelacion') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.Cancelacion
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.TipoCancelacion') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.TipoCancelacion
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.Turno') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.Turno
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.PlanMedico') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.PlanMedico
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.TipoEspecialidad') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.TipoEspecialidad
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.Especialidad') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.Especialidad
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.Profesional') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.Profesional
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.TipoDocumento') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.TipoDocumento
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.TipoPersona') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.TipoPersona
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.EstadoCivil') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.EstadoCivil
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.GrupoFamiliar') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.GrupoFamiliar
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.ProfesionalEspecialidad') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.ProfesionalEspecialidad
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.Afiliado') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.Afiliado
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.Persona') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.Persona
GO

-- Drop de Stored Procedures de migracion de datos existentes

-- Drop de funciones existentes

-- Drop de indices existentes

-- Creacion de tablas
------------------------------------------------------------------------
PRINT 'Tabla Funcionalidades'
GO

CREATE TABLE HELLFISH.Funcionalidad (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	descripcion varchar(255) NOT NULL
)
GO

PRINT 'INSERT Funcionalidades'
GO

INSERT INTO HELLFISH.Funcionalidad (descripcion) VALUES('ABM de Rol');
INSERT INTO HELLFISH.Funcionalidad (descripcion) VALUES('ABM de Usuarios');
INSERT INTO HELLFISH.Funcionalidad (descripcion) VALUES('ABM de Afiliado');
INSERT INTO HELLFISH.Funcionalidad (descripcion) VALUES('ABM de Profesional');
INSERT INTO HELLFISH.Funcionalidad (descripcion) VALUES('ABM Especialidades Medicas');
INSERT INTO HELLFISH.Funcionalidad (descripcion) VALUES('ABM de Planes');
INSERT INTO HELLFISH.Funcionalidad (descripcion) VALUES('Registrar Agenda');
INSERT INTO HELLFISH.Funcionalidad (descripcion) VALUES('Compra de Bonos');
INSERT INTO HELLFISH.Funcionalidad (descripcion) VALUES('Pedir Turno');
INSERT INTO HELLFISH.Funcionalidad (descripcion) VALUES('Registro de llegada para atencion medica');
INSERT INTO HELLFISH.Funcionalidad (descripcion) VALUES('Registro de resultado para atencion medica');
INSERT INTO HELLFISH.Funcionalidad (descripcion) VALUES('Cancelar atencion medica');
INSERT INTO HELLFISH.Funcionalidad (descripcion) VALUES('Listado estadistico');
------------------------------------------------------------------------
PRINT 'Tabla Rol'
GO

CREATE TABLE HELLFISH.Rol (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	descripcion varchar(255) NOT NULL,
	alta bit DEFAULT 1 NOT NULL
)
GO

PRINT 'INSERT Rol'
GO

INSERT INTO HELLFISH.Rol(descripcion) values ('Administrador');
INSERT INTO HELLFISH.Rol(descripcion) values ('Afiliado');
INSERT INTO HELLFISH.Rol(descripcion) values ('Profesional');
GO
------------------------------------------------------------------------
PRINT 'Tabla RolFuncionalidad'
GO

CREATE TABLE HELLFISH.RolFuncionalidad (
	idRol int NOT NULL,
	idFuncionalidad int NOT NULL
)
GO

PRINT 'INSERT RolFuncionalidad'
/*
* El rol Administrador lleva todas las funciones del sistema
*/
INSERT INTO HELLFISH.RolFuncionalidad(idFuncionalidad,idRol)
	(SELECT F.id, R.id
	FROM HELLFISH.Funcionalidad F, HELLFISH.Rol R
	WHERE R.descripcion = 'Administrador'
	AND (F.descripcion = 'ABM de Rol'
	OR F.descripcion = 'ABM de Usuarios'
	OR F.descripcion = 'ABM de Afiliado'
	OR F.descripcion = 'ABM de Profesional'
	OR F.descripcion = 'ABM Especialidades Medicas'
	OR F.descripcion = 'ABM de Planes'
	OR F.descripcion = 'Registro de llegada para atencion medica'
	OR F.descripcion = 'Listado Estadistico'));


INSERT INTO HELLFISH.RolFuncionalidad (idFuncionalidad,idRol)
	(SELECT F.id, R.id
	FROM HELLFISH.Funcionalidad F, HELLFISH.Rol R
	WHERE R.descripcion = 'Afiliado'
	AND (F.descripcion = 'Compra de Bonos'
	OR F.descripcion = 'Pedir Turno'
	OR F.descripcion = 'Cancelar atencion medica'));

INSERT INTO HELLFISH.RolFuncionalidad (idFuncionalidad,idRol)
	(SELECT F.id, R.id
	FROM HELLFISH.Funcionalidad F, HELLFISH.Rol R
	WHERE R.descripcion = 'Profesional'
	AND (F.descripcion = 'Registrar Agenda'
	OR F.descripcion = 'Registro de resultado para atencion medica'
	OR F.descripcion = 'Cancelar atencion medica'));
------------------------------------------------------------------------
PRINT 'TABLA TipoCancelacion'
GO

CREATE TABLE HELLFISH.TipoCancelacion (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	deAfiliado bit NOT NULL,
	descripcion varchar(255) NOT NULL
)
GO

PRINT 'INSERT TipoCancelacion'
GO

insert into HELLFISH.TipoCancelacion (deAfiliado,descripcion)
	values (1,'Ya no necesita el servicio'),
			(1,'Ha encontrado otro servicio alternativo'),
			(1,'La atención al cliente no ha cubierto sus expectativas'),
			(1,'No puede asistir por un problema personal'),
			(1,'Otro motivo')
GO
------------------------------------------------------------------------
PRINT 'TABLA PLAN Medico'
GO

CREATE TABLE HELLFISH.PlanMedico (
	id numeric(18) NOT NULL,
	descripcion varchar(255) NOT NULL,
	precioBonoConsulta numeric(18) NOT NULL,
	precioBonoFarmacia numeric(18) NOT NULL
)
GO

PRINT 'INSERT PLAN Medico'
GO

insert into HELLFISH.PlanMedico (id, descripcion, precioBonoConsulta, precioBonoFarmacia)
	(select distinct(Plan_Med_Codigo), Plan_Med_Descripcion, Plan_Med_Precio_Bono_Consulta, Plan_Med_Precio_Bono_Farmacia
	from gd_esquema.Maestra where Plan_Med_Codigo is not null);


PRINT 'TABLA Tipo Especialidad'
GO
------------------------------------------------------------------------
CREATE TABLE HELLFISH.TipoEspecialidad (
	id numeric(18) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	descripcion varchar(255) NOT NULL
)
GO

PRINT 'INSERT Tipo Especialidad'
GO

SET IDENTITY_INSERT HELLFISH.TipoEspecialidad ON

insert into HELLFISH.TipoEspecialidad (id, descripcion)
	select distinct(Tipo_Especialidad_Codigo), Tipo_Especialidad_Descripcion from gd_esquema.Maestra
	where Tipo_Especialidad_Codigo is not null;

SET IDENTITY_INSERT HELLFISH.TipoEspecialidad OFF
------------------------------------------------------------------------
PRINT 'TABLA Especialidad'
GO

CREATE TABLE HELLFISH.Especialidad (
	id numeric(18) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	descripcion varchar(255) NOT NULL,
	tipo numeric(18) NOT NULL
)
GO

SET IDENTITY_INSERT HELLFISH.Especialidad ON

insert into HELLFISH.Especialidad (id, descripcion, tipo)
	(select distinct Especialidad_Codigo, Especialidad_Descripcion, Tipo_Especialidad_Codigo
	from gd_esquema.Maestra where Especialidad_Codigo is not null and Tipo_Especialidad_Codigo is not null);

SET IDENTITY_INSERT HELLFISH.Especialidad OFF

------------------------------------------------------------------------
PRINT 'TABLA TipoDocumento'
GO

CREATE TABLE HELLFISH.TipoDocumento (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	descripcion char(20) NOT NULL
)
GO

PRINT 'Insert TIPODocumento'
GO

INSERT INTO HELLFISH.TipoDocumento(descripcion)
	VALUES ('DNI');

------------------------------------------------------------------------
PRINT 'TABLA TIPOPERSONA'
GO

CREATE TABLE HELLFISH.TipoPersona (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	descripcion varchar(11) NOT NULL
)
GO

PRINT 'INSERT TIPOPERSONA'
GO

INSERT INTO HELLFISH.TipoPersona(descripcion)
	VALUES ('Afiliado'),('Profesional'),('Admin');

CREATE TABLE HELLFISH.EstadoCivil (
	descripcion char(20) NOT NULL,
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL
)
GO

INSERT INTO HELLFISH.EstadoCivil(descripcion)
	VALUES ('Soltero'),('Casado'),('Viudo'),('Concubinato'),('Divorciado');

------------------------------------------------------------------------
CREATE TABLE HELLFISH.ProfesionalEspecialidad (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idProfesional int NOT NULL,
	especialidad numeric(18) NOT NULL
)
GO
------------------------------------------------------------------------

PRINT 'TABLA Usuario'
GO

CREATE TABLE HELLFISH.Usuario (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	username varchar(255) UNIQUE NOT NULL,
	password varchar(64) NOT NULL,
	intentosFallidos smallint DEFAULT 0 NOT NULL,
	alta bit DEFAULT 1 NOT NULL
)
GO

PRINT 'INSERT Usuario'

INSERT INTO HELLFISH.Usuario (username, password, intentosFallidos, alta)
	values ('admin', HASHBYTES('SHA2_256', CONVERT(varchar(255), 'w23e')), 0, 1);

CREATE TABLE HELLFISH.UsuarioRol (
	idUsuario int NOT NULL,
	idRol int NOT NULL,
	alta bit DEFAULT 1
)
GO
------------------------------------------------------------------------
PRINT 'TABLA PROFESIONAL'
GO
CREATE TABLE HELLFISH.Profesional (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idUsuario int references hellfish.usuario not null,
	nroMatricula numeric(18),
	nombre varchar(255) NOT NULL,
	apellido varchar(255) NOT NULL,
	tipoDocumento int NOT NULL,
	numeroDocumento numeric(18) NOT NULL,
	direccion varchar(255) NOT NULL,
	telefono numeric(18) NOT NULL,
	email varchar(255) NOT NULL,
	fechaNacimiento datetime NOT NULL,
	sexo char(1) default 'M' NOT NULL
)
GO
insert into HELLFISH.Usuario(username,password,intentosFallidos,alta)
(SELECT DISTINCT CONVERT(varchar(18),Medico_Dni,1),'password',0,1 from gd_esquema.Maestra WHERE Medico_Dni IS NOT NULL);

INSERT INTO HELLFISH.Profesional(NOMBRE,apellido,tipoDocumento,numeroDocumento,direccion,telefono,email,fechaNacimiento,idUsuario)
(SELECT DISTINCT Medico_Nombre, Medico_Apellido,1,Medico_Dni,Medico_Direccion,Medico_Telefono,Medico_Mail,Medico_Fecha_Nac,(select id from HELLFISH.Usuario U where CONVERT(varchar(18),Medico_Dni,1) = U.username) FROM gd_esquema.Maestra
	WHERE Medico_Dni IS NOT NULL);

insert into HELLFISH.ProfesionalEspecialidad(idProfesional,especialidad)
(select distinct (select id from HELLFISH.Profesional where numeroDocumento=Medico_Dni),Especialidad_Codigo from gd_esquema.Maestra where Especialidad_Codigo is not null and Medico_Dni is not null);
------------------------------------------------------------------------
CREATE TABLE HELLFISH.GrupoFamiliar (
	nroAfiliadoBase numeric(18) NOT NULL,
	id int NOT NULL
)
GO

PRINT 'TABLA AFILIADO'
GO

CREATE TABLE HELLFISH.Afiliado (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idUsuario int references hellfish.Usuario NOT NULL,
	nombre varchar(255) NOT NULL,
	apellido varchar(255) NOT NULL,
	tipoDocumento int NOT NULL,
	numeroDocumento numeric(18) NOT NULL,
	direccion varchar(255) NOT NULL,
	telefono numeric(18) NOT NULL,
	email varchar(255) NOT NULL,
	fechaNacimiento datetime NOT NULL,
	sexo char(1) default 'M' NOT NULL,
	nroAfiliadoIntegrante numeric(2),
	planMedico numeric(18) NOT NULL,
	idEstadoCivil int,
	grupoFamiliar int NOT NULL
)
GO

PRINT 'INSERT AFILIADO'
GO

CREATE PROCEDURE HELLFISH.MIGRACION_AFILIADOS
AS BEGIN
DECLARE C_AFILIADOS CURSOR FOR (SELECT DISTINCT Paciente_Nombre, Paciente_Apellido,Paciente_Dni,Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo 
								FROM gd_esquema.Maestra
								WHERE Paciente_Dni IS NOT NULL)
OPEN C_AFILIADOS
DECLARE @grupo int
SET @grupo = 1
DECLARE @USUARIO INT
DECLARE @nombre varchar(255)
DECLARE @apellido varchar(255)
DECLARE @numeroDocumento numeric(18)
DECLARE @direccion varchar(255)
DECLARE @telefono numeric(18)
DECLARE @email varchar(255)
DECLARE @fechaNacimiento datetime
DECLARE @planMedico numeric(18)
FETCH NEXT FROM C_AFILIADOS INTO @nombre,@apellido,@numeroDocumento,@direccion,@telefono,@email,@fechaNacimiento,@planMedico
WHILE (@@FETCH_STATUS = 0)
BEGIN 
	
	Insert into hellfish.usuario(username,password,intentosFallidos,alta)
	values (CONVERT(varchar(18),@numeroDocumento,1),'password',0,1);

	SET @USUARIO = SCOPE_IDENTITY()
	insert into HELLFISH.UsuarioRol(idRol,idUsuario)
	values(2,@USUARIO);

	INSERT INTO HELLFISH.Afiliado(NOMBRE,apellido,tipoDocumento,numeroDocumento,direccion,telefono,email,fechaNacimiento,nroAfiliadoIntegrante,planMedico,idEstadoCivil,grupoFamiliar,idUsuario)
			VALUES (@nombre,@apellido,1,@numeroDocumento,@direccion,@telefono,@email,@fechaNacimiento,1,@planMedico,1,@grupo,@USUARIO);

	INSERT INTO HELLFISH.GrupoFamiliar(nroAfiliadoBase,ID)
		VALUES(SCOPE_IDENTITY(),@grupo);
	
	SET @grupo = @grupo + 1

	FETCH NEXT FROM C_AFILIADOS INTO @nombre,@apellido,@numeroDocumento,@direccion,@telefono,@email,@fechaNacimiento,@planMedico
END
CLOSE C_AFILIADOS
DEALLOCATE C_AFILIADOS
END
GO

EXEC HELLFISH.MIGRACION_AFILIADOS;
GO
------------------------------------------------------------------------

/*
CREATE TABLE HELLFISH.Persona (NOMBRE,apellido,tipoDocumento,numeroDocumento,direccion,telefono,email,fechaNacimiento
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	tipoPersona int NOT NULL
)
GO

INSERT INTO HELLFISH.Persona(NOMBRE,apellido,tipoDocumento,numeroDocumento,direccion,telefono,email,fechaNacimiento,tipoPersona)
 (SELECT DISTINCT Paciente_Nombre, Paciente_Apellido,1,Paciente_Dni,Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,1 FROM gd_esquema.Maestra
	WHERE Paciente_Dni IS NOT NULL);

INSERT INTO HELLFISH.Persona(NOMBRE,apellido,tipoDocumento,numeroDocumento,direccion,telefono,email,fechaNacimiento,tipoPersona)
 (SELECT DISTINCT Medico_Nombre, Medico_Apellido,1,Medico_Dni,Medico_Direccion,Medico_Telefono,Medico_Mail,Medico_Fecha_Nac,2 FROM gd_esquema.Maestra
	WHERE Medico_Dni IS NOT NULL);

INSERT INTO HELLFISH.Persona(NOMBRE,apellido,tipoDocumento,numeroDocumento,direccion,telefono,email,fechaNacimiento,tipoPersona)
VALUES('Admin','Admin',1,9999999,'Admin',44444444,'Admin@admin.com',GETDATE(),3);
*/

CREATE TABLE HELLFISH.Bono (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idGrupoFamiliar int NOT NULL,
	idAfiliadoConsumidor int,
	planMedico numeric(18) NOT NULL,
	fechaDeImpresion datetime NOT NULL,
	idVenta int
)
GO

CREATE TABLE HELLFISH.VentaDeBonos (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	fechaDeCompra datetime NOT NULL,
	idAfiliadoComprador int NOT NULL,
	planMedico numeric(18) NOT NULL,
	cantidadBonos int NOT NULL,
	total numeric(18) NOT NULL
)
GO
/*
INSERT INTO HELLFISH.VentaDeBonos(fechaDeCompra,idAfiliadoComprador,planMedico,cantidadBonos,total)
(SELECT Compra_Bono_Fecha,(SELECT id from hellfish.Afiliado where numeroDocumento = Paciente_Dni),Plan_Med_Codigo,1,Plan_Med_Precio_Bono_Consulta from gd_esquema.Maestra where Compra_Bono_Fecha is not null);
go

SET IDENTITY_INSERT HELLFISH.Bono ON
INSERT INTO HELLFISH.BONO(id,idGrupoFamiliar,idAfiliadoConsumidor,planMedico,fechaDeImpresion,idVenta)
(SELECT Bono_Consulta_Numero,(SELECT id from hellfish.Afiliado where numeroDocumento = Paciente_Dni),(SELECT id from hellfish.Afiliado where numeroDocumento = Paciente_Dni),
Plan_Med_Codigo,Bono_Consulta_Fecha_Impresion,(SELECT id from hellfish.VentaDeBonos where fechaDeCompra=Compra_Bono_Fecha AND idAfiliadoComprador = (SELECT ID FROM HELLFISH.Afiliado WHERE numeroDocumento=Paciente_Dni)) 
FROM gd_esquema.Maestra
WHERE Compra_Bono_Fecha IS NOT NULL);
GO

SET IDENTITY_INSERT HELLFISH.Bono OFF
GO
*/ 
CREATE PROCEDURE HELLFISH.BONOS
AS
BEGIN
SET IDENTITY_INSERT HELLFISH.Bono ON
declare @bono as numeric(18,0), @fecha_impr as datetime, @afiliado as numeric(18,0), @plan as numeric(18,0), @precio as numeric(18,0),
		@fecha_compra as datetime, @grupofamiliar as int

declare C_BONOS cursor for select distinct(Bono_Consulta_Numero), Bono_Consulta_Fecha_Impresion, (SELECT id from hellfish.Afiliado where numeroDocumento = Paciente_Dni), Plan_Med_Codigo,
								Plan_Med_Precio_Bono_Consulta, Compra_Bono_Fecha
						 from gd_esquema.Maestra where Compra_Bono_Fecha is not null

OPEN C_BONOS
FETCH NEXT FROM C_BONOS INTO @bono, @fecha_impr, @afiliado, @plan, @precio, @fecha_compra
WHILE @@fetch_status = 0
	BEGIN
			
			insert into HELLFISH.VentaDeBonos (fechaDeCompra, idAfiliadoComprador,planMedico, total, cantidadBonos)
				values (@fecha_compra,@afiliado,@plan, @precio, 1)

			insert into HELLFISH.Bono (ID, fechaDeImpresion, idAfiliadoConsumidor, planMedico, idVenta, idGrupoFamiliar)
				values (@bono, @fecha_impr, @afiliado, @plan,  SCOPE_IDENTITY(),@afiliado)

		FETCH NEXT FROM C_BONOS INTO @bono, @fecha_impr, @afiliado, @plan, @precio, @fecha_compra
	END
CLOSE C_BONOS
DEALLOCATE C_BONOS
SET IDENTITY_INSERT HELLFISH.Bono OFF

END
GO

--EXEC HELLFISH.BONOS
GO
------------------------------------------------------------------------
CREATE TABLE HELLFISH.BonoConsulta (
	id int NOT NULL,
	idConsulta int NOT NULL,
	idBono int NOT NULL
)
GO

CREATE TABLE HELLFISH.Consulta (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	sintomas varchar(255),
	enfermedades varchar(255),
	idTurno int NOT NULL,
	idBono int not null,
	finalizada int default 0 not null,
	horallegada datetime,
	horaatencion datetime
)
GO

INSERT INTO HELLFISH.CONSULTA(sintomas,enfermedades,idTurno)
(select Consulta_Sintomas,Consulta_Enfermedades,Turno_Numero from gd_esquema.Maestra
where Consulta_Sintomas is not null and Consulta_Enfermedades is not null and Turno_Numero is not null);

CREATE TABLE HELLFISH.Turno (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idProfesionalEspecialidad int NOT NULL,
	fecha datetime NOT NULL,
	afiliado int
)
GO

SET IDENTITY_INSERT HELLFISH.Turno ON
INSERT INTO HELLFISH.TURNO(ID,idProfesionalEspecialidad,fecha,afiliado)
(select DISTINCT Turno_Numero,
	(SELECT PE.ID FROM HELLFISH.ProfesionalEspecialidad PE JOIN HELLFISH.Profesional P ON PE.idProfesional = P.id 
	WHERE P.numeroDocumento=Medico_Dni AND PE.especialidad=Especialidad_Codigo),
	Turno_Fecha,(SELECT id from HELLFISH.Afiliado where numeroDocumento = Paciente_Dni) from gd_esquema.Maestra
where Turno_Numero is not null); 

SET IDENTITY_INSERT HELLFISH.Turno OFF
------------------------------------------------------------------------
CREATE TABLE HELLFISH.AgendaProfesional (
	id int NOT NULL,
	idProfesionalEspecialidad int NOT NULL,
	lunes bit DEFAULT 0 NOT NULL,
	martes bit DEFAULT 0 NOT NULL,
	miercoles bit DEFAULT 0 NOT NULL,
	jueves bit DEFAULT 0 NOT NULL,
	viernes bit DEFAULT 0 NOT NULL,
	sabado bit DEFAULT 0 NOT NULL,
	horaDesde time(7) NOT NULL,
	horaHasta time(7) NOT NULL
)
GO
------------------------------------------------------------------------
CREATE TABLE HELLFISH.Cancelacion (
	id int NOT NULL,
	descripcion varchar(255) NOT NULL,
	tipo int NOT NULL,
	turno int NOT NULL
)
GO
------------------------------------------------------------------------
CREATE TABLE HELLFISH.CambioDePlan (
	id int NOT NULL,
	idAfiliado int NOT NULL,
	planOrigen numeric(18) NOT NULL,
	planDestino numeric(18) NOT NULL,
	fecha datetime NOT NULL
)
GO