using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class Profesional : Usuario
    {
        public Int32 codigo { get; set; }
        public DetallePersona detalle { get; set; }
        public string Matricula { get; set; }

        public override string ToString()
        {
            return detalle.Nombre + " " + detalle.Apellido;
        }
    }
}
