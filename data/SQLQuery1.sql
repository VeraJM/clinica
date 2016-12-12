/*
select * from gd_esquema.Maestra
order by Publicacion_Cod, Compra_Cantidad;

select * from gd_esquema.Maestra
having count(Publicacion_Cod)>1;


select * from gd_esquema.Maestra
where Publicacion_Tipo = 'Subasta'
order by Publicacion_Cod;

select * from gd_esquema.Maestra
where Publ_Cli_Apeliido is not null
order by Publicacion_Cod;

select * from gd_esquema.Maestra
WHERE [Compra_Cantidad]IS NOT NULL
order by Publ_Empresa_Razon_Social;

SELECT [Publ_Cli_Dni],[Publicacion_Cod] FROM gd_esquema.Maestra
WHERE [Publ_Cli_Dni] IS NOT NULL
GROUP BY [Publ_Cli_Dni],[Publicacion_Cod]
HAVING COUNT(*)>1

SELECT * FROM gd_esquema.Maestra
WHERE [Publ_Cli_Dni] = 87920065
AND [Publicacion_Cod] = 69796

select * from gd_esquema.Maestra
WHERE [Calificacion_Codigo]IS NOT NULL
AND [Cli_Dni] IS NOT NULL

select * from gd_esquema.Maestra
WHERE [Calificacion_Codigo]IS NOT NULL
AND [Publ_Cli_Dni] IS NOT NULL
delete CLAVE_MOTOR.Calificacion

order by Publ_Empresa_Razon_Social;

SELECT *
FROM [GD1C2016].[gd_esquema].[Maestra]
  WHERE Publicacion_Cod = 12402;


  SELECT DISTINCT Publ_Empresa_Razon_Social, COUNT(*) FROM gd_esquema.MAESTRA
  
  GROUP BY Publ_Empresa_Razon_Social
  ORDER BY 1;
 

USE [GD1C2016]
GO
 select * from gd_esquema.Maestra
order by Publ_Empresa_Razon_Social;

IF NOT EXISTS(SELECT 1 FROM information_schema.schemata WHERE
schema_name='CLAVE_MOTOR')
EXEC ('create schema CLAVE_MOTOR AUTHORIZATION gd');
GO 

SELECT * FROM CLAVE_MOTOR.Funcionalidad, CLAVE_MOTOR.Rol;



SELECT DISTINCT REPLACE(Publ_Empresa_Razon_Social,'º:','') from gd_esquema.Maestra;
SELECT * from CLAVE_MOTOR.Usuario;
SELECT Rol.rol_id
				FROM CLAVE_MOTOR.Rol
				WHERE Rol.rol_descripcion = 'Administrador'


SELECT * FROM gd_esquema.Maestra
WHERE Publ_Cli_Dni = 59628999;

SELECT * FROM gd_esquema.Maestra
WHERE Cli_Dni = 59628999;


SELECT * FROM CLAVE_MOTOR.USUARIO;


SELECT DISTINCT Maestra.Cli_Nombre,Maestra.Cli_Apeliido
FROM gd_esquema.Maestra
UNION
SELECT DISTINCT Maestra.Publ_Cli_Nombre, Maestra.Publ_Cli_Apeliido
FROM gd_esquema.Maestra;

SELECT * FROM gd_esquema.Maestra
Where Publ_Empresa_Razon_Social = 'Razon Social Nº:2';

SELECT DISTINCT Maestra.Cli_Dom_Calle,Maestra.Cli_Nro_Calle,Maestra.Cli_Cod_Postal,Maestra.Cli_Depto,Maestra.Cli_Piso
FROM gd_esquema.Maestra
UNION
SELECT DISTINCT Maestra.Publ_Cli_Dom_Calle, Maestra.Publ_Cli_Nro_Calle,Maestra.Publ_Cli_Cod_Postal,Maestra.Publ_Cli_Depto,Maestra.Publ_Cli_Piso
FROM gd_esquema.Maestra
UNION 
SELECT DISTINCT Maestra.Publ_Empresa_Dom_Calle, Maestra.Publ_Empresa_Nro_Calle,Maestra.Publ_Empresa_Cod_Postal,Maestra.Publ_Empresa_Depto,Maestra.Publ_Empresa_Piso
FROM gd_esquema.Maestra;

SELECT * from CLAVE_MOTOR.Cliente;

SELECT TOP 1 gd_esquema.Maestra.Publicacion_Rubro_Descripcion
					FROM gd_esquema.Maestra
					WHERE Maestra.Publ_Empresa_Cuit = '95-79908553-28'
					ORDER BY COUNT(*), 1;

SELECT TOP 1 gd_esquema.Maestra.Publicacion_Rubro_Descripcion
					FROM gd_esquema.Maestra
					WHERE Maestra.Publ_Empresa_Cuit = '95-79908553-28'
					GROUP BY Maestra.Publicacion_Rubro_Descripcion
					ORDER BY COUNT(*) DESC;

SELECT gd_esquema.Maestra.Publicacion_Rubro_Descripcion, COUNT(*)
					FROM gd_esquema.Maestra
					WHERE Maestra.Publ_Empresa_Cuit = '95-79908553-28'
					GROUP BY Maestra.Publicacion_Rubro_Descripcion
					ORDER BY COUNT(*) DESC;

SELECT * FROM CLAVE_MOTOR.Empresa;

SELECT * FROM CLAVE_MOTOR.USUARIO;
SELECT * FROM CLAVE_MOTOR.Rubro;

SELECT DISTINCT M.Publicacion_Visibilidad_Cod, M.Publicacion_Visibilidad_Desc,M.Publicacion_Visibilidad_Porcentaje,M.Publicacion_Visibilidad_Precio
FROM gd_esquema.Maestra M;

SELECT * FROM gd_esquema.Maestra;
SELECT DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 
     TABLE_NAME = 'Maestra' AND 
     COLUMN_NAME = 'Publicacion_Fecha';


SELECT * FROM gd_esquema.Maestra
WHERE Publicacion_Cod = 12828;

SELECT * 
FROM CLAVE_MOTOR.Publicacion P1, CLAVE_MOTOR.Publicacion P2
WHERE P1.publ_descripcion = P2.publ_descripcion; AND P1.publ_id <> P2.publ_id;

/* COMPRAS */
SELECT * FROM gd_esquema.Maestra
WHERE Compra_Cantidad IS NOT NULL;



