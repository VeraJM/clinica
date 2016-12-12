using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class Agenda
    {
        public int AgendaId { get; set; }
        public DateTime Dia { get; set; }
        public DateTime HorarioComienzo { get; set; }
    }
}
