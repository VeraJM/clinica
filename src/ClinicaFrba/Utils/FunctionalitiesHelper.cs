using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClinicaFrba.DAO;
using ClinicaFrba.Model;
using System.Windows.Forms;
using ClinicaFrba.AbmRol;
using ClinicaFrba.Abm_Afiliado;
using ClinicaFrba.Abm_Especialidades_Medicas;
using ClinicaFrba.Abm_Planes;
using ClinicaFrba.Cancelar_Atencion;
using ClinicaFrba.Compra_Bono;
using ClinicaFrba.Custom_Controls;
using ClinicaFrba.Pedir_Turno;
using ClinicaFrba.Registrar_Agenta_Medico;
using ClinicaFrba.Registro_Llegada;
using ClinicaFrba.Registro_Resultado;
using ClinicaFrba.Listados;

namespace ClinicaFrba.Utils
{
    public static class FunctionalitiesHelper
    {
        public static Form GetForm(string functionality)
        {
            switch (functionality)
            {
                case "ABM de Rol":
                    return new ABMRol();
                case "ABM de Afiliado":
                    return new ABMAfiliado();
                case "Registrar Agenda":
                    return new RegistrarAgenda();
                case "Compra de Bonos":
                    return new ComprarBonos(0);
                case "Pedir Turno":
                    return new PedirTurno();
                case "Registro de llegada para atencion medica":
                    return new RegistroLlegada();
                case "Registro de resultado para atencion medica":
                    return new SeleccionFechaDiagnostico();
                case "Cancelar atencion medica":
                    if (LogInManager.afiliadoId != 0)
                    {
                        return new CancelarAtencion();
                    }
                    else if (LogInManager.profesionalId != 0)
                    {
                        return new CancelarAgenda();
                    }
                    else
                    {
                        return new SinImplementacion();
                    }
                case "Listado estadistico":
                    return new SeleccionListado();
                default:
                    return new SinImplementacion();
            }
        }
    }
}
