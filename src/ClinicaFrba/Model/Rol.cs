using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class Rol
    {
        public int RolId { get; set; }
        public string Nombre { get; set; }
        public bool Habilitado { get; set; }
        public List<string> Funcionalidades { get; set; }

        public Rol()
        {
            Funcionalidades = new List<string>();
        }
    }
}
