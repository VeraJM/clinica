using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class Especialidad
    {
        public int EspecialidadId { get; set; }
        public string Descripcion { get; set; }
        public string Tipo { get; set; }

        public override string ToString()
        {
            return Descripcion;
        }
    }
}
