using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class Filtro
    {
        public int Anio { get; set; }
        public int Semestre { get; set; }
        public string ResponsableCancelacion { get; set; }
        public int Plan { get; set; }
        public int Especialidad { get; set; }

        public Filtro(int anio, int sem, string responsable)
        {
            Anio = anio;
            Semestre = sem;
            ResponsableCancelacion = responsable;
        }
        public Filtro()
        {

        }

        public void AgregarPlan(int pln)
        {
            this.Plan = pln;
        }
    }
}