(SELECT M.Compra_Fecha,
		M.Compra_Cantidad,
		M.Publicacion_Cod,
		(SELECT U.usua_id
		FROM CLAVE_MOTOR.Usuario U
		WHERE U.usua_username = CLAVE_MOTOR.FX_USERNAME_CLIENTE(M.Publ_Cli_Nombre,M.Publ_Cli_Apeliido))
	FROM gd_esquema.Maestra M
	WHERE M.Compra_Cantidad IS NOT NULL);


SELECT * FROM gd_esquema.Maestra
WHERE Publicacion_Cod IS NULL;

SELECT * FROM gd_esquema.Maestra
WHERE Factura_Nro IS NOT NULL;

SELECT * FROM gd_esquema.Maestra
WHERE Publ_Empresa_Razon_Social IS  NULL;

SELECT Maestra.Publicacion_Cod, COUNT(*) FROM gd_esquema.Maestra
GROUP BY Maestra.Publicacion_Cod
ORDER BY Maestra.Publicacion_Cod;


SELECT P.publ_id
FROM CLAVE_MOTOR.Publicacion P
WHERE p.publ_id <> ANY (SELECT M1.Publicacion_Cod
						FROM gd_esquema.Maestra M1);

SELECT M1.Publicacion_Cod
FROM gd_esquema.Maestra M1
WHERE NOT EXISTS(SELECT P.publ_id
			FROM CLAVE_MOTOR.Publicacion P
			WHERE P.publ_id = M1.Publicacion_Cod);                       


SELECT * FROM CLAVE_MOTOR.Publicacion WHERE publ_id = 69628;

SELECT * FROM gd_esquema.Maestra WHERE Publicacion_Cod = 69628;


