using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class Turno
    {
        public Int32 codigo { get; set; }
        public Int32 numero { get; set; }
        public string fecha { get; set; }
        public Profesional profesional { get; set; }
        public Afiliado afiliado { get; set; }

        public override string ToString()
        {
            return fecha;
        }
    }
}
