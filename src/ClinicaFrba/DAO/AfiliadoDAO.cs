﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using ClinicaFrba.Model;

namespace ClinicaFrba.DAO
{
    public class AfiliadoDAO : DataAccessObject
    {
        public DataTable buscarAfiliadosHabilitados()
        {
            var tabla = new DataTable();
            SqlCommand comando = armarFuncionTabla("OBTENER_AFILIADOS_HABILITADOS");
            tabla = armarTablaAfiliadosHabilitados(comando);
            return tabla;
        }

        public DataTable buscarAfiliados(List<Afiliado> afiliados)
        {
            var tabla = new DataTable();
            SqlCommand comando = armarFuncionTabla("OBTENER_AFILIADOS");
            tabla = armarTablaAfiliados(comando, afiliados);
            return tabla;
        }

        public DataTable armarTablaAfiliados(SqlCommand comando, List<Afiliado> afiliados)
        {
            afiliados.Clear();
            DataTable tabla = new DataTable();
            SqlDataReader reader;
            comando.CommandText = comando.CommandText + ")";
            tabla.Columns.Add("Codigo", typeof(Int32));
            tabla.Columns.Add("Nombre", typeof(string));
            tabla.Columns.Add("Apellido", typeof(string));
            tabla.Columns.Add("Tipo de documento", typeof(string));
            tabla.Columns.Add("Numero de Documento", typeof(Decimal));
            using (comando)
            {
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    Afiliado afil = new Afiliado();
                    DataRow fila = tabla.NewRow();
                    afil.codigo = (Int32)reader.GetValue(0);
                    afil.detalle.Nombre = (String)reader.GetValue(1);
                    afil.detalle.Apellido = (String)reader.GetValue(2);
                    afil.detalle.TipoDoc = (String)reader.GetValue(3);
                    decimal numDoc = (Decimal)reader.GetSqlDecimal(4);
                    afil.detalle.NroDoc = numDoc.ToString();
                    afil.plan.Nivel = (String)reader.GetValue(5);
                    afil.estadoCivil.Descripcion = (String)reader.GetValue(6);
                    afil.detalle.Direccion = (String)reader.GetValue(7);
                    decimal numTel = (Decimal)reader.GetSqlDecimal(8);
                    afil.detalle.Telefono = numTel.ToString();
                    afil.detalle.Mail = (String)reader.GetValue(9);
                    afil.detalle.Sexo = (String)reader.GetValue(10);
                    afil.cantidad_hijos = (Int32)reader.GetValue(11);
                    fila["Codigo"] = afil.codigo;
                    fila["Nombre"] = afil.detalle.Nombre;
                    fila["Apellido"] = afil.detalle.Apellido;
                    fila["Tipo de documento"] = afil.detalle.TipoDoc;
                    fila["Numero de documento"] = afil.detalle.NroDoc;
                    tabla.Rows.Add(fila);
                    afiliados.Add(afil);
                }
            }
            return tabla;
        }
        public void insertarAfiliado(Afiliado afiliado)
        {
            SqlCommand comando = armarSP("ALTA_AFILIADO");
            agregarParametroStringSP(comando, "@NOMBRE", afiliado.detalle.Nombre);
            agregarParametroStringSP(comando, "@APELLIDO", afiliado.detalle.Apellido);
            agregarParametroStringSP(comando, "@TIPO_DOC", afiliado.detalle.TipoDoc);
            agregarParametroStringSP(comando, "@NRO_DOC", afiliado.detalle.NroDoc);
            agregarParametroStringSP(comando, "@DIRECCION", afiliado.detalle.Direccion);
            agregarParametroStringSP(comando, "@TELEFONO", afiliado.detalle.Telefono);
            agregarParametroStringSP(comando, "@MAIL", afiliado.detalle.Mail);
            agregarParametroDatetimeSP(comando, "@FECHA_NACIMIENTO", afiliado.detalle.FechaNacimiento);
            agregarParametroStringSP(comando, "@SEXO", afiliado.detalle.Sexo);
            agregarParametroIntSP(comando, "@COD_ESTADO_CIVIL", afiliado.estadoCivil.Codigo);
            agregarParametroIntSP(comando, "@CANT_HIJOS_FAMILIARES", afiliado.cantidad_hijos);
            agregarParametroIntSP(comando, "@COD_PLAN", afiliado.plan.PlanId);
            agregarParametroIntSP(comando, "@COD_USUARIO", afiliado.usuario.UsuarioId);
            agregarParametroIntSP(comando, "@NUMERO_AFILIADO", afiliado.numero);
            agregarParametroIntSP(comando, "@NUMERO_FAMILIA", afiliado.grupoFamiliar);
            comando.Parameters.Add("@NUEVO_CODIGO_USUARIO", SqlDbType.Int).Direction = ParameterDirection.Output;
            comando.Parameters.Add("@NUEVO_CODIGO_FAMILIA", SqlDbType.Int).Direction = ParameterDirection.Output;
            comando.ExecuteNonQuery();
            afiliado.codigo = Convert.ToInt32(comando.Parameters["@NUEVO_CODIGO_USUARIO"].Value);
            afiliado.grupoFamiliar = Convert.ToInt32(comando.Parameters["@NUEVO_CODIGO_FAMILIA"].Value);
        }