SELECT DISTINCT M.Publicacion_Cod,M.Publicacion_Descripcion,M.Publicacion_Stock,M.Publicacion_Fecha,M.Publicacion_Fecha_Venc,
		M.Publicacion_Precio,
		(SELECT CASE WHEN M.Publicacion_Tipo = 'Compra Inmediata' THEN 1
					ELSE 2 END),
		(SELECT CASE WHEN M.Publicacion_Estado = 'Publicada' THEN 1
					ELSE 0 END),
		M.Publicacion_Visibilidad_Cod,
		(SELECT U.usua_id
		FROM CLAVE_MOTOR.Usuario U
		WHERE U.usua_username = CLAVE_MOTOR.FX_USERNAME_EMPRESA(M.Publ_Empresa_Razon_Social)) AS USUARIO,
		(SELECT R.rubr_id
		FROM CLAVE_MOTOR.Rubro R
		WHERE R.rubr_descripcionCorta = M.Publicacion_Rubro_Descripcion)
	FROM gd_esquema.Maestra M
	ORDER BY Publicacion_Cod;

SELECT * FROM gd_esquema.Maestra WHERE Publicacion_descripcion = 'Descripcion Publicación 5745112351';

SELECT M.Oferta_Fecha,
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
	WHERE M.Oferta_Fecha IS NOT NULL AND M.Cli_Nombre IS NOT NULL
	GROUP BY Publicacion_Cod;


SELECT * FROM gd_esquema.Maestra
WHERE Calificacion_Codigo IS NOT NULL;
AND Cli_Mail IS NULL;


SELECT c.comp_id, C.comp_idPublicacion,C.comp_idUsuario
		FROM CLAVE_MOTOR.Compra C, gd_esquema.Maestra M
		WHERE C.comp_fecha = M.Publicacion_Fecha
		AND C.comp_idPublicacion = (SELECT P.publ_id
									FROM CLAVE_MOTOR.Publicacion P
									WHERE P.publ_descripcion = M.Publicacion_Descripcion)
		AND C.comp_idUsuario = (SELECT U.usua_id
								FROM CLAVE_MOTOR.Usuario U
								WHERE U.usua_username = CLAVE_MOTOR.FX_USERNAME_CLIENTE(M.Cli_Nombre,M.Cli_Apeliido))
		AND M.Calificacion_Codigo IS NOT NULL;

Select DISTINCT C.comp_id FROM gd_esquema.Maestra M, CLAVE_MOTOR.Compra C
WHERE C.comp_idPublicacion = M.Publicacion_Cod
AND M.Calificacion_Codigo IS NOT NULL;

SELECT * FROM gd_esquema.Maestra WHERE Calificacion_Codigo IS NULL;
SELECT * from CLAVE_MOTOR.Compra;
SELECT M.Calificacion_Codigo,
	M.Calificacion_Cant_Estrellas,
	M.Calificacion_Descripcion,
	(SELECT	c.comp_id
		FROM CLAVE_MOTOR.Compra C
		WHERE M.Calificacion_Codigo IS NOT NULL
		AND C.comp_fecha = M.Publicacion_Fecha
		AND C.comp_idPublicacion = M.Publicacion_Cod
		AND C.comp_idUsuario = (SELECT U.usua_id
								FROM CLAVE_MOTOR.Usuario U
								WHERE U.usua_username = CLAVE_MOTOR.FX_USERNAME_CLIENTE(M.Cli_Nombre,M.Cli_Apeliido))) AS COMPRA_ID,
	(SELECT U.usua_id
		FROM CLAVE_MOTOR.Usuario U
		WHERE U.usua_username = CLAVE_MOTOR.FX_USERNAME_CLIENTE(M.Cli_Nombre,M.Cli_Apeliido)) AS USUARIO_ID
	FROM gd_esquema.Maestra M
	WHERE M.Calificacion_Codigo IS NOT NULL;

SELECT DISTINCT * 
FROM gd_esquema.Maestra M RIGHT JOIN CLAVE_MOTOR.Compra C ON M.Publicacion_Cod = C.comp_idPublicacion
WHERE M.Calificacion_Codigo IS NOT NULL;
/*
Toro
FABRIZIO */
SELECT CLAVE_MOTOR.FX_GET_ID_CLIENTE(M.Cli_Dni)
FROM gd_esquema.Maestra M
WHERE M.Cli_Dni IS NOT NULL;

