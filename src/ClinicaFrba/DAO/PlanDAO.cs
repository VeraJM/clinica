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
    public class PlanDAO : DataAccessObject
    {
        public List<Plan> getPlanes()
        {
            SqlCommand func = armarFuncionTabla("OBTENER_PLANES");
            var lista = new List<Plan>();
            SqlDataReader reader;
            func.CommandText = func.CommandText + ")";
            using (func)
            {
                reader = func.ExecuteReader();
                while (reader.Read())
                {
                    var plan = new Plan();
                    plan.PlanId = (int)reader.GetValue(0);
                    plan.Nivel = (string)reader.GetValue(1);
                    lista.Add(plan);
                }
            }
            return lista;
        }

        public Afiliado buscarPlanAfiliado(int numero)
        {
            SqlCommand func = armarFuncionTabla("OBTENER_PLAN_AFILIADO");
            func = agregarStringParamFuncion(func, numero.ToString());
            Afiliado Afiliado = armarPlanAfiliado(func);
            if (Afiliado != null)
            {
                Afiliado.numero = numero;
            }

            return Afiliado;
        }

        private Afiliado armarPlanAfiliado(SqlCommand comando)
        {

            Afiliado afiliado = null;
            SqlDataReader reader;
            comando.CommandText = comando.CommandText + ")";

            using (comando)
            {
                reader = comando.ExecuteReader();
                if (reader.Read())
                {
                    afiliado = new Afiliado();
                    afiliado.detalle = new DetallePersona();
                    afiliado.plan = new Plan();

                    afiliado.detalle.Nombre = reader.GetString(0);
                    afiliado.detalle.Apellido = reader.GetString(1);
                    afiliado.Habilitado = (bool)reader.GetSqlBoolean(2);
                    afiliado.plan.PlanId = (Int32)reader.GetValue(3);
                    afiliado.plan.Nivel = reader.GetString(4);
                    afiliado.plan.PrecioConsulta = (Decimal)reader.GetSqlDecimal(5);
                    afiliado.grupoFamiliar = (Int32)reader.GetValue(6);
                }
            }

            return afiliado;
        }
    }
}
