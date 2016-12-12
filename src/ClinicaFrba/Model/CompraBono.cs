using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class CompraBono
    {
        public int CompraBonoCod { get; set; }
        public Afiliado Afiliado { get; set; }
        public DateTime Fecha { get; set; }
        public int Cantidad { get; set; }
        public double ImporteConsulta { get; set; }
        public double ImporteFarmacia { get; set; }

    }
}