SELECT DISTINCT [Publicacion_Estado] FROM gd_esquema.Maestra


SELECT * FROM gd_esquema.Maestra M
WHERE M.Calificacion_Codigo = 76351;

SELECT * FROM CLAVE_MOTOR.COMPRA C
WHERE C.comp_idPublicacion = 47542;

SELECT * FROM CLAVE_MOTOR.Asignaciones;
SELECT * FROM CLAVE_MOTOR.Usuario
SELECT * FROM CLAVE_MOTOR.Compra
SELECT * FROM CLAVE_MOTOR.rubro
ORDER BY usua_username; 
WHERE usua_username = 'Razon Social N68';

DECLARE @pass varchar(34)
SET @pass = CLAVE_MOTOR.FX_HASH_PASSWORD('admin');

EXEC CLAVE_MOTOR.sp_LOGIN 'admin', @pass

SELECT * FROM [CLAVE_MOTOR].[FuncionalidadRol];
SELECT * FROM [CLAVE_MOTOR].[Asignaciones]

SELECT * FROM [gd_esquema].[Maestra]
WHERE Calificacion_Codigo IS NOT NULL;

update [CLAVE_MOTOR].[Usuario]
set usua_intentosLogin = 0


SELECT *  FROM [CLAVE_MOTOR].rol
SELECT *  FROM [CLAVE_MOTOR].Empresa
select * from [CLAVE_MOTOR].[Usuario];
select * from [CLAVE_MOTOR].[Cliente];
SELECT *  FROM [CLAVE_MOTOR].[Publicacion];
SELECT * FROM [CLAVE_MOTOR].[Compra];
SELECT * FROM [CLAVE_MOTOR].[Oferta];
SELECT * FROM [CLAVE_MOTOR].[MedioPago];
SELECT * FROM [CLAVE_MOTOR].[Rubro];
SELECT * FROM [CLAVE_MOTOR].[Factura];

select DISTINCT [Publ_Cli_Dni],[Cli_Dni],[Publicacion_Cod],[Compra_Fecha] from gd_esquema.Maestra where [Compra_Fecha] is not null
and Publicacion_Tipo = 'Subasta';


SELECT Distinct Publicacion_Tipo,publicacion_estado FROM [gd_esquema].[Maestra]

order by publ_idUsuario desc;
SELECT *  FROM [CLAVE_MOTOR].[Domicilio]
SELECT *  FROM [CLAVE_MOTOR].[Visibilidad]

select rol_id, rol_descripcion, rol_habilitado from CLAVE_MOTOR.Rol
select * from CLAVE_MOTOR.asignaciones
select * from CLAVE_MOTOR.FuncionalidadRol
use GD1C2016
drop procedure CLAVE_MOTOR.sp_NUEVO_CLIENTE;
drop procedure CLAVE_MOTOR.sp_NUEVO_USUARIO;
drop procedure CLAVE_MOTOR.sp_CREAR_EMPRESA;

select * from  [CLAVE_MOTOR].Cliente Order by clie_idUsuario Desc;


SELECT * FROM CLAVE_MOTOR.Publicacion
WHERE publ_estado = 'Activa'
OR publ_estado = 'Pausada'
ORDER BY publ_idVisibilidad ASC OFFSET 20000 ROWS FETCH NEXT 10 ROWS ONLY;

select count(*) from clave_motor.publicacion

SELECT COUNT(*) FROM CLAVE_MOTOR.COMPRA
UNION
SELECT COUNT(*) FROM CLAVE_MOTOR.OFERTA


SELECT [comp_id] AS 'ID',[comp_fecha] AS 'Fecha',[comp_cantidad] AS 'Cantidad',null AS 'Oferta',[comp_idPublicacion] AS 'Publicacion' FROM CLAVE_MOTOR.COMPRA
WHERE comp_idUsuario = 1
UNION
SELECT [ofer_id] AS 'ID',[ofer_fecha] AS 'Fecha',null AS 'Cantidad',[ofer_monto] AS 'Oferta',[ofer_idPublicacion] AS 'Publicacion' FROM CLAVE_MOTOR.OFERTA
WHERE OFER_idUsuario = 1
ORDER BY 1 OFFSET 1 ROWS FETCH NEXT 3 ROWS ONLY

