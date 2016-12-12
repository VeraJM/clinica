using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClinicaFrba.Model;
using System.Data.SqlClient;

namespace ClinicaFrba.DAO
{
    public class DetalleDAO : DataAccessObject
    {
        public void InsertarDetalle(Afiliado afil)
        {
            SqlCommand comando = armarSP("ALTA_DETALLE");
            agregarParametroIntSP(comando, "@COD_USUARIO", afil.usuario.UsuarioId);
            agregarParametroStringSP(comando, "@NOMBRE", afil.detalle.Nombre);
            agregarParametroStringSP(comando, "@APELLIDO", afil.detalle.Apellido);
            agregarParametroStringSP(comando, "@TIPO_DOC", afil.detalle.TipoDoc);
            agregarParametroStringSP(comando, "@NRO_DOC", afil.detalle.NroDoc);
            agregarParametroStringSP(comando, "@DIRECCION", afil.detalle.Direccion);
            agregarParametroStringSP(comando, "@TELEFONO", afil.detalle.Telefono);
            agregarParametroStringSP(comando, "@MAIL", afil.detalle.Mail);
            agregarParametroDatetimeSP(comando, "@FECHA_NACIMIENTO", afil.detalle.FechaNacimiento);
            agregarParametroStringSP(comando, "@SEXO", afil.detalle.Sexo);
            comando.ExecuteNonQuery();
        }
    }
}
