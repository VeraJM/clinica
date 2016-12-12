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
    public class RolDAO : DataAccessObject
    {
        public void InsertarRol(string rol)
        {
            SqlCommand comando = armarSP("NUEVO_ROL");
            agregarParametroStringSP(comando, "@NOMBRE", rol);
            comando.ExecuteNonQuery();
        }

        public void AgregarFuncionalidad(string rol, string funcionalidad)
        {
            SqlCommand comando = armarSP("AGREGAR_FUNCIONALIDAD");
            agregarParametroStringSP(comando, "@NOMBRE_ROL", rol);
            agregarParametroStringSP(comando, "@NOMBRE_FUNC", funcionalidad);
            comando.ExecuteNonQuery();
        }

        public void darBajaRol(string rol)
        {
            SqlCommand comando = armarSP("BAJA_ROL_NOMBRE");
            agregarParametroStringSP(comando, "@NOMBRE_ROL", rol);
            comando.ExecuteNonQuery();
        }

        public void actualizarRol(string nuevoNombre, string viejoNombre, int habilitado)
        {
            SqlCommand comando = armarSP("ACTUALIZAR_ROL");
            agregarParametroStringSP(comando, "@NOMBRE", nuevoNombre);
            agregarParametroStringSP(comando, "@NOMBRE_VIEJO", viejoNombre);
            agregarParametroIntSP(comando, "@HABILITADO", habilitado);
            comando.ExecuteNonQuery();
        }

        public void limpiarFuncionalidadRol(string rol)
        {
            SqlCommand comando = armarSP("BORRAR_FUNCIONALIDAD_DE_ROL");
            agregarParametroStringSP(comando, "@NOMBRE", rol);
            comando.ExecuteNonQuery();
        }

        public DataTable buscarRolesHabilitados()
        {
            SqlCommand func = armarFuncionTabla("OBTENER_ROLES_HABILITADOS");
            DataTable tabla = armarTabla(func, "Roles");
            return tabla;
        }

        public DataTable armarTabla(SqlCommand comando, string columna)
        {
            List<string> lista = ejecutarFuncionTablaTexto(comando);
            DataTable tabla = new DataTable();
            tabla.Columns.Add(columna, typeof(string));
            foreach (string rol in lista)
            {
                DataRow fila = tabla.NewRow();
                fila[columna] = rol;
                tabla.Rows.Add(fila);
            }
            return tabla;
        }

        public DataTable buscarRoles()
        {
            SqlCommand func = armarFuncionTabla("OBTENER_TODOS_ROLES");
            DataTable tabla = armarTabla(func, "Roles");
            return tabla;
        }

        public List<string> getFuncionalides()
        {
            SqlCommand func = armarFuncionTabla("OBTENER_FUNCIONALIDADES");
            List<string> lista = ejecutarFuncionTablaTexto(func);
            return lista;
        }

        public int getHabilitacion(string rol)
        {
            SqlCommand func = armarFuncionTexto("OBTENER_HABILITACION_ROL");
            agregarStringParamFuncion(func, rol);
            object resultado = ejecutarFuncionTexto(func);
            return (int)resultado;
        }
        public List<string> getFuncionalidesDeRol(string rol)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_FUNCIONALIDADES_ROL");
            func = agregarStringParamFuncion(func, rol);
            List<string> lista = ejecutarFuncionTablaTexto(func);
            return lista;
        }
    }
}
