using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class TipoCancelacion
    {
        public Int32 codigo { get; set; }
        public string descripcion { get; set; }

        public override string ToString()
        {
            return descripcion;
        }
    }
}
