using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ClinicaFrba.Model;

namespace ClinicaFrba.DAO
{
    public class TurnosDAO : DataAccessObject
    {

        public List<string> getFechasDisponibles(int profesionalId, int especialidadId)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_FECHAS_PROFESIONAL_ESPECIALIDAD");
            func = agregarParamFuncion(func, profesionalId.ToString());
            func = agregarParamFuncion(func, especialidadId.ToString());


            List<String> lista = new List<String>();
            SqlDataReader reader;
            func.CommandText = func.CommandText + ")";
            using (func)
            {
                reader = func.ExecuteReader();
                while (reader.Read())
                {
                    String fecha = reader.GetString(0);
                    lista.Add(fecha);
                }
            }
            return lista;
        }

        public DataTable buscarTurnos(int afiliadoId)
        {
            SqlCommand func = armarFuncionTabla("BUSCAR_TURNOS_AFILIADO");
            func = agregarParamFuncion(func, afiliadoId.ToString());

            DataTable tabla = new DataTable();
            tabla.Columns.Add("turnoId", typeof(int));
            tabla.Columns.Add("Número", typeof(int));
            tabla.Columns.Add("Fecha", typeof(string));
            tabla.Columns.Add("Profesional", typeof(string));

            SqlDataReader reader;
            func.CommandText = func.CommandText + ")";
            using (func)
            {
                reader = func.ExecuteReader();

                while (reader.Read())
                {
                    DataRow fila = tabla.NewRow();
                    fila["turnoId"] = (int)reader.GetValue(0);
                    fila["Número"] = (int)reader.GetValue(1);
                    fila["Fecha"] = (DateTime)reader.GetValue(2);
                    fila["Profesional"] = (String)reader.GetValue(3);
                    tabla.Rows.Add(fila);
                }
            }

            return tabla;
        }

        public void CancelarTurnoAfiliado(int turnoId, int afiliadoId, int motivoId, String detalle)
        {
            SqlCommand comando = armarSP("CANCELAR_TURNO_AFILIADO");
            agregarParametroIntSP(comando, "@TURNO_ID", turnoId);
            agregarParametroIntSP(comando, "@AFILIADO_ID", afiliadoId);
            agregarParametroIntSP(comando, "@MOTIVO_ID", motivoId);
            agregarParametroStringSP(comando, "@DETALLE", detalle);

            comando.ExecuteNonQuery();
        }


        public void CancelarTurnosProfesional(int profesionalId, DateTime desdeFecha, DateTime hastaFecha, int motivoId, String detalle)
        {
            SqlCommand comando = armarSP("CANCELAR_TURNO_PROFESIONAL");
            agregarParametroIntSP(comando, "@PROFESIONAL_ID", profesionalId);
            agregarParametroDatetimeSP(comando, "@FECHA_DESDE", desdeFecha);
            agregarParametroDatetimeSP(comando, "@FECHA_HASTA", hastaFecha);
            agregarParametroIntSP(comando, "@MOTIVO_ID", motivoId);
            agregarParametroStringSP(comando, "@DETALLE", detalle);

            comando.ExecuteNonQuery();
        }

        public List<TipoCancelacion> getTiposCancelacion()
        {
            SqlCommand func = armarFuncionTabla("OBTENER_TIPO_CANCELACIONES");

            List<TipoCancelacion> lista = new List<TipoCancelacion>();
            SqlDataReader reader;
            func.CommandText = func.CommandText + ")";
            using (func)
            {
                reader = func.ExecuteReader();
                while (reader.Read())
                {
                    TipoCancelacion tipoCancelacion = new TipoCancelacion();
                    tipoCancelacion.codigo = (int)reader.GetValue(0);
                    tipoCancelacion.descripcion = (string)reader.GetValue(1);
                    lista.Add(tipoCancelacion);
                }
            }
            return lista;
        }

        public void registrarLlegada(int turnoId, int afiliadoId, int bonoId)
        {
            SqlCommand comando = armarSP("REGISTRAR_LLEGADA_AFILIADO");
            agregarParametroIntSP(comando, "@TURNO_ID", turnoId);
            agregarParametroIntSP(comando, "@AFILIADO_ID", afiliadoId);
            agregarParametroIntSP(comando, "@BONO_ID", bonoId);

            comando.ExecuteNonQuery();
        }
    }
}
