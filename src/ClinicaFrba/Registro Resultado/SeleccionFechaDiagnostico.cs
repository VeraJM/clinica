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

namespace ClinicaFrba.Registro_Resultado
{
    public partial class SeleccionFechaDiagnostico : Form
    {
        public SeleccionFechaDiagnostico()
        {
            InitializeComponent();

            checkBox1.Checked = true;
            fechaDiagPicker.Enabled = false;
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                fechaDiagPicker.Enabled = false;
            }
            else
            {
                fechaDiagPicker.Enabled = true;
            }
        }

        private void siguiente_Click(object sender, EventArgs e)
        {
            var diag = new Diagnostico();
            if (checkBox1.Checked)
            {
                diag.Fecha = null;
            }
            else
            {
                diag.Fecha = fechaDiagPicker.Value;
            }

            var reg = new RegistroDiagnostico(diag);
            this.Visible = false;
            reg.Visible = true;
        }
    }
}
