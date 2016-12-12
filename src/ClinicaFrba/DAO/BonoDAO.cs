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
    public class BonoDAO : DataAccessObject
    {

        public void ComprarBono(int numeroAfiliado, int cantidad)
        {
            SqlCommand comando = SP("COMPRAR_BONO");
            addParametroStringSP(comando, "@AFILIADO_NRO", numeroAfiliado.ToString());
            addParametroStringSP(comando, "@CANTIDAD", cantidad.ToString());
            addParametroDateTimeSP(comando, "@FECHA", DateTime.Now);

            comando.ExecuteNonQuery();
        }

        public List<Bono> getBonosAfiliado(int afiliadoId)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_BONOS_AFILIADOS");
            func = addParamFuncion(func, afiliadoId.ToString());

            List<Bono> lista = new List<Bono>();
            SqlDataReader reader;
            func.CommandText = func.CommandText + ")";
            using (func)
            {
                reader = func.ExecuteReader();
                while (reader.Read())
                {
                    Bono bono = new Bono();
                    bono.BonoCod = reader.GetInt32(0);
                    bono.Plan = new Plan();
                    bono.Plan.PlanId = reader.GetInt32(1);
                    bono.Plan.Nivel = reader.GetString(2);
                    bono.Afiliado = new Afiliado();
                    bono.Afiliado.codigo = reader.GetInt32(3);

                    lista.Add(bono);
                }
            }
            return lista;
        }
    }
}
