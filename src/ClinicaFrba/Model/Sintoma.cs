using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class Sintoma
    {
        public int Codigo { get; set; }
        public string Descripcion { get; set; }

        public Sintoma(int cod, string desc)
        {
            Codigo = cod;
            Descripcion = desc;
        }

        public Sintoma()
        {
        }
    }
}
