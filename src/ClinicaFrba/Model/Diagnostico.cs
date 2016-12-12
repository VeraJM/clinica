using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class Diagnostico
    {
        public int DiagnosticoId { get; set; }
        public string Descripcion { get; set; }
        public DateTime? Fecha { get; set; }
        public List<Sintoma> Sintomas { get; set; }
        public int TurnoCod { get; set; }
        public Diagnostico()
        {
            Sintomas = new List<Sintoma>();
        }
    }
}
