using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using ClinicaFrba.Model;

namespace ClinicaFrba.DAO
{
    public class UsuarioDAO : DataAccessObject
    {
        public void EjecutarLogIn(string usuario, string password)
        {
            SqlCommand comando = armarSP("LOGIN_USUARIO");
            agregarParametroStringSP(comando, "@username", usuario);
            agregarParametroStringSP(comando, "@password", password);
            comando.ExecuteNonQuery();
        }

        public void InsertarUsuario(Usuario usuario, string rol)
        {
            try
            {
                SqlCommand comando = armarSP("ALTA_USUARIO");
                agregarParametroStringSP(comando, "@NOMBRE_USUARIO", usuario.Username);
                agregarParametroStringSP(comando, "@PASSWORD", usuario.Password);
                agregarParametroStringSP(comando, "@ROL", rol);
                comando.Parameters.Add("@CODIGO_USUARIO", SqlDbType.Int).Direction = ParameterDirection.Output;
                comando.ExecuteNonQuery();
                usuario.UsuarioId = Convert.ToInt32(comando.Parameters["@CODIGO_USUARIO"].Value);
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627)
                {
                    throw new InvalidOperationException("El nombre de usuario ya existe");
                }
                else
                {
                    throw ex;
                }
            }
        }

        public List<Rol> getRolesUsuario(string usuario)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_ROLES");
            func = agregarStringParamFuncion(func, usuario);
            List<string> lista = ejecutarFuncionTablaTexto(func);

            List<Rol> roles = new List<Rol>();
            foreach (var rolString in lista)
            {
                Rol rol = new Rol();
                rol.Nombre = rolString;
                roles.Add(rol);
            }
            return roles;
        }

        public void CargarDatosUsusario(string username)
        {

            SqlCommand func = armarFuncionTabla("CARGAR_DATOS_USUARIO");
            func = agregarStringParamFuncion(func, username);
            SqlDataReader reader;
            comando.CommandText = comando.CommandText + ")";



            using (comando)
            {
                reader = comando.ExecuteReader();
                if (reader.Read())
                {
                    LogInManager.usuarioId = (Int32)reader.GetValue(0);
                    LogInManager.afiliadoId = (Int32)reader.GetValue(1);
                    LogInManager.profesionalId = (Int32)reader.GetValue(2);
                    LogInManager.afiliadoNro = (Int32)reader.GetValue(3);
                }
            }

        }
    }
}
