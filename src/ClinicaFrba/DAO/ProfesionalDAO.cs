using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using ClinicaFrba.Model;
using System.Globalization;

namespace ClinicaFrba.DAO
{
    public class ProfesionalDAO : DataAccessObject
    {

        public Profesional buscarProfesional(Int32 codigoUsuario)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_PROFESIONAL");
            func = addStringParamFuncion(func, codigoUsuario.ToString());
            Profesional profesional = armarProfesional(func);

            if (profesional != null)
            {
                profesional.UsuarioId = codigoUsuario;
            }

            return profesional;
        }

        private Profesional armarProfesional(SqlCommand comando)
        {

            Profesional profesional = null;
            SqlDataReader reader;
            comando.CommandText = comando.CommandText + ")";

            using (comando)
            {
                reader = comando.ExecuteReader();
                if (reader.Read())
                {
                    profesional = new Profesional();
                    profesional.detalle = new DetallePersona();

                    profesional.codigo = (Int32)reader.GetValue(0);
                    profesional.Matricula = reader.GetString(1);
                    profesional.detalle.Nombre = reader.GetString(2);
                    profesional.detalle.Apellido = reader.GetString(3);

                }
            }

            return profesional;
        }


        public List<Especialidad> getEspecialidades(Int32 codigoUsuario)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_ESPECIALIDADES_PROFESIONAL");
            func = addStringParamFuncion(func, codigoUsuario.ToString());

            List<Especialidad> lista = new List<Especialidad>();
            SqlDataReader reader;
            func.CommandText = func.CommandText + ")";
            using (func)
            {
                reader = func.ExecuteReader();
                while (reader.Read())
                {
                    Especialidad especialidad = new Especialidad();
                    especialidad.EspecialidadId = (int)reader.GetValue(0);
                    especialidad.Descripcion = (string)reader.GetValue(1);
                    lista.Add(especialidad);
                }
            }
            return lista;
        }

        public List<Profesional> getProfesionales(Int32 codigoEpecialidad)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_PROFESIONALES_ESPECIALIDAD");
            func = addStringParamFuncion(func, codigoEpecialidad.ToString());

            List<Profesional> lista = new List<Profesional>();
            SqlDataReader reader;
            func.CommandText = func.CommandText + ")";
            using (func)
            {
                reader = func.ExecuteReader();
                while (reader.Read())
                {
                    Profesional profesional = new Profesional();
                    profesional.detalle = new DetallePersona();

                    profesional.codigo = (Int32)reader.GetValue(0);
                    profesional.Matricula = reader.GetString(1);
                    profesional.detalle.Nombre = reader.GetString(2);
                    profesional.detalle.Apellido = reader.GetString(3);

                    lista.Add(profesional);
                }
            }
            return lista;
        }

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

        public List<string> getHorasDisponibles(int profesionalId, int especialidadId, string fecha)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_HORAS_PROFESIONAL_ESPECIALIDAD");
            func = addParamFuncion(func, profesionalId.ToString());
            func = addParamFuncion(func, especialidadId.ToString());
            func = addDateTimeParamFuncion(func, DateTime.Parse(fecha));


            List<String> lista = new List<String>();
            SqlDataReader reader;
            func.CommandText = func.CommandText + ")";
            using (func)
            {
                reader = func.ExecuteReader();
                while (reader.Read())
                {
                    String hora = reader.GetString(0);
                    lista.Add(hora);
                }
            }
            return lista;
        }

        public void solicitarTurno(int afiliadoId, int profesionalId, int especialidadId, string fecha)
        {
            SqlCommand comando = SP("SOLICITAR_TURNO");
            addParametroIntSP(comando, "@AFILIADO_ID", afiliadoId);
            addParametroIntSP(comando, "@PROFESIONAL_ID", profesionalId);
            addParametroIntSP(comando, "@ESPECIALIDAD_ID", especialidadId);
            addParametroDatetimeSP(comando, "@FECHA", DateTime.Parse(fecha));

            comando.ExecuteNonQuery();
        }

        public void registrarAgendaDia(int profesionalId, int especialidadId,
            int dia, int desdeHora, int desdeMinuto, int hastaHora, int hastaMinuto, DateTime desdeFecha, DateTime hastaFecha)
        {
            SqlCommand comando = SP("REGISTRAR_AGENDA_PROFESIONAL");
            addParametroIntSP(comando, "@PROFESIONAL_COD", profesionalId);
            addParametroIntSP(comando, "@ID_ESPECIALIDAD", especialidadId);
            addParametroIntSP(comando, "@DIA", dia);
            addParametroIntSP(comando, "@DESDE_HORA", desdeHora);
            addParametroIntSP(comando, "@DESDE_MIN", desdeMinuto);
            addParametroIntSP(comando, "@HASTA_HORA", hastaHora);
            addParametroIntSP(comando, "@HASTA_MIN", hastaMinuto);
            addParametroDatetimeSP(comando, "@FECHA_DESDE", desdeFecha);
            addParametroDatetimeSP(comando, "@FECHA_HASTA", hastaFecha);

            comando.ExecuteNonQuery();
        }

        public List<string> getFechasConTurno(int profesionalId, int especialidadId)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_FECHAS_TURNO_PROFESIONAL_ESPECIALIDAD");
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

        public List<Turno> getHorasConTurno(int profesionalId, int especialidadId, string fecha)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_TURNOS_PROFESIONAL_ESPECIALIDAD");
            func = addParamFuncion(func, profesionalId.ToString());
            func = addParamFuncion(func, especialidadId.ToString());
            func = addStringParamFuncion(func, fecha);


            List<Turno> lista = new List<Turno>();
            SqlDataReader reader;
            func.CommandText = func.CommandText + ")";
            using (func)
            {
                reader = func.ExecuteReader();
                while (reader.Read())
                {
                    Turno turno = new Turno();
                    turno.codigo = reader.GetInt32(0);
                    turno.fecha = reader.GetDateTime(1).ToString("dd/MM/yyyy hh:mm");
                    turno.numero = reader.GetInt32(2);
                    turno.profesional = new Profesional();
                    turno.profesional.codigo = reader.GetInt32(3);
                    turno.afiliado = new Afiliado();
                    turno.afiliado.codigo = reader.GetInt32(4);

                    lista.Add(turno);
                }
            }
            return lista;
        }
    }
}
