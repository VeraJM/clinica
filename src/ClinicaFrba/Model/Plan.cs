using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class Plan
    {
        public int PlanId { get; set; }
        public string Nivel { get; set; }
        public decimal PrecioConsulta { get; set; }
        public decimal PrecioFarmacia { get; set; }
    }
}
