using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using ClinicaFrba.Model;

namespace ClinicaFrba.DAO
{
    public class EspecialidadDAO : DataAccessObject
    {

        public List<Especialidad> getEspecialidades()
        {
            SqlCommand func = armarFuncionTabla("OBTENER_ESPECIALIDADES");

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
    }
}
