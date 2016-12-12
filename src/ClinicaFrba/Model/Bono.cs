using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class Bono
    {
        public int BonoCod { get; set; }
        public Plan Plan { get; set; }
        public bool utilizado { get; set; }
        public long NroConsulta { get; set; }
        public Afiliado Afiliado { get; set; }

        public override string ToString()
        {
            return "Bono" + (Plan != null ? " " + Plan.Nivel : "");
        }
    }
}
