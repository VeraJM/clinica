using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ClinicaFrba.DAO;
using ClinicaFrba.Model;
using ClinicaFrba.Utils;

namespace ClinicaFrba.Listados
{
    public partial class SeleccionListado : Form
    {
        public SeleccionListado()
        {
            InitializeComponent();
        }

        private void estadCancelaciones_Click(object sender, EventArgs e)
        {

            if ((Application.OpenForms["ListadoCancelacion"] as ListadoCancelacion) == null)
            {
                var list = new ListadoCancelacion();
                list.Show();
            }
        }

        private void profMasConsultados_Click(object sender, EventArgs e)
        {
            if ((Application.OpenForms["ListadoProfesionalConsultado"] as ListadoProfesionalConsultado) == null)
            {
                var list = new ListadoProfesionalConsultado();
                list.Show();
            }
        }

        private void profMenosHoras_Click(object sender, EventArgs e)
        {
            if ((Application.OpenForms["ListadoProfMenosHorasTrabajadas"] as ListadoProfesionalHorasTrabajadas) == null)
            {
                var list = new ListadoProfesionalHorasTrabajadas();
                list.Show();
            }
        }

        private void afilMasBonos_Click(object sender, EventArgs e)
        {
            if ((Application.OpenForms["ListadoProfesionalHorasTrabajadas"] as ListadoProfesionalHorasTrabajadas) == null)
            {
                var list = new ListadoProfesionalHorasTrabajadas();
                list.Show();
            }
        }

        private void especMedBonos_Click(object sender, EventArgs e)
        {
            if ((Application.OpenForms["ListadoEspecialidad"] as ListadoEspecialidad) == null)
            {
                var list = new ListadoEspecialidad();
                list.Show();
            }
        }
    }
}
