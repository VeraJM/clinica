USE [GD2C2016]
GO

--DROP SCHEMA HELLFISH
--GO
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

CREATE TABLE HELLFISH.VentaDeBonos ( 
	id int NOT NULL,
	fechaDeCompra datetime NOT NULL,
	idAfiliadoComprador int NOT NULL,
	planMedico numeric(18) NOT NULL,
	cantidadBonos int NOT NULL,
	total numeric(18) NOT NULL
)
GO

CREATE TABLE HELLFISH.CambioDePlan ( 
	id int NOT NULL,
	idAfiliado int NOT NULL,
	planOrigen numeric(18) NOT NULL,
	planDestino numeric(18) NOT NULL,
	fecha datetime NOT NULL
)
GO

CREATE TABLE HELLFISH.Funcionalidad ( 
	id int NOT NULL,
	descripcion varchar(255) NOT NULL
)
GO

CREATE TABLE HELLFISH.RolFuncionalidad ( 
	idRol int NOT NULL,
	idFuncionalidad int NOT NULL
)
GO

CREATE TABLE HELLFISH.Rol ( 
	id int NOT NULL,
	descripcion varchar(255) NOT NULL,
	alta bit DEFAULT 1 NOT NULL
)
GO

CREATE TABLE HELLFISH.Usuario ( 
	id int NOT NULL,
	username varchar(255) NOT NULL,
	password varchar(64) NOT NULL,
	intentosFallidos smallint DEFAULT 0 NOT NULL,
	alta bit DEFAULT 1 NOT NULL,
	idPersona int NOT NULL
)
GO

CREATE TABLE HELLFISH.UsuarioRol ( 
	idUsuario int NOT NULL,
	idRol int NOT NULL,
	alta bit DEFAULT 1 NOT NULL
)
GO

CREATE TABLE HELLFISH.Bono ( 
	id int NOT NULL,
	idGrupoFamiliar int NOT NULL,
	idAfiliadoConsumidor int,
	planMedico numeric(18) NOT NULL,
	fechaDeCompra datetime NOT NULL,
	idVenta int
)
GO

CREATE TABLE HELLFISH.BonoConsulta ( 
	id int NOT NULL,
	idConsulta int NOT NULL,
	idBono int NOT NULL
)
GO

CREATE TABLE HELLFISH.Consulta ( 
	id int NOT NULL,
	sintomas varchar(255),
	enfermedades varchar(255),
	idTurno int NOT NULL
)
GO

CREATE TABLE HELLFISH.Cancelacion ( 
	id int NOT NULL,
	descripcion varchar(255) NOT NULL,
	tipo int NOT NULL,
	turno int NOT NULL
)
GO

CREATE TABLE HELLFISH.TipoCancelacion ( 
	id int NOT NULL,
	deAfiliado bit NOT NULL,
	descripcion varchar(255) NOT NULL
)
GO

CREATE TABLE HELLFISH.Turno ( 
	id int NOT NULL,
	idProfesionalEspecialidad int NOT NULL,
	fecha datetime NOT NULL,
	afiliado int
)
GO

CREATE TABLE HELLFISH.PlanMedico ( 
	codigo numeric(18) NOT NULL,
	descripcion varchar(255) NOT NULL,
	precioBonoConsulta numeric(18) NOT NULL,
	precioBonoFarmacia numeric(18) NOT NULL
)
GO

CREATE TABLE HELLFISH.TipoEspecialidad ( 
	codigo numeric(18) NOT NULL,
	descripcion varchar(255) NOT NULL
)
GO

CREATE TABLE HELLFISH.Especialidad ( 
	codigo numeric(18) NOT NULL,
	descripcion varchar(255) NOT NULL,
	tipo numeric(18) NOT NULL
)
GO

CREATE TABLE HELLFISH.Profesional ( 
	nroMatricula numeric(18) NOT NULL,
	id int NOT NULL
)
GO

CREATE TABLE HELLFISH.TipoDocumento ( 
	id int NOT NULL,
	descripcion char(20) NOT NULL
)
GO

CREATE TABLE HELLFISH.TipoPersona ( 
	id int NOT NULL,
	descripcion varchar(11) NOT NULL
)
GO

CREATE TABLE HELLFISH.EstadoCivil ( 
	descripcion char(20) NOT NULL,
	id int NOT NULL
)
GO

CREATE TABLE HELLFISH.GrupoFamiliar ( 
	nroAfiliadoBase numeric(18) NOT NULL,
	id int NOT NULL
)
GO

CREATE TABLE HELLFISH.ProfesionalEspecialidad ( 
	idProfesional int NOT NULL,
	especialidad numeric(18) NOT NULL,
	id int NOT NULL
)
GO

