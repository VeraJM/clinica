using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClinicaFrba.Model;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Data;

namespace ClinicaFrba.DAO
{
    public class EstadisticaDAO : DataAccessObject
    {
        public DataTable armarEstadisticaCancelaciones(Filtro filtroEstadistica)
        {
            int mes_inicial;
            int mes_final;
            string filtro_responsable_1;
            string filtro_responsable_2;
            mes_inicial = mesInicial(filtroEstadistica.Semestre);
            mes_final = mesFinal(filtroEstadistica.Semestre);

            if (String.Equals(filtroEstadistica.ResponsableCancelacion, "Ambos"))
            {
                filtro_responsable_1 = "Afiliado";
                filtro_responsable_2 = "Profesional";
            }
            else
            {
                filtro_responsable_1 = filtroEstadistica.ResponsableCancelacion;
                filtro_responsable_2 = filtroEstadistica.ResponsableCancelacion;
            }
            var tabla = new DataTable();
            SqlCommand comando = armarFuncionTabla("ESTADISTICA_ESP_MAS_CANCELADAS");
            comando = addParamFuncion(comando, filtroEstadistica.Anio.ToString());
            comando = addParamFuncion(comando, mes_inicial.ToString());
            comando = addParamFuncion(comando, mes_final.ToString());
            comando = addStringParamFuncion(comando, filtro_responsable_1);
            comando = addStringParamFuncion(comando, filtro_responsable_2);
            tabla = armarTablaEstCancelacion(comando);
            return tabla;
        }



        public DataTable armarTablaEstCancelacion(SqlCommand comando)
        {
            DataTable tabla = new DataTable();
            SqlDataReader reader;
            comando.CommandText = comando.CommandText + ")";
            tabla.Columns.Add("ID", typeof(Int32));
            tabla.Columns.Add("Especialidad", typeof(string));
            tabla.Columns.Add("Cantidad", typeof(Int32));
            using (comando)
            {
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    DataRow fila = tabla.NewRow();
                    fila["ID"] = (Int32)reader.GetValue(0);
                    fila["Especialidad"] = (String)reader.GetValue(1);
                    fila["Cantidad"] = (Int32)reader.GetValue(2);
                    tabla.Rows.Add(fila);
                }
            }
            return tabla;
        }

        public DataTable armarEstadisticaProfMasConsultados(Filtro filtro)
        {
            int mes_inicial;
            int mes_final;
            mes_inicial = mesInicial(filtro.Semestre);
            mes_final = mesFinal(filtro.Semestre);

            var tabla = new DataTable();
            SqlCommand comando = armarFuncionTabla("PROF_MAS_CONSULTADOS");
            comando = addParamFuncion(comando, filtro.Anio.ToString());
            comando = addParamFuncion(comando, mes_inicial.ToString());
            comando = addParamFuncion(comando, mes_final.ToString());
            comando = addParamFuncion(comando, filtro.Plan.ToString());
            tabla = armarTablaProfMasConsultados(comando);
            return tabla;
        }

