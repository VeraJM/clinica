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
            func = addParamFuncion(func, profesionalId.ToString());
            func = addParamFuncion(func, especialidadId.ToString());


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
            func = addParamFuncion(func, afiliadoId.ToString());

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
            SqlCommand comando = SP("CANCELAR_TURNO_AFILIADO");
            addParametroIntSP(comando, "@TURNO_ID", turnoId);
            addParametroIntSP(comando, "@AFILIADO_ID", afiliadoId);
            addParametroIntSP(comando, "@MOTIVO_ID", motivoId);
            addParametroStringSP(comando, "@DETALLE", detalle);

            comando.ExecuteNonQuery();
        }


        public void CancelarTurnosProfesional(int profesionalId, DateTime desdeFecha, DateTime hastaFecha, int motivoId, String detalle)
        {
            SqlCommand comando = SP("CANCELAR_TURNO_PROFESIONAL");
            addParametroIntSP(comando, "@PROFESIONAL_ID", profesionalId);
            addParametroDatetimeSP(comando, "@FECHA_DESDE", desdeFecha);
            addParametroDatetimeSP(comando, "@FECHA_HASTA", hastaFecha);
            addParametroIntSP(comando, "@MOTIVO_ID", motivoId);
            addParametroStringSP(comando, "@DETALLE", detalle);

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
            SqlCommand comando = SP("REGISTRAR_LLEGADA_AFILIADO");
            addParametroIntSP(comando, "@TURNO_ID", turnoId);
            addParametroIntSP(comando, "@AFILIADO_ID", afiliadoId);
            addParametroIntSP(comando, "@BONO_ID", bonoId);

            comando.ExecuteNonQuery();
        }
    }
}
