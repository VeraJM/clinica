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
    public class DiagnosticoDAO : DataAccessObject
    {
        public List<Sintoma> getSintomas()
        {
            SqlCommand func = armarFuncionTabla("OBTENER_SINTOMAS");
            var lista = new List<Sintoma>();
            SqlDataReader reader;
            func.CommandText = func.CommandText + ")";
            using (func)
            {
                reader = func.ExecuteReader();
                while (reader.Read())
                {
                    var sint = new Sintoma();
                    sint.Codigo = (int)reader.GetValue(0);
                    sint.Descripcion = (string)reader.GetValue(1);
                    lista.Add(sint);
                }
            }
            return lista;
        }

        public void guardarDiagnostico(Diagnostico diag, List<Sintoma> sintomas)
        {
            SqlCommand comando = armarSP("AGREGAR_DIAGNOSTICO");
            comando.Parameters.Add("@DIAG_COD", SqlDbType.Int).Direction = ParameterDirection.Output;
            agregarParametroStringSP(comando, "@DIAG_DESC", diag.Descripcion);
            agregarParametroIntSP(comando, "@DIAG_TURNO_COD", diag.TurnoCod);
            agregarParametroDatetimeSP(comando, "@DIAG_FECHA", diag.Fecha);
            comando.ExecuteNonQuery();
            diag.DiagnosticoId = Convert.ToInt32(comando.Parameters["@DIAG_COD"].Value);

            foreach (Sintoma sint in sintomas)
            {
                comando.Parameters.Clear();
                comando = armarSP("AGREGAR_SINTOMA_DIAGNOSTICO");
                agregarParametroIntSP(comando, "@DIAG_COD", diag.DiagnosticoId);
                agregarParametroIntSP(comando, "@SINTOMA_COD", sint.Codigo);
                comando.ExecuteNonQuery();
            }

        }
    }
}