insert into CLAVE_MOTOR.Asignaciones([usua_id],[idRol])
VALUES(1,2)

delete CLAVE_MOTOR.Asignaciones
where [usua_id] =1
and idRol = 2


SELECT * FROM [CLAVE_MOTOR].[Oferta]
WHERE ofer_idUsuario = 1;

INSERT INTO CLAVE_MOTOR.Calificacion([cali_cantEstrellas],[cali_descripcion],[cali_idOferta],[cali_idUsuario])
VALUES (5,'ASD',19119,1)

SELECT * FROM [CLAVE_MOTOR].[Calificacion]

SELECT * FROM [CLAVE_MOTOR].[Factura]

SELECT COUNT(*) FROM CLAVE_MOTOR.Factura JOIN CLAVE_MOTOR.ItemFactura ON [fact_id] = [item_idFactura] JOIN CLAVE_MOTOR.Empresa ON [fact_idUsuario] = empr_idUsuario

SELECT rol_id FROM  CLAVE_MOTOR.ROL AS ROL JOIN  CLAVE_MOTOR.ASIGNACIONES AS ASIG ON ASIG.idRol = ROL.rol_id
								JOIN  CLAVE_MOTOR.USUARIO AS US ON ASIG.usua_id = US.usua_id
							WHERE US.usua_username = 'admin'	




SELECT min(publicacion_fecha) FROM [gd_esquema].[Maestra]

WHERE [Factura_Nro] IS NOT NULL
and [Factura_Nro]=121418
AND Publicacion_Cod IS NULL
and Publ_Empresa_Razon_Social is null



Publicacion_Cod = 64708



121315
121418
AND [Publ_Empresa_Razon_Social] IS NULL
173670

SELECT * FROM [CLAVE_MOTOR].[Publicacion]
where publ_estado <> 'Finalizada'


SELECT * FROM [CLAVE_MOTOR].Asignaciones

SELECT * FROM [CLAVE_MOTOR].[Publicacion]
where publ_estado <> 'Finalizada'


SELECT * FROM [CLAVE_MOTOR].[Visibilidad]

SELECt TOP 5 E.empr_id,E.empr_razonSocial, V.visi_descripcion FROM CLAVE_MOTOR.Empresa E JOIN CLAVE_MOTOR.Publicacion  P ON E.empr_idUsuario = P.publ_idUsuario
JOIN CLAVE_MOTOR.Visibilidad V ON P.publ_idVisibilidad = V.visi_id
WHERE P.publ_fechaInicio < CONVERT(DATETIME,'01-04-2015',105) 
OR p.publ_fechaVencimiento > CONVERT(DATETIME,'01-01-2015',105)
GROUP BY E.empr_id,E.empr_razonSocial,V.visi_descripcion
ORDER BY SUM(P.publ_stock)


SELECT TOP 5 C.clie_id as 'ID',C.clie_nombre as 'Nombre',C.clie_apellido as 'Apellido',sum(CO.COMP_CANTIDAD) as 'Cantidad',R.rubr_descripcionCorta AS 'Rubro'  FROM CLAVE_MOTOR.Cliente C JOIN CLAVE_MOTOR.Compra CO ON C.clie_idUsuario = CO.comp_idUsuario
JOIN CLAVE_MOTOR.Publicacion P ON CO.comp_idPublicacion = P.publ_id
JOIN CLAVE_MOTOR.Rubro R ON R.rubr_id = P.publ_idRubro 
WHERE CO.comp_fecha BETWEEN CONVERT(DATETIME,'01-01-2015',105) AND CONVERT(DATETIME,'01-04-2015',105)
AND R.rubr_id = 1
GROUP BY C.clie_id,C.clie_nombre,R.rubr_descripcionCorta,C.clie_apellido ORDER BY sum(CO.COMP_CANTIDAD) DESC


