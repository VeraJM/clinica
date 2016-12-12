using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using ClinicaFrba.Model;

namespace ClinicaFrba.DAO
{
    public class ProfesionalDAO : DataAccessObject
    {

        public Profesional buscarProfesional(Int32 codigoUsuario)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_PROFESIONAL");
            func = agregarStringParamFuncion(func, codigoUsuario.ToString());
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
            func = agregarStringParamFuncion(func, codigoUsuario.ToString());

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
            func = agregarStringParamFuncion(func, codigoEpecialidad.ToString());

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

        public List<string> getHorasDisponibles(int profesionalId, int especialidadId, string fecha)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_HORAS_PROFESIONAL_ESPECIALIDAD");
            func = agregarParamFuncion(func, profesionalId.ToString());
            func = agregarParamFuncion(func, especialidadId.ToString());
            func = agregarStringParamFuncion(func, fecha);


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
            SqlCommand comando = armarSP("SOLICITAR_TURNO");
            agregarParametroIntSP(comando, "@AFILIADO_ID", afiliadoId);
            agregarParametroIntSP(comando, "@PROFESIONAL_ID", profesionalId);
            agregarParametroIntSP(comando, "@ESPECIALIDAD_ID", especialidadId);
            agregarParametroStringSP(comando, "@FECHA", fecha);

            comando.ExecuteNonQuery();
        }

        public void registrarAgendaDia(int profesionalId, int especialidadId,
            int dia, int desdeHora, int desdeMinuto, int hastaHora, int hastaMinuto, DateTime desdeFecha, DateTime hastaFecha)
        {
            SqlCommand comando = armarSP("REGISTRAR_AGENDA_PROFESIONAL");
            agregarParametroIntSP(comando, "@PROFESIONAL_COD", profesionalId);
            agregarParametroIntSP(comando, "@ID_ESPECIALIDAD", especialidadId);
            agregarParametroIntSP(comando, "@DIA", dia);
            agregarParametroIntSP(comando, "@DESDE_HORA", desdeHora);
            agregarParametroIntSP(comando, "@DESDE_MIN", desdeMinuto);
            agregarParametroIntSP(comando, "@HASTA_HORA", hastaHora);
            agregarParametroIntSP(comando, "@HASTA_MIN", hastaMinuto);
            agregarParametroDatetimeSP(comando, "@FECHA_DESDE", desdeFecha);
            agregarParametroDatetimeSP(comando, "@FECHA_HASTA", hastaFecha);

            comando.ExecuteNonQuery();
        }

        public List<string> getFechasConTurno(int profesionalId, int especialidadId)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_FECHAS_TURNO_PROFESIONAL_ESPECIALIDAD");
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

        public List<Turno> getHorasConTurno(int profesionalId, int especialidadId, string fecha)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_TURNOS_PROFESIONAL_ESPECIALIDAD");
            func = agregarParamFuncion(func, profesionalId.ToString());
            func = agregarParamFuncion(func, especialidadId.ToString());
            func = agregarStringParamFuncion(func, fecha);


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