CREATE TABLE HELLFISH.Afiliado ( 
	nroAfiliadoIntegrante numeric(2),
	planMedico numeric(18) NOT NULL,
	idEstadoCivil int,
	grupoFamiliar int NOT NULL,
	id int NOT NULL
)
GO

CREATE TABLE HELLFISH.Persona ( 
	id int NOT NULL,
	nombre varchar(255) NOT NULL,
	apellido varchar(255) NOT NULL,
	tipoDocumento int NOT NULL,
	numeroDocumento numeric(18) NOT NULL,
	direccion varchar(255) NOT NULL,
	telefono numeric(18) NOT NULL,
	email varchar(255) NOT NULL,
	fechaNacimiento datetime NOT NULL,
	sexo char(1) NOT NULL,
	tipoPersona int NOT NULL
)
GO

-- Creacion de constraints de PK

ALTER TABLE HELLFISH.AgendaProfesional ADD CONSTRAINT PK_AgendaProfesional 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.VentaDeBonos ADD CONSTRAINT PK_VentaDeBonos 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.CambioDePlan ADD CONSTRAINT PK_CambioDePlan 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.Funcionalidad ADD CONSTRAINT PK_Funcionalidad 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.RolFuncionalidad ADD CONSTRAINT PK_RolFuncionalidad 
	PRIMARY KEY CLUSTERED (idRol, idFuncionalidad)
GO

ALTER TABLE HELLFISH.Rol ADD CONSTRAINT PK_Rol 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.Usuario ADD CONSTRAINT PK_Usuario 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.UsuarioRol ADD CONSTRAINT PK_UsuarioRol 
	PRIMARY KEY CLUSTERED (idUsuario, idRol)
GO

ALTER TABLE HELLFISH.Bono ADD CONSTRAINT PK_Bono 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.BonoConsulta ADD CONSTRAINT PK_BonoConsulta 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.Consulta ADD CONSTRAINT PK_Consulta 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.Cancelacion ADD CONSTRAINT PK_Cancelacion 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.TipoCancelacion ADD CONSTRAINT PK_TipoCancelacion 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.Turno ADD CONSTRAINT PK_Turno 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.PlanMedico ADD CONSTRAINT PK_PlanMedico 
	PRIMARY KEY CLUSTERED (codigo)
GO

ALTER TABLE HELLFISH.TipoEspecialidad ADD CONSTRAINT PK_TipoEspecialidad 
	PRIMARY KEY CLUSTERED (codigo)
GO

ALTER TABLE HELLFISH.Especialidad ADD CONSTRAINT PK_Especialidad 
	PRIMARY KEY CLUSTERED (codigo)
GO

ALTER TABLE HELLFISH.Profesional ADD CONSTRAINT PK_Profesional 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.TipoDocumento ADD CONSTRAINT PK_TipoDocumento 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.TipoPersona ADD CONSTRAINT PK_TipoPersona 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.EstadoCivil ADD CONSTRAINT PK_EstadoCivil 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.GrupoFamiliar ADD CONSTRAINT PK_GrupoFamiliar 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.ProfesionalEspecialidad ADD CONSTRAINT PK_ProfesionalEspecialidad 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.Afiliado ADD CONSTRAINT PK_Afilidado 
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.Persona ADD CONSTRAINT PK_Persona 
	PRIMARY KEY CLUSTERED (id)
GO

-- Creacion de constraints de unique

ALTER TABLE HELLFISH.Profesional
	ADD CONSTRAINT UQ_Profesional_nroMatricula UNIQUE (nroMatricula)
GO

ALTER TABLE HELLFISH.GrupoFamiliar
	ADD CONSTRAINT UQ_GrupoFamiliar_nroAfiliadoBase UNIQUE (nroAfiliadoBase)
GO

-- Creacion de constraints de FK

ALTER TABLE HELLFISH.AgendaProfesional ADD CONSTRAINT FK_AgendaProfesional_ProfesionalEspecialidad 
	FOREIGN KEY (idProfesionalEspecialidad) REFERENCES HELLFISH.ProfesionalEspecialidad (id)
GO

ALTER TABLE HELLFISH.VentaDeBonos ADD CONSTRAINT FK_VentaDeBonos_Afiliado 
	FOREIGN KEY (idAfiliadoComprador) REFERENCES HELLFISH.Afiliado (id)
GO

ALTER TABLE HELLFISH.VentaDeBonos ADD CONSTRAINT FK_VentaDeBonos_PlanMedico 
	FOREIGN KEY (planMedico) REFERENCES HELLFISH.PlanMedico (codigo)
GO

ALTER TABLE HELLFISH.CambioDePlan ADD CONSTRAINT FK_CambioDePlan_Afiliado 
	FOREIGN KEY (idAfiliado) REFERENCES HELLFISH.Afiliado (id)
GO

