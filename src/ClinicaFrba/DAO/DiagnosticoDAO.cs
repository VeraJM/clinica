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
            SqlCommand comando = SP("AGREGAR_DIAGNOSTICO");
            comando.Parameters.Add("@DIAG_COD", SqlDbType.Int).Direction = ParameterDirection.Output;
            addParametroStringSP(comando, "@DIAG_DESC", diag.Descripcion);
            addParametroIntSP(comando, "@DIAG_TURNO_COD", diag.TurnoCod);
            addParametroDatetimeSP(comando, "@DIAG_FECHA", diag.Fecha);
            comando.ExecuteNonQuery();
            diag.DiagnosticoId = Convert.ToInt32(comando.Parameters["@DIAG_COD"].Value);

            foreach (Sintoma sint in sintomas)
            {
                comando.Parameters.Clear();
                comando = SP("AGREGAR_SINTOMA_DIAGNOSTICO");
                addParametroIntSP(comando, "@DIAG_COD", diag.DiagnosticoId);
                addParametroIntSP(comando, "@SINTOMA_COD", sint.Codigo);
                comando.ExecuteNonQuery();
            }

        }
    }
}
