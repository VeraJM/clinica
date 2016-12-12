using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using System.Configuration;
using System.Data;
using System.Collections.Specialized;

namespace ClinicaFrba.DAO
{
    public abstract class DataAccessObject : IDisposable
    {
        public static SqlConnection conexion { get; set; }
        public SqlCommand comando { get; set; }

        public static SqlConnection conexionDB()
        {
            NameValueCollection settings = System.Configuration.ConfigurationSettings.AppSettings;
            string configuracion = "Data Source=" + settings.Get("dbDataSource") +
                ";Initial Catalog=" + settings.Get("GD2C2016") +
                "; User ID=" + settings.Get("dbUsername") +
                ";Password=" + settings.Get("dbPassword");

                //ConfigurationManager.ConnectionStrings["GD2C2016ConnectionString"].ConnectionString;
            conexion = new SqlConnection(configuracion);
            conexion.Open();
            SqlCommand comm = new SqlCommand("SET ARITHABORT ON", conexion);
            comm.ExecuteNonQuery();
            return conexion;
        }

        public SqlCommand armarSP(String nombre)
        {
            setearComando(nombre);
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = "[GD2C2016].[HELLFISH].[" + nombre + "]";
            return comando;
        }

        public SqlCommand setearComando(string nombre)
        {
            comando = new SqlCommand();
            comando.Connection = conexionDB();
            comando.CommandTimeout = 0;
            return comando;
        }
        public SqlCommand armarFuncionTexto(String nombre)
        {
            return armarFuncion("select ", nombre);
        }

        public SqlCommand armarFuncionTabla(String nombre)
        {
            return armarFuncion("select * from", nombre);
        }

        public SqlCommand armarFuncion(string texto, String nombre)
        {
            setearComando(nombre);
            comando.CommandText = texto + "[GD2C2016].[HELLFISH].[" + nombre + "] (";
            comando.CommandType = CommandType.Text;
            return comando;
        }

        public SqlCommand agregarParametroStringSP(SqlCommand com, String variable, String valor)
        {
            com.Parameters.AddWithValue(variable, valor);
            return com;
        }

        public SqlCommand agregarParametroDateTimeSP(SqlCommand com, String variable, DateTime valor)
        {
            SqlParameter parameter = com.Parameters.Add(variable,
                System.Data.SqlDbType.DateTime);
            parameter.Value = DateTime.Now;

            return com;
        }

        public SqlCommand agregarParametroIntSP(SqlCommand com, String variable, int valor)
        {
            com.Parameters.AddWithValue(variable, Convert.ToInt32(valor));
            return com;
        }

        public SqlCommand agregarParametroDatetimeSP(SqlCommand com, String variable, DateTime? valor)
        {
            SqlParameter parameter = com.Parameters.Add(variable, System.Data.SqlDbType.DateTime);
            if (valor != null)
            {
                parameter.Value = valor;

            }
            else
            {
                parameter.Value = DBNull.Value;
            }
            return com;
        }

        public object ejecutarFuncionTexto(SqlCommand func)
        {
            func.CommandText = func.CommandText + ")";
            object result = null;
            using (func)
            {
                result = func.ExecuteScalar();
            }
            return result;
        }

        public List<string> ejecutarFuncionTablaTexto(SqlCommand func)
        {
            var lista = new List<string>();
            SqlDataReader reader;
            func.CommandText = func.CommandText + ")";
            using (func)
            {
                reader = func.ExecuteReader();

                while (reader.Read())
                    lista.Add((String)reader.GetValue(0));
            }
            return lista;
        }

        public SqlCommand agregarDateTimeParamFuncion(SqlCommand func, DateTime fecha)
        {
            return agregarParamFuncion(func, "'" + fecha.ToString("yyyy-MM-dd hh:mm:ss") + "'");
        }

        public SqlCommand agregarStringParamFuncion(SqlCommand func, string nombre)
        {
            return agregarParamFuncion(func, "'" + nombre + "'");
        }

        public SqlCommand agregarParamFuncion(SqlCommand func, string nombre)
        {
            if (func.CommandText.EndsWith("("))
            {
                func.CommandText = func.CommandText + nombre;
            }
            else
            {
                func.CommandText = func.CommandText + "," + nombre;
            }
            return func;
        }

        void IDisposable.Dispose()
        {
            conexion.Close();
        }
    }
}