ALTER TABLE HELLFISH.CambioDePlan ADD CONSTRAINT FK_CambioDePlan_PlanMedico 
	FOREIGN KEY (planOrigen) REFERENCES HELLFISH.PlanMedico (codigo)
GO

ALTER TABLE HELLFISH.CambioDePlan ADD CONSTRAINT FK_CambioDePlan_PlanMedicoOrigen 
	FOREIGN KEY (planDestino) REFERENCES HELLFISH.PlanMedico (codigo)
GO

ALTER TABLE HELLFISH.RolFuncionalidad ADD CONSTRAINT FK_RolFuncionalidad_Funcionalidad 
	FOREIGN KEY (idFuncionalidad) REFERENCES HELLFISH.Funcionalidad (id)
GO

ALTER TABLE HELLFISH.RolFuncionalidad ADD CONSTRAINT FK_RolFuncionalidad_Rol 
	FOREIGN KEY (idRol) REFERENCES HELLFISH.Rol (id)
GO

ALTER TABLE HELLFISH.Usuario ADD CONSTRAINT FK_Usuario_Persona 
	FOREIGN KEY (idPersona) REFERENCES HELLFISH.Persona (id)
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
	FOREIGN KEY (planMedico) REFERENCES HELLFISH.PlanMedico (codigo)
GO

ALTER TABLE HELLFISH.BonoConsulta ADD CONSTRAINT FK_BonoConsulta_Bono 
	FOREIGN KEY (idBono) REFERENCES HELLFISH.Bono (id)
GO

ALTER TABLE HELLFISH.BonoConsulta ADD CONSTRAINT FK_BonoConsulta_Consulta 
	FOREIGN KEY (idConsulta) REFERENCES HELLFISH.Consulta (id)
GO

ALTER TABLE HELLFISH.Consulta ADD CONSTRAINT FK_Consulta_Turno 
	FOREIGN KEY (idTurno) REFERENCES HELLFISH.Turno (id)
GO

ALTER TABLE HELLFISH.Cancelacion ADD CONSTRAINT FK_Cancelacion_TipoCancelacion 
	FOREIGN KEY (tipo) REFERENCES HELLFISH.TipoCancelacion (id)
GO

ALTER TABLE HELLFISH.Cancelacion ADD CONSTRAINT FK_Cancelacion_Turno 
	FOREIGN KEY (turno) REFERENCES HELLFISH.Turno (id)
GO

ALTER TABLE HELLFISH.Turno ADD CONSTRAINT FK_Turno_Afiliado 
	FOREIGN KEY (afiliado) REFERENCES HELLFISH.Afiliado (id)
GO

ALTER TABLE HELLFISH.Turno ADD CONSTRAINT FK_Turno_ProfesionalEspecialidad 
	FOREIGN KEY (idProfesionalEspecialidad) REFERENCES HELLFISH.ProfesionalEspecialidad (id)
GO

ALTER TABLE HELLFISH.Especialidad ADD CONSTRAINT FK_Especialidad_TipoEspecialidad 
	FOREIGN KEY (tipo) REFERENCES HELLFISH.TipoEspecialidad (codigo)
GO

ALTER TABLE HELLFISH.Profesional ADD CONSTRAINT FK_Profesional_Persona 
	FOREIGN KEY (id) REFERENCES HELLFISH.Persona (id)
GO

ALTER TABLE HELLFISH.ProfesionalEspecialidad ADD CONSTRAINT FK_ProfesionalEspecialidad_Especialidad 
	FOREIGN KEY (especialidad) REFERENCES HELLFISH.Especialidad (codigo)
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

ALTER TABLE HELLFISH.Afiliado ADD CONSTRAINT FK_Afilidado_Persona 
	FOREIGN KEY (id) REFERENCES HELLFISH.Persona (id)
GO

ALTER TABLE HELLFISH.Afiliado ADD CONSTRAINT FK_Afilidado_PlanMedico 
	FOREIGN KEY (planMedico) REFERENCES HELLFISH.PlanMedico (codigo)
GO

ALTER TABLE HELLFISH.Persona ADD CONSTRAINT FK_Persona_TipoDocumento 
	FOREIGN KEY (tipoDocumento) REFERENCES HELLFISH.TipoDocumento (id)
GO

ALTER TABLE HELLFISH.Persona ADD CONSTRAINT FK_Persona_TipoPersona 
	FOREIGN KEY (tipoPersona) REFERENCES HELLFISH.TipoPersona (id)
GO

-- Creacion de Stored Procedures para migracion de datos

-- Stored procedures

-- Funciones

-- Indexes

-- ------------------
-- MIGRACION DE DATOS
-- ------------------

-- ------------------------------------------------
-- STORED PROCEDURES Y FUNCIONES PARA LA APLICACION
-- ------------------------------------------------