Select top 5 E.empr_id AS 'ID',E.empr_razonSocial AS 'Razon Social',SUM(F.fact_total) AS 'Monto' FROM CLAVE_MOTOR.Empresa E JOIN CLAVE_MOTOR.Factura F ON E.empr_idUsuario = F.fact_idUsuario
WHERE F.fact_fecha BETWEEN CONVERT(DATETIME,'01-01-2015',105) AND CONVERT(DATETIME,'01-04-2015',105)
GROUP BY E.empr_id,E.empr_razonSocial ORDER BY SUM(F.fact_total) desc


insert into CLAVE_MOTOR.Asignaciones([usua_id],[idRol])
(SELECT clie_idUsuario,2 FROM CLAVE_MOTOR.cliente )

SELECT * FROM [CLAVE_MOTOR].Asignaciones
*/
SELECT * FROM HELLFISH.Rol;
SELECT * FROM HELLFISH.Funcionalidad;
SELECT * FROM HELLFISH.ROLFuncionalidad
WHERE idRol = 1
ORDER BY idRol;

SELECT * FROM HELLFISH.Afiliado;
SELECT * FROM HAKUNADATATA.Afiliados;
SELECT * FROM HELLFISH.Profesional;
SELECT * FROM HAKUNADATATA.Profesionales;
SELECT * FROM HELLFISH.PlanMedico;

sELECT * FROM gd_esquema.Maestra
where Especialidad_Codigo is not null
and Tipo_Especialidad_Codigo is null;
select distinct Plan_Med_Precio_Bono_Consulta from gd_esquema.Maestra;

SELECT DISTINCT Paciente_Nombre, Paciente_Apellido,1,Paciente_Dni,Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac FROM gd_esquema.Maestra
WHERE Paciente_Dni IS NOT NULL
ORDER BY Paciente_Apellido, Paciente_Direccion;

SELECT DISTINCT M1.Paciente_Nombre, M1.Paciente_Apellido,1,M1.Paciente_Dni,M1.Paciente_Direccion,M1.Paciente_Telefono,M1.Paciente_Mail,M1.Paciente_Fecha_Nac FROM gd_esquema.Maestra M1
JOIN GD_ESQUEMA.MAESTRA M2 ON M1.PACIENTE_APELLIDO = M2.PACIENTE_APELLIDO AND M1.PACIENTE_DIRECCION = M2.PACIENTE_DIRECCION AND M1.Paciente_Dni <> M2.Paciente_Dni;
WHERE

SELECT DISTINCT Paciente_Apellido, count(*) FROM gd_esquema.Maestra
group by Paciente_Apellido;

select distinct Medico_Dni from gd_esquema.Maestra

SELECT COLUMN_NAME,* 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Maestra' AND TABLE_SCHEMA='gd_esquema';
------------------------------------------------------------------------
/* MEDICO ESPECIALIDAD */
select distinct Medico_Nombre,Medico_dni,Especialidad_Codigo,
Especialidad_Descripcion,
Tipo_Especialidad_Codigo,
Tipo_Especialidad_Descripcion from gd_esquema.Maestra
order by Tipo_Especialidad_Codigo;

select distinct Medico_Nombre,Medico_dni,Especialidad_Codigo,Especialidad_Descripcion from gd_esquema.Maestra
where Medico_Dni is not null
order by Medico_Dni;
------------------------------------------------------------------------
/* BONOS */
sELECT paciente_dni,Plan_Med_Precio_Bono_Consulta,Plan_Med_Precio_Bono_Farmacia,Compra_Bono_Fecha,Bono_Consulta_Fecha_Impresion,Bono_Consulta_Numero FROM gd_esquema.Maestra
where Compra_Bono_Fecha is not null or Bono_Consulta_Fecha_Impresion is not null or Bono_Consulta_Numero is not null
order by Bono_Consulta_Numero;

sELECT distinct (Bono_Consulta_Numero),paciente_dni,Plan_Med_Precio_Bono_Consulta,Plan_Med_Precio_Bono_Farmacia,Compra_Bono_Fecha,Bono_Consulta_Fecha_Impresion FROM gd_esquema.Maestra
where Compra_Bono_Fecha is not null
order by Bono_Consulta_Numero;

