using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public static class LogInManager
    {
        public static Int32 usuarioId { get; set; }
        public static Int32 profesionalId { get; set; }
        public static Int32 afiliadoId { get; set; }
        public static Rol AssignedRole { get; set; }
        public static Int32 afiliadoNro { get; set; }
    }
}