        public DataTable armarTablaProfMasConsultados(SqlCommand comando)
        {
            DataTable tabla = new DataTable();
            SqlDataReader reader;
            comando.CommandText = comando.CommandText + ")";
            tabla.Columns.Add("Codigo de profesional", typeof(Int32));
            tabla.Columns.Add("Nombre", typeof(string));
            tabla.Columns.Add("Apellido", typeof(string));
            tabla.Columns.Add("Numero de matricula", typeof(Int32));
            tabla.Columns.Add("Especialidad", typeof(string));
            tabla.Columns.Add("Numero de consultas", typeof(Int32));
            using (comando)
            {
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    DataRow fila = tabla.NewRow();
                    fila["Codigo de profesional"] = (Int32)reader.GetValue(0);
                    fila["Nombre"] = (String)reader.GetValue(1);
                    fila["Apellido"] = (String)reader.GetValue(2);
                    fila["Numero de matricula"] = (Int32)reader.GetValue(3);
                    fila["Especialidad"] = (String)reader.GetValue(4);
                    fila["Numero de consultas"] = (Int32)reader.GetValue(5);
                    tabla.Rows.Add(fila);
                }
            }
            return tabla;
        }

        public DataTable armarEstadisticaProfMenosHoras(Filtro filtro)
        {
            int mes_inicial;
            int mes_final;
            mes_inicial = mesInicial(filtro.Semestre);
            mes_final = mesFinal(filtro.Semestre);

            var tabla = new DataTable();
            SqlCommand comando = armarFuncionTabla("PROF_MENOS_HORAS");
            comando = addParamFuncion(comando, filtro.Plan.ToString());
            comando = addParamFuncion(comando, filtro.Especialidad.ToString());
            comando = addParamFuncion(comando, filtro.Anio.ToString());
            comando = addParamFuncion(comando, mes_inicial.ToString());
            comando = addParamFuncion(comando, mes_final.ToString());
            tabla = armarTablaProfMenosHoras(comando);
            return tabla;
        }

        public DataTable armarTablaProfMenosHoras(SqlCommand comando)
        {
            DataTable tabla = new DataTable();
            SqlDataReader reader;
            comando.CommandText = comando.CommandText + ")";
            tabla.Columns.Add("Codigo de profesional", typeof(Int32));
            tabla.Columns.Add("Nombre", typeof(string));
            tabla.Columns.Add("Apellido", typeof(string));
            tabla.Columns.Add("Numero de matricula", typeof(Int32));
            tabla.Columns.Add("Especialidad", typeof(string));
            tabla.Columns.Add("Horas trabajadas", typeof(Int32));
            using (comando)
            {
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    DataRow fila = tabla.NewRow();
                    fila["Codigo de profesional"] = (Int32)reader.GetValue(0);
                    fila["Nombre"] = (String)reader.GetValue(1);
                    fila["Apellido"] = (String)reader.GetValue(2);
                    fila["Numero de matricula"] = (Int32)reader.GetValue(3);
                    fila["Especialidad"] = (String)reader.GetValue(4);
                    fila["Horas trabajadas"] = (Int32)reader.GetValue(5);
                    tabla.Rows.Add(fila);
                }
            }
            return tabla;
        }

        public DataTable armarEstadisticaEspecMasBonos(Filtro filtro)
        {
            int mes_inicial;
            int mes_final;
            mes_inicial = mesInicial(filtro.Semestre);
            mes_final = mesFinal(filtro.Semestre);

            var tabla = new DataTable();
            SqlCommand comando = armarFuncionTabla("ESTADISTICA_ESP_MAS_CONSULTADAS");
            comando = addParamFuncion(comando, filtro.Anio.ToString());
            comando = addParamFuncion(comando, mes_inicial.ToString());
            comando = addParamFuncion(comando, mes_final.ToString());
            tabla = armarTablaEspecMasBonos(comando);
            return tabla;
        }

        public DataTable armarTablaEspecMasBonos(SqlCommand comando)
        {
            DataTable tabla = new DataTable();
            SqlDataReader reader;
            comando.CommandText = comando.CommandText + ")";
            tabla.Columns.Add("Especialidad", typeof(string));
            using (comando)
            {
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    DataRow fila = tabla.NewRow();
                    fila["Especialidad"] = (String)reader.GetValue(0);
                    tabla.Rows.Add(fila);
                }
            }
            return tabla;
        }

        public DataTable armarEstadisticaAfilMasBonos(Filtro filtro)
        {
            int mes_inicial;
            int mes_final;
            mes_inicial = mesInicial(filtro.Semestre);
            mes_final = mesFinal(filtro.Semestre);

            var tabla = new DataTable();
            SqlCommand comando = armarFuncionTabla("AFIL_MAYOR_BONOS");
            comando = addParamFuncion(comando, filtro.Anio.ToString());
            comando = addParamFuncion(comando, mes_inicial.ToString());
            comando = addParamFuncion(comando, mes_final.ToString());
            tabla = armarTablaAfilMasBonos(comando);
            return tabla;
        }

        public DataTable armarTablaAfilMasBonos(SqlCommand comando)
        {
            DataTable tabla = new DataTable();
            SqlDataReader reader;
            comando.CommandText = comando.CommandText + ")";
            tabla.Columns.Add("Codigo de Afiliado", typeof(Int32));
            tabla.Columns.Add("Nombre", typeof(string));
            tabla.Columns.Add("Apellido", typeof(string));
            tabla.Columns.Add("Pertenece a grupo familiar", typeof(string));
            tabla.Columns.Add("Cantidad de bonos", typeof(Int32));
            using (comando)
            {
                reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    DataRow fila = tabla.NewRow();
                    fila["Codigo de Afiliado"] = (Int32)reader.GetValue(0);
                    fila["Nombre"] = (String)reader.GetValue(1);
                    fila["Apellido"] = (String)reader.GetValue(2);
                    fila["Pertenece a grupo familiar"] = (String)reader.GetValue(3);
                    fila["Cantidad de bonos"] = (Int32)reader.GetValue(4);
                    tabla.Rows.Add(fila);
                }
            }
            return tabla;
        }

        public int mesInicial(int semestre)
        {
            int mes;
            if (semestre == 1)
            {
                mes = 1;
            }
            else
            {
                mes = 6;
            }
            return mes;
        }

        public int mesFinal(int semestre)
        {
            int mes;
            if (semestre == 1)
            {
                mes = 6;
            }
            else
            {
                mes = 12;
            }
            return mes;
        }
    }
}
