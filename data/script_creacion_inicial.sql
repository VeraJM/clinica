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
ALTER TABLE HELLFISH.PROFESIONALpecialidad DROP CONSTRAINT FK_ProfesionalEspecialidad_Especialidad
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.FK_ProfesionalProfesionalEspecialidad') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE HELLFISH.PROFESIONALpecialidad DROP CONSTRAINT FK_ProfesionalProfesionalEspecialidad
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

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('HELLFISH.PROFESIONALpecialidad') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE HELLFISH.PROFESIONALpecialidad
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
	deAfiliado bit default 1 NOT NULL,
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
	id int PRIMARY KEY NOT NULL,
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
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
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

PRINT 'TABLA EstadoCivil'
GO
CREATE TABLE HELLFISH.EstadoCivil (
	descripcion char(20) NOT NULL,
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL
)
GO

INSERT INTO HELLFISH.EstadoCivil(descripcion)
	VALUES ('Soltero'),('Casado'),('Viudo'),('Concubinato'),('Divorciado');

------------------------------------------------------------------------
CREATE TABLE HELLFISH.PROFESIONALESpecialidad (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idProfesional int NOT NULL,
	especialidad int NOT NULL
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
	values ('admin',substring(master.dbo.fn_varbintohexstr(HashBytes('SHA2_256', 'w23e')), 3, 64), 0, 1);

CREATE TABLE HELLFISH.UsuarioRol (
	idUsuario int NOT NULL,
	idRol int NOT NULL,
	alta bit DEFAULT 1
)
GO
INSERT INTO HELLFISH.UsuarioRol(idUsuario,idRol) VALUES (1,1);
GO
------------------------------------------------------------------------
PRINT 'TABLA PROFESIONAL'
GO
CREATE TABLE HELLFISH.Profesional (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idUsuario int references hellfish.usuario not null,
	nroMatricula varchar(255) default '-',
	nombre varchar(255) NOT NULL,
	apellido varchar(255) NOT NULL,
	tipoDocumento int NOT NULL,
	numeroDocumento numeric(18) unique NOT NULL,
	direccion varchar(255) NOT NULL,
	telefono numeric(18) NOT NULL,
	email varchar(255) NOT NULL,
	fechaNacimiento datetime NOT NULL,
	sexo char(50) default 'Masculino' NOT NULL
)
GO
insert into HELLFISH.Usuario(username,password,intentosFallidos,alta)
(SELECT DISTINCT CONVERT(varchar(18),Medico_Dni,1),substring(master.dbo.fn_varbintohexstr(HashBytes('SHA2_256', 'w23e')), 3, 64),0,1 from gd_esquema.Maestra WHERE Medico_Dni IS NOT NULL);

INSERT INTO HELLFISH.Profesional(NOMBRE,apellido,tipoDocumento,numeroDocumento,direccion,telefono,email,fechaNacimiento,idUsuario)
(SELECT DISTINCT Medico_Nombre, Medico_Apellido,1,Medico_Dni,Medico_Direccion,Medico_Telefono,Medico_Mail,Medico_Fecha_Nac,(select id from HELLFISH.Usuario U where CONVERT(varchar(18),Medico_Dni,1) = U.username) FROM gd_esquema.Maestra
	WHERE Medico_Dni IS NOT NULL);

INSERT INTO HELLFISH.UsuarioRol(idUsuario,idRol)
(SELECT DISTINCT idUsuario,3 FROM HELLFISH.Profesional );

insert into HELLFISH.PROFESIONALESpecialidad(idProfesional,especialidad)
(select distinct (select id from HELLFISH.Profesional where numeroDocumento=Medico_Dni),Especialidad_Codigo from gd_esquema.Maestra where Especialidad_Codigo is not null and Medico_Dni is not null);
------------------------------------------------------------------------
CREATE TABLE HELLFISH.GrupoFamiliar (
	nroAfiliadoBase numeric(18) NOT NULL,
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL
)
GO

PRINT 'TABLA AFILIADO'
GO

CREATE TABLE HELLFISH.Afiliado (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idUsuario int references hellfish.Usuario NOT NULL,
	nombre varchar(255) NOT NULL,
	apellido varchar(255) NOT NULL,
	tipoDocumento VARCHAR(50) NOT NULL,
	numeroDocumento numeric(18,0) unique NOT NULL,
	direccion varchar(255) NOT NULL,
	telefono numeric(18) NOT NULL,
	email varchar(255) NOT NULL,
	fechaNacimiento datetime NOT NULL,
	sexo char(50) default 'Masculino' NOT NULL,
	nroAfiliadoIntegrante numeric(2),
	planMedico int NOT NULL,
	idEstadoCivil int,
	grupoFamiliar int,
	habilitado bit default 1,
	fechaBaja datetime, /* TODO: posiblemente borrar */
	cantHijosFamiliares int default 0
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
SET IDENTITY_INSERT HELLFISH.GrupoFamiliar ON
FETCH NEXT FROM C_AFILIADOS INTO @nombre,@apellido,@numeroDocumento,@direccion,@telefono,@email,@fechaNacimiento,@planMedico
WHILE (@@FETCH_STATUS = 0)
BEGIN 
	
	Insert into hellfish.usuario(username,password,intentosFallidos,alta)
	values (CONVERT(varchar(18),@numeroDocumento,1),substring(master.dbo.fn_varbintohexstr(HashBytes('SHA2_256', 'w23e')), 3, 64),0,1);

	SET @USUARIO = SCOPE_IDENTITY()
	insert into HELLFISH.UsuarioRol(idRol,idUsuario)
	values(2,@USUARIO);

	INSERT INTO HELLFISH.Afiliado(NOMBRE,apellido,tipoDocumento,numeroDocumento,direccion,telefono,email,fechaNacimiento,nroAfiliadoIntegrante,planMedico,idEstadoCivil,grupoFamiliar,idUsuario)
			VALUES (@nombre,@apellido,'DNI',@numeroDocumento,@direccion,@telefono,@email,@fechaNacimiento,1,@planMedico,1,@grupo,@USUARIO);

	INSERT INTO HELLFISH.GrupoFamiliar(nroAfiliadoBase,ID)
		VALUES(SCOPE_IDENTITY(),@grupo);
	
	SET @grupo = @grupo + 1

	FETCH NEXT FROM C_AFILIADOS INTO @nombre,@apellido,@numeroDocumento,@direccion,@telefono,@email,@fechaNacimiento,@planMedico
END
CLOSE C_AFILIADOS
DEALLOCATE C_AFILIADOS
SET IDENTITY_INSERT HELLFISH.GrupoFamiliar OFF
END
GO

EXEC HELLFISH.MIGRACION_AFILIADOS;
GO
------------------------------------------------------------------------
PRINT 'TABLA Bono'
GO

CREATE TABLE HELLFISH.Bono (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idGrupoFamiliar int, /* TODO : revisar */
	idAfiliadoConsumidor int,
	planMedico int NOT NULL,
	nroConsulta int,
	idVenta int,
	utilizado bit default 0
)
GO

INSERT INTO HELLFISH.BONO (planMedico,UTILIZADO,nroConsulta,idAfiliadoConsumidor)
	SELECT DISTINCT Plan_Med_Codigo,1,Bono_Consulta_Numero,AF.id
		FROM gd_esquema.Maestra, HELLFISH.AFILIADO AF 
		WHERE Bono_Consulta_Numero is not null
		and Paciente_Dni = af.numeroDocumento;

------------------------------------------------------------------------

PRINT 'TABLA SINTOMA'
GO

CREATE TABLE HELLFISH.Sintoma(
	id INT IDENTITY(1,1) PRIMARY KEY,
	descripcion VARCHAR(255)
);

 INSERT INTO HELLFISH.SINTOMA (DESCRIPCION)
 SELECT DISTINCT Consulta_Sintomas 
 FROM gd_esquema.Maestra 
 WHERE Consulta_Sintomas is not null;
 ------------------------------------------------------------------------
CREATE TABLE HELLFISH.Diagnostico(
	id INT IDENTITY(1,1) primary key,
	descripcion VARCHAR(255),
	idTurno INT,
	idCconsulta INT,
	fecha DATETIME
);
------------------------------------------------------------------------
CREATE TABLE HELLFISH.Sintoma_Diagnostico(
	id INT IDENTITY(1,1) PRIMARY KEY,
	idSintoma int not null,
	idDiagnostico int not null
);
------------------------------------------------------------------------
PRINT 'TABLA VENTA DE BONOS'
GO

CREATE TABLE HELLFISH.VentaDeBonos (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	fechaDeCompra datetime NOT NULL,
	idAfiliadoComprador int NOT NULL,
	cantidadBonos int NOT NULL,
	importeConsulta int,
	importeFarmacia int
);

INSERT INTO HELLFISH.VentaDeBonos (idAfiliadoComprador,fechaDeCompra,cantidadBonos,importeConsulta,importeFarmacia)
	SELECT B.idAfiliadoConsumidor,M.Compra_Bono_Fecha,1,M.Plan_Med_Precio_Bono_Consulta,M.Plan_Med_Precio_Bono_Farmacia
	    FROM gd_esquema.Maestra M
		 , HELLFISH.AFILIADO AF
		 , HELLFISH.BONO B
		WHERE M.Compra_Bono_Fecha is not null
		AND Paciente_Dni = af.numeroDocumento
		AND AF.id=B.idAfiliadoConsumidor
		AND B.nroConsulta = M.Bono_Consulta_Numero;	

------------------------------------------------------------------------

PRINT 'TABLA CONSULTA'
GO

CREATE TABLE HELLFISH.Consulta (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idTurno int NOT NULL,
	idBono int not null
)
GO

------------------------------------------------------------------------
PRINT 'TABLA TURNOS'
GO

CREATE TABLE HELLFISH.Turnos(
	id INT IDENTITY(1,1) PRIMARY KEY,
	TURNO_NUMERO INT,
	fecha DATETIME,
	idProfesional INT,
	idAfiliado INT,
	ASISTENCIA BIT DEFAULT 0
);

INSERT INTO HELLFISH.TURNOS (TURNO_NUMERO,fecha,idAfiliado,idProfesional)
	SELECT DISTINCT Turno_numero,turno_fecha, AF.id, PR.id
		FROM gd_esquema.Maestra M ,
		HELLFISH.PROFESIONAL PR, 
		HELLFISH.AFILIADO AF
		WHERE M.Paciente_Dni  = af.numeroDocumento
		AND M.Medico_Dni  = pr.numeroDocumento;
GO

------------------------------------------------------------------------
PRINT 'TABLA AGENDA'
GO

CREATE TABLE HELLFISH.AgendaProfesional (
	id int IDENTITY PRIMARY KEY NOT NULL,
	/* idProfesionalEspecialidad int NOT NULL, */
	idProfesional int,
	idEspecialidad int,
	fecha datetime,
	disponible bit default 1, /* para que pueda cancelarla */
)
GO

INSERT INTO HELLFISH.AgendaProfesional (fecha,idProfesional,idEspecialidad,Disponible)
	SELECT DISTINCT M.Turno_Fecha, PR.id, E.ID, 0 
		FROM gd_esquema.Maestra M ,
		HELLFISH.PROFESIONAL PR, 
		HELLFISH.ESPECIALIDAD E
		WHERE M.Medico_Dni = PR.numeroDocumento
		AND M.Especialidad_Codigo = E.id;

------------------------------------------------------------------------

PRINT 'TABLA CANCELACION'
GO

CREATE TABLE HELLFISH.Cancelacion (
	id int IDENTITY(1,1) NOT NULL,
	detalle varchar(255) NOT NULL,
	tipo int NOT NULL,
	idTurno int NOT NULL,
	responsable varchar(255)
)
GO
------------------------------------------------------------------------
PRINT 'TABLA CAMBIO DE PLAN'
GO

CREATE TABLE HELLFISH.CambioDePlan (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idAfiliado int NOT NULL,
	planOrigen int NOT NULL,
	planDestino int NOT NULL,
	fecha datetime NOT NULL,
	motivo varchar(255),
)
GO

-------------------------------------------------------------------------
/* FUNCIONALIDADES */
------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.INHABILITAR_ROL
	@NOMBRE VARCHAR(255)
AS
BEGIN
UPDATE HELLFISH.Rol SET alta = 0 WHERE descripcion = @NOMBRE;
END
go
------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.OBTENER_COD_ROL
(@NOMBRE_ROL nvarchar(255),@COD_ROL numeric(18,0) OUTPUT)
as
begin
select @COD_ROL = id from HELLFISH.Rol where descripcion = @NOMBRE_ROL;
end;
go
------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.OBTENER_COD_FUNC
(@NOMBRE_FUNC nvarchar(255),@COD_FUNC numeric(18,0) OUTPUT)
as
begin
select @COD_FUNC = id from HELLFISH.FUNCIONALIDAD where descripcion = @NOMBRE_FUNC;
end;
go
------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.AGREGAR_FUNCIONALIDAD
(@NOMBRE_ROL nvarchar(255), @NOMBRE_FUNC nvarchar(255) )
as
DECLARE @codigoRol numeric(18,0),
@codigoFuncionalidad numeric(18,0);
begin
EXEC HELLFISH.OBTENER_COD_FUNC @NOMBRE_FUNC,@codigoFuncionalidad OUTPUT;
EXEC HELLFISH.OBTENER_COD_ROL @NOMBRE_ROL,@codigoRol OUTPUT;
INSERT INTO HELLFISH.RolFuncionalidad(idRol,idFuncionalidad) values (@codigoRol,@codigoFuncionalidad);
end;
go
------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.BORRAR_FUNCIONALIDAD_DE_ROL
(@NOMBRE nvarchar(255))
as
DECLARE @codigoRol numeric(18,0),
@codigoFuncionalidad numeric(18,0);
begin
EXEC HELLFISH.OBTENER_COD_ROL @NOMBRE,@codigoRol OUTPUT;
DELETE FROM HELLFISH.RolFuncionalidad WHERE idRol = @codigoRol;
end;
go
------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.BAJA_descripcion
(@NOMBRE_ROL nvarchar(255))
as
DECLARE @codigo numeric(18,0)
begin
BEGIN TRANSACTION
EXEC HELLFISH.OBTENER_COD_ROL @NOMBRE_ROL,@codigo OUTPUT;

update HELLFISH.Rol set alta = 0 where id = @codigo; 

delete from HELLFISH.UsuarioRol where idRol = @codigo;
commit;
end;
go

------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.NUEVO_ROL
(@NOMBRE VARCHAR(255))
AS
BEGIN
INSERT INTO HELLFISH.Rol (descripcion) VALUES (@NOMBRE);
END
go
------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.ACTUALIZAR_ROL
(@NOMBRE VARCHAR(255),@NOMBRE_VIEJO VARCHAR(255),@HABILITADO bit)
AS
BEGIN
UPDATE HELLFISH.Rol  SET descripcion = @NOMBRE,alta =@HABILITADO WHERE @NOMBRE_VIEJO = descripcion;
IF @HABILITADO = 0
	BEGIN
	EXEC HELLFISH.BAJA_descripcion @NOMBRE_VIEJO;
	END
END
go
------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.ACTUALIZAR_AFILIADO
(
@COD_DETALLE INT, /* No deberia estar */
@COD_AFILIADO INT,
@COD_ESTADO_CIVIL INT,
@CANT_HIJOS_FAMILIARES INT,
@COD_PLAN INT,
@DIRECCION VARCHAR(255),
@TELEFONO VARCHAR(255),
@MAIL VARCHAR(255),
@SEXO VARCHAR(50),
@MOTIVO NVARCHAR(4000),
@MODIFICACION_PLAN BIT,
@COD_PLAN_VIEJO INT)
AS
BEGIN

BEGIN TRANSACTION

UPDATE HELLFISH.AFILIADO  SET idEstadoCivil = @COD_ESTADO_CIVIL,cantHijosFamiliares = @CANT_HIJOS_FAMILIARES, planMedico = @COD_PLAN,
	direccion = @DIRECCION,TELEFONO = @TELEFONO, eMAIL = @MAIL, SEXO = @SEXO
 WHERE id = @COD_AFILIADO;
 
IF(@MODIFICACION_PLAN = 1)
BEGIN
INSERT INTO HELLFISH.CambioDePlan (planDestino,planOrigen,idAfiliado,motivo) VALUES (@COD_PLAN,@COD_PLAN_VIEJO,@COD_AFILIADO,@MOTIVO);
END
COMMIT TRANSACTION 
END
go
CREATE PROCEDURE HELLFISH.DAR_BAJA_AFILIADO
(@AFILIADO_COD INT)
AS
DECLARE
@idigo numeric(18,0)
BEGIN
UPDATE HELLFISH.AFILIADO SET habilitado = 0, fechaBaja = GETDATE() WHERE id = @AFILIADO_COD;

SELECT @idigo = idUsuario from HELLFISH.AFILIADO WHERE id = @AFILIADO_COD;

UPDATE HELLFISH.USUARIO SET alta = 0 WHERE id = @idigo;

INSERT INTO HELLFISH.CANCELACION (tipo,DETALLE,idTurno,responsable) 
SELECT 1,'Baja afiliado',T.id,'Afiliado' 
FROM TURNOS T
WHERE T.idAfiliado = @AFILIADO_COD AND T.id NOT IN (SELECT idTurno FROM HELLFISH.CANCELACION);   
 
END
GO
-------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.ALTA_USUARIO
(@NOMBRE_USUARIO NVARCHAR(255),
@PASSWORD VARCHAR(255),
@ROL NVARCHAR(255),
@CODIGO_USUARIO NUMERIC(18,0) OUTPUT)
AS
BEGIN

INSERT INTO HELLFISH.USUARIO (username,PASSWORD) VALUES (@NOMBRE_USUARIO,substring(master.dbo.fn_varbintohexstr(HashBytes('SHA2_256', @PASSWORD)), 3, 64));
SET @CODIGO_USUARIO = SCOPE_IDENTITY();
IF(@ROL = 'AFILIADO')
BEGIN
	INSERT INTO HELLFISH.UsuarioRol(idRol,idUsuario) VALUES (2,@CODIGO_USUARIO);
END

END
GO
-------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.AGREGAR_DIAGNOSTICO
(@DIAG_COD INT OUTPUT,
@DIAG_DESC NVARCHAR(255),
@DIAG_id INT,
@DIAG_FECHA DATETIME)
AS
DECLARE @fecha datetime;
DECLARE @CONSULTA_MEDICA_COD INT;

BEGIN

begin transaction

if (@DIAG_FECHA IS NULL)
BEGIN
	SELECT @fecha = fecha from HELLFISH.TURNOS where id = @DIAG_id;
END
ELSE
BEGIN
	SET @fecha = @DIAG_FECHA;
END

SELECT @CONSULTA_MEDICA_COD = id FROM HELLFISH.CONSULTA WHERE idTurno = @DIAG_id;

INSERT INTO HELLFISH.DIAGNOSTICO (DESCRIPCION,idTurno,FECHA,idCconsulta) VALUES 
(@DIAG_DESC,@DIAG_id,@fecha,@CONSULTA_MEDICA_COD);
SET @DIAG_COD = SCOPE_IDENTITY();

commit transaction;
END
GO
-------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.AGREGAR_SINTOMA_DIAGNOSTICO
(@DIAG_COD INT,
@SINTOMA_COD INT)
AS
BEGIN

BEGIN TRANSACTION
	INSERT INTO HELLFISH.SINTOMA_DIAGNOSTICO (idDiagnostico,idSintoma) VALUES (@DIAG_COD,@SINTOMA_COD);
COMMIT TRANSACTION

END
GO

-------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.ALTA_AFILIADO
(
@NOMBRE VARCHAR(255),
@APELLIDO VARCHAR(255),
@TIPO_DOC VARCHAR(255),
@NRO_DOC VARCHAR(255),
@DIRECCION VARCHAR(255),
@TELEFONO VARCHAR(255),
@MAIL VARCHAR(255),
@FECHA_NACIMIENTO DATETIME,
@SEXO VARCHAR(50),
@COD_ESTADO_CIVIL INT,
@CANT_HIJOS_FAMILIARES INT,
@COD_PLAN INT,
@COD_USUARIO INT,
@NUMERO_AFILIADO INT,
@NUMERO_FAMILIA INT,
@NUEVO_CODIGO_USUARIO NUMERIC(18,0) OUTPUT,
@NUEVO_CODIGO_FAMILIA NUMERIC(18,0) OUTPUT)
AS
BEGIN
DECLARE
@afiliado_codigo INT,
@nuevo_numero_afiliado INT,
@familia_codigo INT;

BEGIN TRANSACTION
	INSERT INTO HELLFISH.AFILIADO (nombre,apellido,tipoDocumento,numeroDocumento,direccion,telefono,email,fechaNacimiento,sexo,
	idEstadoCivil,cantHijosFamiliares,planMedico,idUsuario,nroAfiliadoIntegrante) 
	VALUES (@NOMBRE,@APELLIDO,@TIPO_DOC,@NRO_DOC,@DIRECCION,@TELEFONO,@MAIL,@FECHA_NACIMIENTO,@SEXO,
	@COD_ESTADO_CIVIL,@CANT_HIJOS_FAMILIARES,@COD_PLAN,@COD_USUARIO,@NUMERO_AFILIADO);
	SET @afiliado_codigo = SCOPE_IDENTITY();
	IF(@NUMERO_FAMILIA = 0)
		BEGIN
			insert into HELLFISH.GrupoFamiliar(nroAfiliadoBase) VALUES (@afiliado_codigo)
			SET @NUMERO_FAMILIA = SCOPE_IDENTITY();
		END

	UPDATE HELLFISH.AFILIADO SET grupoFamiliar = @NUMERO_FAMILIA where id = @afiliado_codigo;
	SET @NUEVO_CODIGO_USUARIO = @afiliado_codigo;
	SET @NUEVO_CODIGO_FAMILIA = @NUMERO_FAMILIA;
COMMIT TRANSACTION;
END
GO
-------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.ALTA_DETALLE
(@COD_USUARIO INT,
@NOMBRE VARCHAR(255),
@APELLIDO VARCHAR(255),
@TIPO_DOC VARCHAR(255),
@NRO_DOC VARCHAR(255),
@DIRECCION VARCHAR(255),
@TELEFONO VARCHAR(255),
@MAIL VARCHAR(255),
@FECHA_NACIMIENTO DATETIME,
@SEXO VARCHAR(50))
AS
BEGIN

INSERT INTO HELLFISH.DETALLE_PERSONA 
(DETALLE_id,nombre,apellido,DETALLE_TIPO_DOC,DETALLE_NRO_DOC,DETALLE_DIRECCION,DETALLE_TELEFONO,DETALLE_MAIL,DETALLE_FECHA_NACIMIENTO,DETALLE_SEXO) 
VALUES (@COD_USUARIO,@NOMBRE,@APELLIDO,@TIPO_DOC,CONVERT(INT,@NRO_DOC),@DIRECCION,CONVERT(INT,@TELEFONO),@MAIL,@FECHA_NACIMIENTO,@SEXO);

END
GO

-------------------------------------------------------------------------------
/* FUNCIONES */ 
-------------------------------------------------------------------------------

CREATE FUNCTION HELLFISH.OBTENER_MENSAJE_ERROR (
@idMensaje int)
RETURNS nvarchar(255)
AS
BEGIN
RETURN (SELECT TOP 1 convert(nvarchar(255), text) FROM sys.messages WHERE message_id = @idMensaje)
END;
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_CANTIDAD_ROLES(
@username nvarchar(255)
)
RETURNS int
AS
BEGIN
	RETURN(
	SELECT COUNT(*) 
	FROM HELLFISH.USUARIO U, HELLFISH.UsuarioRol RU
	WHERE U.username = @username AND U.id = RU.idUsuario
	)
END
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_ROLES(
@username nvarchar(255)
)
RETURNS TABLE
AS
	RETURN (
	SELECT R.descripcion 
	FROM HELLFISH.USUARIO U, HELLFISH.UsuarioRol RU, HELLFISH.ROL R
	WHERE U.username = @username AND U.id = RU.idUsuario AND R.id = RU.idRol
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_TODOS_ROLES(
)
RETURNS TABLE
AS
	RETURN (
	SELECT R.descripcion
	FROM HELLFISH.ROL R
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_FUNCIONALIDADES(
)
RETURNS TABLE
AS
	RETURN (
	SELECT DESCRIPCION 
	FROM HELLFISH.FUNCIONALIDAD
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_FUNCIONALIDADES_ROL(
@rol nvarchar(255)
)
RETURNS TABLE
AS
	RETURN (
	SELECT F.descripcion 
	FROM HELLFISH.Funcionalidad F, HELLFISH.RolFuncionalidad FR, HELLFISH.ROL R
	WHERE R.id = FR.idRol AND FR.idFuncionalidad = F.id AND R.descripcion = @rol  
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_ROLES_HABILITADOS(
)
RETURNS TABLE
AS
	RETURN (
	SELECT R.descripcion 
	FROM HELLFISH.ROL R
	WHERE R.alta = 1
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_AFILIADOS(
)
RETURNS TABLE
AS
	RETURN (
	SELECT DISTINCT A.id,A.nombre,A.apellido,A.tipoDocumento,A.numeroDocumento,
	P.descripcion AS 'plan',
	EC.descripcion,
	A.DIRECCION,A.telefono,A.email,A.SEXO,A.cantHijosFamiliares/* ,D.DETALLE_COD */
	FROM HELLFISH.AFILIADO A, HELLFISH.USUARIO U , HELLFISH.ESTADOCIVIL EC , HELLFISH.PlanMedico P
	WHERE A.idEstadoCivil = EC.id AND A.planMedico = P.id
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_PLANES(
)
RETURNS TABLE
AS
	RETURN (
	SELECT DISTINCT id as 'PLAN_COD',descripcion as 'PLAN_NIVEL' FROM HELLFISH.PlanMedico
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_SINTOMAS(
)
RETURNS TABLE
AS
	RETURN (
	SELECT DISTINCT id,descripcion FROM HELLFISH.SINTOMA
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_ESTADOS_CIVILES(
)
RETURNS TABLE
AS
	RETURN (
	SELECT DISTINCT id,descripcion FROM HELLFISH.ESTADOCIVIL
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_AFILIADOS_HABILITADOS(
)
RETURNS TABLE
AS
	RETURN (
	SELECT DISTINCT A.id,A.nombre,A.apellido,A.tipoDocumento,A.numeroDocumento 
	FROM HELLFISH.AFILIADO A
	WHERE A.habilitado = 1
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_HABILITACION_ROL(
@NOMBRE NVARCHAR(255)
)
RETURNS int
AS
BEGIN
	RETURN(
	SELECT alta 
	FROM HELLFISH.ROL R
	WHERE R.descripcion = @NOMBRE
	)
END
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_PLAN_AFILIADO(
@AFILIADO_NRO INT
)
RETURNS TABLE
AS
	RETURN(
	SELECT A.nombre, A.APELLIDO, A.HABILITADO, P.id, P.descripcion, P.precioBonoConsulta,A.grupoFamiliar
	FROM HELLFISH.PlanMedico P, HELLFISH.AFILIADO A 
	WHERE A.planMedico = P.id 
	AND A.id = @AFILIADO_NRO /* AND A.AFIL_NRO = @AFILIADO_NRO */ 
	)
GO
----------------------------------------------------------------------

----------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.COMPRAR_BONO (
@AFILIADO_NRO INT,
@CANTIDAD INT,
@FECHA datetime 
)
as
DECLARE
@afiliado_habilitado bit,
@codigo_plan int,
@precio_Consulta numeric(18,0),
@precio_farmacia numeric(18,0),
@ind int = 0,
@err_msg nvarchar(250),
@afiliado_cod int,
@idVenta int 

BEGIN TRY
BEGIN TRANSACTION

	SELECT @afiliado_habilitado = A.habilitado, @codigo_plan = P.id, @precio_Consulta=P.precioBonoConsulta, @precio_farmacia=P.precioBonoFarmacia, @afiliado_cod = A.id 
		FROM HELLFISH.PlanMedico P, HELLFISH.AFILIADO A  
		WHERE A.planMedico = P.id 
		AND A.id = @AFILIADO_NRO /* A.AFIL_NRO = @AFILIADO_NRO */

	if @codigo_plan is null begin
		SET @err_msg = 'El afiliado que ingresó no existe.'
		RAISERROR(@err_msg,14,1)
	end

	if @afiliado_habilitado <> 1 begin
		SET @err_msg = 'El afiliado con el que intenta comprar esta deshabilitado.'
		RAISERROR(@err_msg,14,1)
	end
	
	-- Todo correcto, inserto en las 2 tablas
	INSERT INTO HELLFISH.VentaDeBonos
		(idAfiliadoComprador, fechaDeCompra, cantidadBonos, importeConsulta, importeFarmacia)
	VALUES
		(@afiliado_cod, @FECHA, @CANTIDAD, @precio_Consulta, @precio_farmacia)

	set @idVenta = SCOPE_IDENTITY();

	WHILE @ind < @CANTIDAD  BEGIN  
		INSERT INTO HELLFISH.BONO 
			(planMedico, utilizado, idGrupoFamiliar,idAfiliadoConsumidor, idVenta) /* TODO: ESTE ES EL COMPRADOR */
		VALUES 
			(@codigo_plan, 0, (select grupoFamiliar from hellfish.Afiliado where id = @afiliado_cod),@afiliado_cod,@idVenta)
      
		SET @ind = @ind + 1
	END  

	
    
COMMIT TRANSACTION
END TRY
begin catch
	rollback transaction	
	if (@@error = 0)
		RAISERROR(@err_msg,14,1)
	else
	begin
		set @err_msg = HELLFISH.OBTENER_MENSAJE_ERROR(@@error)
		RAISERROR(@err_msg,14,1)
	end
end catch;
go

----------------------------------------------------------------------
--LISTADO ESTADISTICO
--1) Top 5 de las especialidades que más se registraron cancelaciones, tanto de afiliados como de profesionales.
CREATE FUNCTION HELLFISH.ESTADISTICA_ESP_MAS_CANCELADAS(
@FILTRO_ANIO INT,
@MES_INICIAL INT,
@MES_FINAL INT,
@FILTRO_RESP_1 NVARCHAR(250),
@FILTRO_RESP_2 NVARCHAR(250)
)
RETURNS TABLE
AS
	RETURN(
	SELECT TOP 5 E.id,E.descripcion, COUNT(C.id) NRO_CANCELACIONES 
	FROM HELLFISH.ESPECIALIDAD E,HELLFISH.CANCELACION C, HELLFISH.TURNOS T,HELLFISH.PROFESIONALESpecialidad EP
	WHERE C.idTurno = T.id
	AND T.idProfesional = EP.idProfesional
	AND EP.especialidad = E.id
	AND YEAR(T.fecha) = @FILTRO_ANIO
    AND MONTH(T.fecha) BETWEEN @MES_INICIAL AND @MES_FINAL
	AND (C.responsable = @FILTRO_RESP_1 OR C.responsable = @FILTRO_RESP_2)
	GROUP BY E.id,E.descripcion
	ORDER BY COUNT(C.id) DESC
	)
GO

--2) Top 5 de los profesionales más consultados por Plan, detallando también bajo que Especialidad.
CREATE FUNCTION HELLFISH.PROF_MAS_CONSULTADOS(
@FILTRO_ANIO INT,
@MES_INICIAL INT,
@MES_FINAL INT,
@PLAN_COD INT)
RETURNS TABLE
AS
	RETURN(
		SELECT TOP 5 P.id,P.nombre, P.apellido, P.nroMatricula, E.descripcion, COUNT(T.id) NRO_CONSULTAS 
		FROM HELLFISH.TURNOS T,
					  HELLFISH.AgendaProfesional A,
					  HELLFISH.AFILIADO AFI, 
					  HELLFISH.PROFESIONAL P,
					  HELLFISH.USUARIO U,
					  HELLFISH.ESPECIALIDAD E
			WHERE AFI.id = T.idAfiliado
			AND T.fecha = A.fecha
			AND T.idProfesional = A.idProfesional
			AND A.idEspecialidad = E.id
			AND P.id=T.idProfesional
			AND P.idUsuario=U.id
			AND U.id=P.idUsuario
			AND AFI.planMedico = @PLAN_COD
			/* AND U.USUARIO_TIPO='0' */
			AND YEAR(T.fecha)=@FILTRO_ANIO
			AND MONTH(T.fecha) BETWEEN @MES_INICIAL AND @MES_FINAL
		GROUP BY P.id,P.nombre, P.apellido, P.nroMatricula, E.descripcion
		ORDER BY COUNT(T.id) DESC
		)
GO

--3) Top 5 de los profesionales con menos horas trabajadas filtrando por Plan y Especialidad.
CREATE FUNCTION HELLFISH.PROF_MENOS_HORAS(
@PLAN INT,
@ESPEC INT,
@AÑO INT,
@MES_INICIAL INT,
@MES_FINAL INT
)
RETURNS TABLE
AS
	RETURN(
		SELECT
		TOP 5 P.id CODIGO,P.nombre NOMBRE,P.apellido APELLIDO,P.nroMatricula as 'MATRICULA',E.descripcion ESPECIALIDAD, count(*)/2 HORAS_TOTAL_TRABAJADAS
				 from HELLFISH.TURNOS T,
					  HELLFISH.AgendaProfesional A,
					  HELLFISH.AFILIADO AFI, 
					  HELLFISH.PROFESIONAL P,
					  HELLFISH.USUARIo U,
					  HELLFISH.PROFESIONALESpecialidad EP,
					  HELLFISH.ESPECIALIDAD E
			WHERE AFI.id=T.idAfiliado
			AND T.fecha=A.fecha
			AND T.idProfesional=A.idProfesional
			AND P.id=T.idProfesional
			AND P.idUsuario = U.id
			AND P.id=EP.idProfesional
			/* AND U.USUARIO_TIPO='0' */
			AND EP.especialidad= E.id
			AND E.id = @ESPEC
			AND AFI.planMedico = @PLAN
			AND YEAR(T.fecha)=@AÑO
			AND MONTH(T.fecha) BETWEEN @MES_INICIAL AND @MES_FINAL
			GROUP BY P.nombre,P.apellido,P.id ,P.nroMatricula,E.descripcion
			ORDER BY COUNT(*) ASC
			)
GO

--4)Top 5 de los afiliados con mayor cantidad de bonos comprados, detallando si pertenece a un grupo familiar..
CREATE FUNCTION HELLFISH.AFIL_MAYOR_BONOS(
@AÑO INT,
@MES_INICIAL INT,
@MES_FINAL INT
)
RETURNS TABLE
AS
	RETURN(
		SELECT 
		TOP 5 A.id,A.nombre ,A.apellido AFILIADO,
		(CASE  
			WHEN A.cantHijosFamiliares IS NULL or A.cantHijosFamiliares = 0 THEN 'No'
			ELSE 'Si'
		 END) FAMILIARES_A_CARGO
		, count(A.id) CANTIDAD_BONOS
		FROM 
		HELLFISH.VentaDeBonos CB,
		HELLFISH.AFILIADO A,
		HELLFISH.USUARIO U
		WHERE 
			CB.idAfiliadoComprador=A.id
			AND A.idUsuario=U.id

			AND YEAR(CB.fechaDeCompra)=@AÑO
		    AND MONTH(CB.fechaDeCompra) BETWEEN @MES_INICIAL AND @MES_FINAL
		GROUP BY A.nombre,A.apellido,A.cantHijosFamiliares,A.id
		ORDER BY COUNT(A.id) DESC
		)
GO

--5)Top 5 de las especialidades de médicos con más bonos de consultas utilizados.

CREATE FUNCTION HELLFISH.ESTADISTICA_ESP_MAS_CONSULTADAS(
@FILTRO_ANIO INT,
@MES_INICIAL INT,
@MES_FINAL INT
)
RETURNS TABLE
AS
	RETURN(
		SELECT TOP 5 E.descripcion FROM HELLFISH.AgendaProfesional A  
		JOIN HELLFISH.PROFESIONAL P ON A.idProfesional = P.id
		JOIN HELLFISH.ESPECIALIDAD E ON E.id=A.idEspecialidad
		JOIN HELLFISH.TURNOS T ON T.fecha=A.fecha
		JOIN HELLFISH.BONO B ON B.idAfiliadoConsumidor=T.idAfiliado /* TODO: este es el comprador */
		WHERE
		B.utilizado=1
		AND YEAR(T.fecha) = @FILTRO_ANIO AND 
		MONTH(T.fecha) BETWEEN @MES_INICIAL AND @MES_FINAL
		GROUP BY E.descripcion
		ORDER BY COUNT(E.id) DESC
		)
GO

----------------------------------------------------------------------

CREATE FUNCTION HELLFISH.CARGAR_DATOS_USUARIO(
  @username nvarchar(255)
)
RETURNS TABLE
AS
	RETURN (
    SELECT U.id, ISNULL(A.id, 0) AS AFIL_COD, ISNULL(P.id, 0) AS PROF_COD, ISNULL(A.id, 0) AS AFIL_NRO
    FROM HELLFISH.USUARIO U
	LEFT JOIN HELLFISH.PROFESIONAL P
	ON (P.idUsuario = U.id)
	LEFT JOIN HELLFISH.AFILIADO A
	ON (U.id = A.idUsuario)
    WHERE U.username = @username 
	)
GO

CREATE FUNCTION HELLFISH.OBTENER_PROFESIONAL(
  @usuarioCodigo INT
)
RETURNS TABLE
AS
	RETURN (
    SELECT P.id, P.nroMatricula, P.nombre, P.apellido
    FROM HELLFISH.PROFESIONAL P
    WHERE P.idUsuario = @usuarioCodigo 
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_ESPECIALIDADES_PROFESIONAL(
  @usuarioCodigo INT
)
RETURNS TABLE
AS
	RETURN (
    SELECT E.id, E.descripcion 
    FROM  HELLFISH.ProfesionalEspecialidad EP join HELLFISH.PROFESIONAL P on ep.idProfesional=P.id 
	join HELLFISH.ESPECIALIDAD E on ep.especialidad = e.id
    WHERE P.idUsuario = @usuarioCodigo 
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_ESPECIALIDADES(
)
RETURNS TABLE
AS
	RETURN (
    SELECT E.id, E.descripcion 
    FROM HELLFISH.ESPECIALIDAD E
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_PROFESIONALES_ESPECIALIDAD(
  @especialidadCodigo INT
)
RETURNS TABLE
AS
	RETURN (
    SELECT P.id, P.nroMatricula, P.nombre, P.apellido
    FROM  HELLFISH.ProfesionalEspecialidad EP join HELLFISH.PROFESIONAL P on ep.idProfesional=P.id 
	join HELLFISH.ESPECIALIDAD E on ep.especialidad = e.id
    WHERE E.id = @especialidadCodigo 
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_FECHAS_PROFESIONAL_ESPECIALIDAD(
  @profesionalId INT,
  @especialidadId INT
)
RETURNS TABLE
AS
	RETURN (
		SELECT DISTINCT FORMAT(A.fecha, 'dd/MM/yyyy') AS FECHA
		FROM HELLFISH.AgendaProfesional A
		WHERE A.idEspecialidad = @especialidadId 
		AND A.idProfesional = @profesionalId 
		AND A.DISPONIBLE = 1
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_HORAS_PROFESIONAL_ESPECIALIDAD(
  @profesionalId INT,
  @especialidadId INT,
  @fecha datetime
)
RETURNS TABLE
AS
	RETURN (
		SELECT DISTINCT FORMAT(A.fecha, 'HH:mm') AS FECHA
		FROM HELLFISH.AgendaProfesional A
		WHERE A.idEspecialidad = @especialidadId 
		AND A.idProfesional = @profesionalId
		and datepart(day,A.fecha) = datepart(day,CONVERT(datetime,@fecha,103))
		and datepart(MONTH,A.fecha) = datepart(MONTH,CONVERT(datetime,@fecha,103))
		and datepart(YEAR,A.fecha) = datepart(YEAR,CONVERT(datetime,@fecha,103))
		AND A.DISPONIBLE = 1
	)
GO
----------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.SOLICITAR_TURNO (
@AFILIADO_ID INT, @PROFESIONAL_ID INT, @ESPECIALIDAD_ID INT, @FECHA datetime  
)
as
DECLARE
@afiliado_habilitado bit = null,
@fecha_agenda datetime = null,
@err_msg varchar(250)

BEGIN TRY
BEGIN TRANSACTION
	
	-- Afiliado valido?
	SELECT @afiliado_habilitado = A.HABILITADO
		FROM HELLFISH.AFILIADO A  
		WHERE A.id = @AFILIADO_ID

	if @afiliado_habilitado is null or @afiliado_habilitado <> 1 begin
		SET @err_msg = 'El afiliado con el que intenta solicitar el turno no existe o esta deshabilitado.'
		RAISERROR(@err_msg,14,1)
	end

	-- Esta disponible el turno?
	SELECT @fecha_agenda = A.fecha
		FROM HELLFISH.AgendaProfesional A
		WHERE A.idEspecialidad = @ESPECIALIDAD_ID 
		AND A.idProfesional = @PROFESIONAL_ID 
		AND A.fecha = @FECHA 
		AND A.DISPONIBLE = 1

	IF (@fecha_agenda is null) BEGIN
		SET @err_msg = 'El turno ya no se encuentra disponible.'
		RAISERROR(@err_msg,14,1)
	END

	-- Actualizo el estado de la agenda a no disponible
	UPDATE HELLFISH.AgendaProfesional
	SET DISPONIBLE = 0
	WHERE idEspecialidad = @ESPECIALIDAD_ID 
		AND idProfesional = @PROFESIONAL_ID 
		AND fecha = @fecha_agenda 
	
	-- Agrego el turno para el afiliado
	INSERT INTO HELLFISH.TURNOS
           (TURNO_NUMERO,fecha,idProfesional,idAfiliado,asistencia)
     VALUES
           ((select max(TURNO_NUMERO) + 1 from HELLFISH.TURNOS),
			@fecha_agenda, @PROFESIONAL_ID, @AFILIADO_ID, 0)

COMMIT TRANSACTION
END TRY
begin catch
	rollback transaction	
	if (@@error = 0)
		RAISERROR(@err_msg,14,1)
	else
	begin
		set @err_msg = HELLFISH.OBTENER_MENSAJE_ERROR(@@error)
		RAISERROR(@err_msg,14,1)
	end
end catch;
go
----------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.REGISTRAR_AGENDA_PROFESIONAL (
@PROFESIONAL_COD INT, @ID_ESPECIALIDAD INT, @DIA INT,
@DESDE_HORA INT, @DESDE_MIN INT, @HASTA_HORA INT, @HASTA_MIN INT,
@FECHA_DESDE datetime, @FECHA_HASTA datetime  
)
as
DECLARE
@current_date datetime,
@final_date datetime,
@err_msg nvarchar(250),
@ya_ocupado int
BEGIN TRY
BEGIN TRANSACTION
	select @ya_ocupado = count(id) from HELLFISH.AgendaProfesional 
	where idProfesional = @PROFESIONAL_COD
	and @FECHA_DESDE < fecha
	and @FECHA_HASTA > fecha
	group by id

	if (@ya_ocupado > 0) RAISERROR('El profesional ya esta ocupado en este rango de dias.Elija otro o cancele primero',14,1)
		
	while @FECHA_DESDE <= @FECHA_HASTA begin
        
		if (@DIA = DATEPART(WEEKDAY, @FECHA_DESDE)) 
		begin
			select @current_date = CONVERT(DATETIME, CAST(DATEPART(MONTH, @FECHA_DESDE) as varchar)
				+'/'+CAST(DATEPART(DAY, @FECHA_DESDE) as varchar)+'/'
				+CAST(DATEPART(YEAR, @FECHA_DESDE) as varchar)
				+' '+CAST(@DESDE_HORA as varchar)+':'+CAST(@DESDE_MIN as varchar));
		
			select @final_date = CONVERT(DATETIME, CAST(DATEPART(MONTH, @FECHA_DESDE) as varchar)
				+'/'+CAST(DATEPART(DAY, @FECHA_DESDE) as varchar)+'/'
				+CAST(DATEPART(YEAR, @FECHA_DESDE) as varchar)
				+' '+CAST(@HASTA_HORA as varchar)+':'+CAST(@HASTA_MIN as varchar));

			while @current_date <= @final_date 
			begin
				insert into HELLFISH.AgendaProfesional (fecha, idProfesional, idEspecialidad, DISPONIBLE) 
					VALUES (@current_date, @PROFESIONAL_COD, @ID_ESPECIALIDAD, 1);

				 SET @current_date = dateadd(MI, 30, @current_date);
			end
		end

		-- Proximo dia
        set @FECHA_DESDE = dateadd(dd, 1, @FECHA_DESDE)
    end    

COMMIT TRANSACTION
END TRY
begin catch
	rollback transaction	
	if (@@error = 0)
		RAISERROR(@err_msg,14,1)
	else
	begin
		set @err_msg = HELLFISH.OBTENER_MENSAJE_ERROR(@@error)
		RAISERROR(@err_msg,14,1)
	end
end catch;
go
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.BUSCAR_TURNOS_AFILIADO(
  @afiliadoId INT
)
RETURNS TABLE
AS
	RETURN (
		SELECT T.id, T.TURNO_NUMERO, T.fecha, P.nombre + ' ' + P.apellido AS PROFESIONAL
		FROM HELLFISH.TURNOS T, HELLFISH.PROFESIONAL P
		WHERE T.idAfiliado = @afiliadoId 
		AND T.idProfesional = P.id
		AND T.asistencia = 0
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_TIPO_CANCELACIONES(
)
RETURNS TABLE
AS
	RETURN (
		SELECT T.id, T.descripcion 
		FROM HELLFISH.TipoCancelacion T 
	)
GO
----------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.CANCELAR_TURNO_AFILIADO (
@TURNO_ID INT, @AFILIADO_ID INT, @MOTIVO_ID INT, @DETALLE nvarchar(250)  
)
as
DECLARE
@afiliado_habilitado bit = null,
@usuario_nombre  nvarchar(250),
@err_msg nvarchar(250)

BEGIN TRY
BEGIN TRANSACTION
	
	-- Afiliado valido?
	SELECT @afiliado_habilitado = A.HABILITADO, @usuario_nombre = U.username
		FROM HELLFISH.AFILIADO A , HELLFISH.USUARIO U
		WHERE A.id = @AFILIADO_ID
		AND A.idUsuario = U.id

	if @afiliado_habilitado is null or @afiliado_habilitado <> 1 begin
		SET @err_msg = 'El afiliado con el que intenta cancelar el turno no existe o esta deshabilitado.'
		RAISERROR(@err_msg,14,1)
	end

	-- Esta tomado el turno por ese afiliado?
	if (SELECT COUNT(*)
		FROM HELLFISH.TURNOS T
		WHERE T.id = @TURNO_ID 
		AND T.idAfiliado = @AFILIADO_ID 
		AND T.asistencia = 0) = 0 BEGIN

		SET @err_msg = 'El turno ya no se puede cancelar.'
		RAISERROR(@err_msg,14,1)
	END

	-- Actualizo el turno
	UPDATE HELLFISH.TURNOS
	SET asistencia = 1
	WHERE id = @TURNO_ID 
	
	-- Agrego el motivo de cancelacion
	INSERT INTO HELLFISH.CANCELACION
           (tipo,detalle,responsable,idTurno)
     VALUES
           (@MOTIVO_ID, @DETALLE, @usuario_nombre , @TURNO_ID)

COMMIT TRANSACTION
END TRY
begin catch
	rollback transaction	
	if (@@error = 0)
		RAISERROR(@err_msg,14,1)
	else
	begin
		set @err_msg = HELLFISH.OBTENER_MENSAJE_ERROR(@@error)
		RAISERROR(@err_msg,14,1)
	end
end catch;
go
----------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.CANCELAR_TURNO_PROFESIONAL (
@PROFESIONAL_ID INT, 
@FECHA_DESDE datetime, @FECHA_HASTA datetime ,
@MOTIVO_ID INT, @DETALLE nvarchar(250)
)
as
DECLARE
@usuario_nombre  nvarchar(250),
@fecha_final datetime,
@err_msg nvarchar(250)

BEGIN TRY
BEGIN TRANSACTION

	-- Profesional valido?
	SELECT  @usuario_nombre = U.username
		FROM HELLFISH.PROFESIONAL p , HELLFISH.USUARIO U
		WHERE P.id = @PROFESIONAL_ID
		AND P.idUsuario = U.id

	IF (@usuario_nombre IS NULL) BEGIN
		SET @err_msg = 'El profesional con el que intenta realizar la transacción no existe o esta deshabilitado.'
		RAISERROR(@err_msg,14,1)
	END

	set @fecha_final = dateadd(dd, 1, @FECHA_HASTA);

	IF (@fecha_final < @FECHA_DESDE) BEGIN
		SET @err_msg = 'Rango de fechas inválido.'
		RAISERROR(@err_msg,14,1)
	END

	-- Agrego el motivo de la cancelacion A LOS TURNOS QUE YA SE DIERON
	INSERT INTO HELLFISH.CANCELACION(tipo,detalle,responsable,idTurno)
    (SELECT @MOTIVO_ID, @DETALLE, @usuario_nombre, T.id FROM  HELLFISH.TURNOS T
		WHERE T.fecha >= @FECHA_DESDE AND T.fecha <= @fecha_final
		AND T.idProfesional = @PROFESIONAL_ID
		AND T.asistencia = 0
	)
	
	-- Cancela los turnos que ya se hayan dado
	UPDATE HELLFISH.TURNOS
	SET asistencia = 1
	WHERE fecha >= @FECHA_DESDE AND fecha <= @fecha_final
		AND idProfesional = @PROFESIONAL_ID
		AND asistencia = 0

	-- Cancela los turnos libres de la agenda
	UPDATE HELLFISH.AgendaProfesional
	SET DISPONIBLE = 0
	WHERE fecha >= @FECHA_DESDE AND fecha <= @fecha_final
		AND idProfesional = @PROFESIONAL_ID
		AND DISPONIBLE = 1

COMMIT TRANSACTION
END TRY
begin catch
	rollback transaction	
	if (@@error = 0)
		RAISERROR(@err_msg,14,1)
	else
	begin
		set @err_msg = HELLFISH.OBTENER_MENSAJE_ERROR(@@error)
		RAISERROR(@err_msg,14,1)
	end
end catch;
go
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_FECHAS_TURNO_PROFESIONAL_ESPECIALIDAD(
  @profesionalId INT,
  @especialidadId INT
)
RETURNS TABLE
AS
	RETURN (
		SELECT DISTINCT FORMAT(T.fecha, 'MM/dd/yyyy') AS FECHA
		FROM HELLFISH.AgendaProfesional A, HELLFISH.TURNOS T
		WHERE A.idEspecialidad = @especialidadId 
		AND A.idProfesional = @profesionalId 
		AND T.fecha = A.fecha
		AND T.idProfesional = A.idProfesional
		AND T.asistencia = 0 
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_TURNOS_PROFESIONAL_ESPECIALIDAD(
  @profesionalId INT,
  @especialidadId INT,
  @fecha datetime
)
RETURNS TABLE
AS
	RETURN (
		SELECT T.id, T.fecha, T.TURNO_NUMERO, T.idProfesional, T.idAfiliado 
		FROM HELLFISH.AgendaProfesional A, HELLFISH.TURNOS T
		WHERE A.idEspecialidad = @especialidadId 
		AND A.idProfesional = @profesionalId 
		AND FORMAT(A.fecha, 'dd/MM/yyyy') = FORMAT(@fecha, 'dd/MM/yyyy') 
		AND T.fecha = A.fecha
		AND T.idProfesional = A.idProfesional
		AND T.asistencia = 0 
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_AFILIADOS_RELACIONADOS(
  @afiliadoId INT
)
RETURNS TABLE
AS
	RETURN (
		-- TODO los afiliados relacionados, ACA PODRIA USAR EL GRUPO FAMILIAR
		SELECT A.id, A.nombre, A.apellido
		FROM HELLFISH.AFILIADO A
		WHERE A.id = @afiliadoId
		AND A.HABILITADO = 1
	)
GO
----------------------------------------------------------------------
CREATE FUNCTION HELLFISH.OBTENER_BONOS_AFILIADOS(
  @afiliadoId INT
)
RETURNS TABLE
AS
	RETURN (
		-- TODO los afiliados relacionados
		SELECT B.id AS 'IdBono', B.planMedico, P.descripcion, A.id 
		FROM HELLFISH.AFILIADO A, HELLFISH.Bono B , HELLFISH.PlanMedico P 
		WHERE A.id = B.idAfiliadoConsumidor
		AND B.planMedico = P.id
		AND A.id = @afiliadoId
		AND A.HABILITADO = 1
		AND B.UTILIZADO = 0
	)
GO
----------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.REGISTRAR_LLEGADA_AFILIADO (
@TURNO_ID INT, 
@AFILIADO_ID INT, 
@BONO_ID INT
)
as
DECLARE
@afiliado_habilitado bit = null,
@err_msg nvarchar(250)

BEGIN TRY
BEGIN TRANSACTION

	-- Afiliado valido?
	SELECT @afiliado_habilitado = A.HABILITADO
		FROM HELLFISH.AFILIADO A , HELLFISH.USUARIO U
		WHERE A.id = @AFILIADO_ID
		AND A.idUsuario = U.id

	if @afiliado_habilitado is null or @afiliado_habilitado <> 1 begin
		SET @err_msg = 'El afiliado con el que intenta registrar la llegada no existe o esta deshabilitado.'
		RAISERROR(@err_msg,14,1)
	end

	-- el turno pertenece al afiliado y esta disponible?
	-- TODO agregar que puede ser un afiliado familiar
	if (SELECT COUNT(*)
		FROM HELLFISH.TURNOS T
		WHERE T.id = @TURNO_ID 
		AND T.idAfiliado = @AFILIADO_ID 
		AND T.asistencia = 0) = 0 BEGIN

		SET @err_msg = 'El turno no se encuentra disponible.'
		RAISERROR(@err_msg,14,1)
	END

	-- El bono seleccionado sigue libre y es del afiliado?
	-- TODO agregar que puede ser un afiliado familiar
	if (SELECT COUNT(*)
		FROM HELLFISH.Bono B
		WHERE B.id = @BONO_ID 
		AND B.idAfiliadoConsumidor = @AFILIADO_ID 
		AND B.UTILIZADO = 0) = 0 BEGIN

		SET @err_msg = 'El bono seleccionado no se encuentra disponible.'
		RAISERROR(@err_msg,14,1)
	END

	-- Actualizo el turno
	UPDATE HELLFISH.TURNOS
	SET asistencia = 1
	WHERE id = @TURNO_ID

	-- Actualizo el bono
	UPDATE HELLFISH.Bono 
	SET UTILIZADO = 1
	WHERE id = @BONO_ID

	-- Creo la consulta
	INSERT INTO HELLFISH.CONSULTA
	(idBono, id) VALUES
	(@BONO_ID, @TURNO_ID)

COMMIT TRANSACTION
END TRY
begin catch
	rollback transaction	
	if (@@error = 0)
		RAISERROR(@err_msg,14,1)
	else
	begin
		set @err_msg = HELLFISH.OBTENER_MENSAJE_ERROR(@@error)
		RAISERROR(@err_msg,14,1)
	end
end catch;
go

-------------------------------------------------------------------------------
CREATE PROCEDURE HELLFISH.LOGIN_USUARIO (
@username nvarchar(255),
@password varchar(255) 
)
as
DECLARE
@usuario_habilitado bit,
@usuario_codigo numeric(18,0),
@usuario_password nvarchar(255),
@intentos_Fallidos numeric(1,0),
@err_msg nvarchar(250)

BEGIN TRY
BEGIN TRANSACTION

select @usuario_codigo=id,@usuario_habilitado=alta,
@usuario_password=password,@intentos_Fallidos=intentosFallidos
from HELLFISH.Usuario
where username = @username;

if @usuario_codigo is null
begin
		SET @err_msg = 'El usuario que ingresó no existe.'
		RAISERROR(@err_msg,14,1)
end

if @usuario_habilitado <> 1
	begin
	SET @err_msg = 'El usuario con el que intenta acceder esta deshabilitado.'
		RAISERROR(@err_msg,14,1)
	end
	
	--login fallido
	if  @usuario_password <> substring(master.dbo.fn_varbintohexstr(HashBytes('SHA2_256',@password)), 3, 64)
	begin
		if @intentos_Fallidos < 2
		begin
			update HELLFISH.Usuario set intentosFallidos = @intentos_Fallidos + 1 where id = @usuario_codigo
			COMMIT TRANSACTION
			BEGIN TRANSACTION
			SET @err_msg = 'Usuario o contraseña invalida.'
			RAISERROR(@err_msg,14,1)
		end
		else
		begin 
			update HELLFISH.Usuario set intentosFallidos = @intentos_Fallidos + 1, alta = 0 where id = @usuario_codigo
			COMMIT TRANSACTION
			BEGIN TRANSACTION
			SET @err_msg = 'Usuario o contraseña invalida. Por su seguridad, su usuario ha sido bloqueado.'
			RAISERROR(@err_msg,14,1)
		end
	end
	
	-- login realizado de forma correcta
	update HELLFISH.Usuario set intentosFallidos = 0 where id = @usuario_codigo;	
COMMIT TRANSACTION
END TRY
begin catch
	rollback transaction	
	if (@@error = 0)
		RAISERROR(@err_msg,14,1)
	else
	begin
		set @err_msg = HELLFISH.OBTENER_MENSAJE_ERROR(@@error)
		RAISERROR(@err_msg,14,1)
	end
end catch;
go
-------------------------------------------------------------------------------

-- Creacion de constraints de FK

ALTER TABLE HELLFISH.AgendaProfesional ADD CONSTRAINT FK_AgendaProfesional_Profesional
	FOREIGN KEY (idProfesional) REFERENCES HELLFISH.Profesional(id)
GO
ALTER TABLE HELLFISH.AgendaProfesional ADD CONSTRAINT FK_AgendaProfesional_Especialidad
	FOREIGN KEY (idEspecialidad) REFERENCES HELLFISH.Especialidad(id)
GO

ALTER TABLE HELLFISH.VentaDeBonos ADD CONSTRAINT FK_VentaDeBonos_Afiliado
	FOREIGN KEY (idAfiliadoComprador) REFERENCES HELLFISH.Afiliado (id)
GO

ALTER TABLE HELLFISH.CambioDePlan ADD CONSTRAINT FK_CambioDePlan_Afiliado
	FOREIGN KEY (idAfiliado) REFERENCES HELLFISH.Afiliado (id)
GO

ALTER TABLE HELLFISH.CambioDePlan ADD CONSTRAINT FK_CambioDePlan_PlanMedico
	FOREIGN KEY (planOrigen) REFERENCES HELLFISH.PlanMedico (id)
GO

ALTER TABLE HELLFISH.CambioDePlan ADD CONSTRAINT FK_CambioDePlan_PlanMedicoOrigen
	FOREIGN KEY (planDestino) REFERENCES HELLFISH.PlanMedico (id)
GO

ALTER TABLE HELLFISH.RolFuncionalidad ADD CONSTRAINT FK_RolFuncionalidad_Funcionalidad
	FOREIGN KEY (idFuncionalidad) REFERENCES HELLFISH.Funcionalidad (id)
GO

ALTER TABLE HELLFISH.RolFuncionalidad ADD CONSTRAINT FK_RolFuncionalidad_Rol
	FOREIGN KEY (idRol) REFERENCES HELLFISH.Rol (id)
GO

ALTER TABLE HELLFISH.UsuarioRol ADD CONSTRAINT FK_UsuarioRol_Rol
	FOREIGN KEY (idRol) REFERENCES HELLFISH.Rol (id)
GO

ALTER TABLE HELLFISH.UsuarioRol ADD CONSTRAINT FK_UsuarioRol_Usuario
	FOREIGN KEY (idUsuario) REFERENCES HELLFISH.Usuario (id)
GO

ALTER TABLE HELLFISH.Bono ADD CONSTRAINT FK_Bono_VentaDeBonos
	FOREIGN KEY (idVenta) REFERENCES HELLFISH.VentaDeBonos (id)
GO

ALTER TABLE HELLFISH.Bono ADD CONSTRAINT FK_Bono_GrupoFamiliar
	FOREIGN KEY (idGrupoFamiliar) REFERENCES HELLFISH.GrupoFamiliar (id)
GO

ALTER TABLE HELLFISH.Bono ADD CONSTRAINT FK_Bono_PlanMedico
	FOREIGN KEY (planMedico) REFERENCES HELLFISH.PlanMedico (id)
GO

ALTER TABLE HELLFISH.Consulta ADD CONSTRAINT FK_Consulta_Turno
	FOREIGN KEY (idTurno) REFERENCES HELLFISH.Turnos (id)
GO

ALTER TABLE HELLFISH.Cancelacion ADD CONSTRAINT FK_Cancelacion_TipoCancelacion
	FOREIGN KEY (tipo) REFERENCES HELLFISH.TipoCancelacion (id)
GO

ALTER TABLE HELLFISH.Cancelacion ADD CONSTRAINT FK_Cancelacion_Turno
	FOREIGN KEY (idTurno) REFERENCES HELLFISH.Turnos (id)
GO

ALTER TABLE HELLFISH.Turnos ADD CONSTRAINT FK_Turno_Afiliado
	FOREIGN KEY (idAfiliado) REFERENCES HELLFISH.Afiliado (id)
GO

ALTER TABLE HELLFISH.Turnos ADD CONSTRAINT FK_Turno_ProfesionalEspecialidad
	FOREIGN KEY (idProfesional) REFERENCES HELLFISH.Profesional (id)
GO

ALTER TABLE HELLFISH.Especialidad ADD CONSTRAINT FK_Especialidad_TipoEspecialidad
	FOREIGN KEY (tipo) REFERENCES HELLFISH.TipoEspecialidad (id)
GO

ALTER TABLE HELLFISH.ProfesionalEspecialidad ADD CONSTRAINT FK_ProfesionalEspecialidad_Especialidad
	FOREIGN KEY (especialidad) REFERENCES HELLFISH.Especialidad (id)
GO

ALTER TABLE HELLFISH.ProfesionalEspecialidad ADD CONSTRAINT FK_ProfesionalEspecialidad_Profesional
	FOREIGN KEY (idProfesional) REFERENCES HELLFISH.Profesional (id)
GO

ALTER TABLE HELLFISH.Afiliado ADD CONSTRAINT FK_Afilidado_EstadoCivil
	FOREIGN KEY (idEstadoCivil) REFERENCES HELLFISH.EstadoCivil (id)
GO

ALTER TABLE HELLFISH.Afiliado ADD CONSTRAINT FK_Afilidado_GrupoFamiliar
	FOREIGN KEY (grupoFamiliar) REFERENCES HELLFISH.GrupoFamiliar (id)
GO

ALTER TABLE HELLFISH.Afiliado ADD CONSTRAINT FK_Afilidado_PlanMedico
	FOREIGN KEY (planMedico) REFERENCES HELLFISH.PlanMedico (id)
GO