        public void ModificarAfiliado(Afiliado afiliado, string motivo, bool cambioPlan, int codigoPlanViejo)
        {
            int cambio;
            SqlCommand comando = armarSP("ACTUALIZAR_AFILIADO");
            agregarParametroIntSP(comando, "@COD_DETALLE", afiliado.detalle.DetallePersonaId);
            agregarParametroIntSP(comando, "@COD_AFILIADO", afiliado.codigo);
            agregarParametroIntSP(comando, "@COD_ESTADO_CIVIL", afiliado.estadoCivil.Codigo);
            agregarParametroIntSP(comando, "@CANT_HIJOS_FAMILIARES", afiliado.cantidad_hijos);
            agregarParametroIntSP(comando, "@COD_PLAN", afiliado.plan.PlanId);
            agregarParametroStringSP(comando, "@DIRECCION", afiliado.detalle.Direccion);
            agregarParametroStringSP(comando, "@TELEFONO", afiliado.detalle.Telefono);
            agregarParametroStringSP(comando, "@MAIL", afiliado.detalle.Mail);
            agregarParametroStringSP(comando, "@SEXO", afiliado.detalle.Sexo);
            agregarParametroStringSP(comando, "@MOTIVO", motivo);
            if (cambioPlan)
            {
                cambio = 1;
            }
            else
            {
                cambio = 0;
            }
            agregarParametroIntSP(comando, "@MODIFICACION_PLAN", cambio);
            agregarParametroIntSP(comando, "@COD_PLAN_VIEJO", codigoPlanViejo);
            comando.ExecuteNonQuery();
        }

        public void darBajaAfiliado(int codigo)
        {
            SqlCommand comando = armarSP("DAR_BAJA_AFILIADO");
            agregarParametroIntSP(comando, "@AFILIADO_COD", codigo);
            comando.ExecuteNonQuery();
        }

        public DataTable armarTablaAfiliadosHabilitados(SqlCommand comando)
        {
            var lista = new List<Afiliado>();
            DataTable tabla = new DataTable();
            SqlDataReader reader;
            comando.CommandText = comando.CommandText + ")";
            tabla.Columns.Add("Codigo", typeof(Int32));
            tabla.Columns.Add("Nombre", typeof(string));
            tabla.Columns.Add("Apellido", typeof(string));
            tabla.Columns.Add("Tipo de documento", typeof(string));
            tabla.Columns.Add("Numero de Documento", typeof(Decimal));
            using (comando)
            {
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    DataRow fila = tabla.NewRow();
                    fila["Codigo"] = (Int32)reader.GetValue(0);
                    fila["Nombre"] = (String)reader.GetValue(1);
                    fila["Apellido"] = (String)reader.GetValue(2);
                    fila["Tipo de documento"] = (String)reader.GetValue(3);
                    fila["Numero de documento"] = (Decimal)reader.GetSqlDecimal(4);
                    tabla.Rows.Add(fila);
                }
            }
            return tabla;
        }

        public List<EstadoCivil> getEstadosCiviles()
        {
            SqlCommand func = armarFuncionTabla("OBTENER_ESTADOS_CIVILES");
            var lista = new List<EstadoCivil>();
            SqlDataReader reader;
            func.CommandText = func.CommandText + ")";
            using (func)
            {
                reader = func.ExecuteReader();
                while (reader.Read())
                {
                    var estado = new EstadoCivil();
                    estado.Codigo = (int)reader.GetValue(0);
                    estado.Descripcion = (string)reader.GetValue(1);
                    lista.Add(estado);
                }
            }
            return lista;
        }


        public List<Afiliado> getAfiliadosRelacionados(int afiliadoId)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_AFILIADOS_RELACIONADOS");
            func = agregarParamFuncion(func, afiliadoId.ToString());

            List<Afiliado> lista = new List<Afiliado>();
            SqlDataReader reader;
            func.CommandText = func.CommandText + ")";
            using (func)
            {
                reader = func.ExecuteReader();
                while (reader.Read())
                {
                    Afiliado afiliado = new Afiliado();
                    afiliado.codigo = reader.GetInt32(0);
                    afiliado.detalle = new DetallePersona();
                    afiliado.detalle.Nombre = reader.GetString(1);
                    afiliado.detalle.Apellido = reader.GetString(2);

                    lista.Add(afiliado);
                }
            }
            return lista;
        }
    }
}