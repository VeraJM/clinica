using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClinicaFrba.AbmRol
{
    public partial class ABMRol : Form
    {
        public ABMRol()
        {
            InitializeComponent();
        }

        private void Alta_Rol_Click(object sender, EventArgs e)
        {
            //Solo abre una vez el form
            if ((Application.OpenForms["AltaRol"] as AltaRol) == null)
            {
                var alta = new AltaRol();
                alta.Show();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //Solo abre una vez el form
            if ((Application.OpenForms["BajaRol"] as BajaRol) == null)
            {
                var baja = new BajaRol();
                baja.Show();
            }
        }

        private void Modificacion_Rol_Click(object sender, EventArgs e)
        {
            //Solo abre una vez el form
            if ((Application.OpenForms["ModificacionRol"] as ModificacionRol) == null)
            {
                var modificacion = new ModificacionRol();
                modificacion.Show();
            }
        }
    }
}
