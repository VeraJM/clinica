-- Creacion de constraints de PK
/*

ALTER TABLE HELLFISH.AgendaProfesional ADD CONSTRAINT PK_AgendaProfesional
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.VentaDeBonos ADD CONSTRAINT PK_VentaDeBonos
	PRIMARY KEY CLUSTERED (id)
GO

ALTER TABLE HELLFISH.CambioDePlan ADD CONSTRAINT PK_CambioDePlan
	PRIMARY KEY CLUSTERED (id)
GO
*/
/*
ALTER TABLE HELLFISH.Funcionalidad ADD CONSTRAINT PK_Funcionalidad
	PRIMARY KEY CLUSTERED (id)
GO
*/
ALTER TABLE HELLFISH.RolFuncionalidad ADD CONSTRAINT PK_RolFuncionalidad
	PRIMARY KEY CLUSTERED (idRol, idFuncionalidad)
GO
/*
ALTER TABLE HELLFISH.Rol ADD CONSTRAINT PK_Rol
	PRIMARY KEY CLUSTERED (id)
GO
*/
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
/*
ALTER TABLE HELLFISH.Persona ADD CONSTRAINT FK_Persona_TipoDocumento
	FOREIGN KEY (tipoDocumento) REFERENCES HELLFISH.TipoDocumento (id)
GO

ALTER TABLE HELLFISH.Persona ADD CONSTRAINT FK_Persona_TipoPersona
	FOREIGN KEY (tipoPersona) REFERENCES HELLFISH.TipoPersona (id)
GO
*/
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
/*PRINT 'TABLA TIPOPERSONA'
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
*/
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
	sexo char(50) default 'M' NOT NULL,
	nroAfiliadoIntegrante numeric(2),
	planMedico numeric(18) NOT NULL,
	idEstadoCivil int,
	cantHijosFamiliares int,
	grupoFamiliar int NOT NULL,
	fechaBaja datetime, /* TODO: posiblemente borrar */
	habilitado bit default 1
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

/*
CREATE TABLE HELLFISH.Bono (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idGrupoFamiliar int NOT NULL,
	idAfiliadoConsumidor int,
	planMedico numeric(18) NOT NULL,
	fechaDeImpresion datetime NOT NULL,
	idVenta int,
	utilizado bit default 0
)
GO

CREATE TABLE HELLFISH.VentaDeBonos (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	fechaDeCompra datetime NOT NULL,
	idAfiliadoComprador int NOT NULL,
	planMedico numeric(18) NOT NULL,
	cantidadBonos int NOT NULL,
	total numeric(18) NOT NULL,

)
GO

*/
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
/*
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
*/
------------------------------------------------------------------------
PRINT 'TABLA Bono'
GO

CREATE TABLE HELLFISH.Bono (
	id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idGrupoFamiliar int, /* TODO : revisar */
	idAfiliadoConsumidor int,
	planMedico numeric(18) NOT NULL,
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
	id INT IDENTITY PRIMARY KEY,
	descripcion VARCHAR(255)
);

 INSERT INTO HELLFISH.SINTOMA (DESCRIPCION)
 SELECT DISTINCT Consulta_Sintomas 
 FROM gd_esquema.Maestra 
 WHERE Consulta_Sintomas is not null;
 ------------------------------------------------------------------------
CREATE TABLE HELLFISH.Diagnostico(
	id INT IDENTITY primary key,
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
/*
------------------------------------------------------------------------
INSERT INTO HELLFISH.CONSULTA(sintomas,enfermedades,idTurno)
(select Consulta_Sintomas,Consulta_Enfermedades,Turno_Numero from gd_esquema.Maestra
where Consulta_Sintomas is not null and Consulta_Enfermedades is not null and Turno_Numero is not null);
*/

PRINT 'TABLA TURNOS'
GO

CREATE TABLE HELLFISH.TURNOS(
	id INT IDENTITY PRIMARY KEY,
	TURNO_NUMERO INT,
	fecha DATETIME,
	idProfesional INT,
	idAfiliado INT,
	ASISTENCIA BIT DEFAULT 0
);

INSERT INTO HELLFISH.TURNOS (TURNO_NUMERO,fecha,idAfiliado,idProfesional)
	SELECT DISTINCT Turno_numero,Turno_Fecha, AF.id, PR.id
		FROM gd_esquema.Maestra M ,
		HELLFISH.PROFESIONAL PR, 
		HELLFISH.AFILIADO AF
		WHERE M.Paciente_Dni  = af.numeroDocumento
		AND M.Medico_Dni  = pr.numeroDocumento;
------------------------------------------------------------------------
/*
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
*/
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
	/*horaDesde time(7) NOT NULL,
	horaHasta time(7) NOT NULL */
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

PRINT 'TABLA CENCELACION'
GO

CREATE TABLE HELLFISH.Cancelacion (
	id int NOT NULL,
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
	id int NOT NULL,
	idAfiliado int NOT NULL,
	planOrigen numeric(18) NOT NULL,
	planDestino numeric(18) NOT NULL,
	fecha datetime default getdate() NOT NULL,
	motivo varchar(255),
)
GO