sELECT distinct paciente_dni,Plan_Med_Precio_Bono_Consulta,Plan_Med_Precio_Bono_Farmacia,Compra_Bono_Fecha,Bono_Consulta_Fecha_Impresion,Bono_Consulta_Numero FROM gd_esquema.Maestra
where Compra_Bono_Fecha is not null
order by Bono_Consulta_Numero;

select M1.paciente_dni as 'Comprador',M2.paciente_dni as 'usador',m1.Bono_Consulta_Numero from gd_esquema.Maestra M1 join gd_esquema.Maestra M2 on M1.Bono_Consulta_Numero=M2.Bono_Consulta_Numero
where m1.Bono_Consulta_Numero is not null and m2.Bono_Consulta_Numero is not null
and m2.Compra_Bono_Fecha is null
and m1.Compra_Bono_Fecha is not null
and m1.Paciente_Dni <> m2.Paciente_Dni
order by Comprador;

select distinct(Bono_Consulta_Numero), Bono_Consulta_Fecha_Impresion, A.id, Plan_Med_Codigo,
								Plan_Med_Precio_Bono_Consulta, Compra_Bono_Fecha, A.grupoFamiliar
						 from gd_esquema.Maestra join HELLFISH.Afiliado A ON Paciente_Dni = A.numeroDocumento where Compra_Bono_Fecha is not null

select * from HELLFISH.VentaDeBonos
ORDER BY idAfiliadoComprador,fechaDeCompra;


select * from HELLFISH.Bono;
select * from HAKUNADATATA.BONOS;

select * from HELLFISH.Bono
order by id desc;
select * from HELLFISH.VentaDeBonos
order by id desc;
select * from hellfish.Afiliado where id <>grupoFamiliar;
SELECT Compra_Bono_Fecha,(SELECT id from hellfish.Afiliado where numeroDocumento = Paciente_Dni),Plan_Med_Codigo,1,Plan_Med_Precio_Bono_Consulta from gd_esquema.Maestra where Compra_Bono_Fecha is not null
------------------------------------------------------------------------
/* TURNOS */

select DISTINCT paciente_dni,Turno_Numero,Turno_Fecha from gd_esquema.Maestra
where Turno_Numero is not null
order by Turno_Numero;

sELECT * FROM gd_esquema.Maestra
WHERE Turno_Numero IS NOT NULL AND Consulta_Sintomas IS NOT NULL
order by Turno_Numero,Consulta_Sintomas;

SELECT DISTINCT TURNO_NUMERO FROM gd_esquema.Maestra
WHERE Turno_Numero IS NOT NULL;

SELECT * FROM gd_esquema.Maestra WHERE Turno_Numero IS NULL AND Compra_Bono_Fecha IS NULL

select * from HELLFISH.Especialidad;
------------------------------------------------------------------------
/* CONSULTAS */

select * from hakunadatata.consultas_medicas;

------------------------------------------------------------------------
/* ROLES */
select * from HAKUNADATATA.Usuarios
order by USUARIO_COD desc;
select * from HAKUNADATATA.Afiliados
order by AFIL_COD desc;
select * from HAKUNADATATA.Usuarios

select * from HELLFISH.UsuarioRol
select * from HELLFISH.UsuarioRol where idRol = 2;
select * from HELLFISH.Rol
select * from HELLFISH.RolFuncionalidad
select * from HELLFISH.Usuario

select * from HELLFISH.Afiliado
select * from HELLFISH.GrupoFamiliar
select * from HELLFISH.Afiliado
order by id desc;


select * from HELLFISH.Usuario
order by id desc;

SELECT * from hellfish.PlanMedico;

select * from[GD2C2016].[HELLFISH].[OBTENER_PLANES] ()


select * from HELLFISH.Profesional
select * from hellfish.ProfesionalEspecialidad PE join HELLFISH.Especialidad E on e.id=pe.especialidad
order by idProfesional;

select * from HAKUNADATATA.Profesionales

select * from HELLFISH.AgendaProfesional
select * from HAKUNADATATA.AGENDAS where AGENDA_DISPONIBLE = 1

DROP TABLE HELLFISH.GrupoFamiliar
GO

drop TABLE HELLFISH.Cancelacion
GO
