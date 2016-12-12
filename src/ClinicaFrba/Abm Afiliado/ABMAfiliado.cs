using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClinicaFrba.Abm_Afiliado
{
    public partial class ABMAfiliado : Form
    {
        public ABMAfiliado()
        {
            InitializeComponent();
        }

        private void Modificacion_Rol_Click(object sender, EventArgs e)
        {
            if ((Application.OpenForms["ModificacionAfiliado"] as ModificacionAfiliado) == null)
            {
                var modif = new ModificacionAfiliado();
                modif.Show();
            }
        }

        private void Alta_Rol_Click(object sender, EventArgs e)
        {
           // if ((Application.OpenForms["AltaAfiliado"] as AltaAfiliado) == null)
            //{
               var alta = new AltaAfiliado();
                alta.Show();
           // }
        }

        private void botonBaja_Click(object sender, EventArgs e)
        {
            //Solo abre una vez el form
            if ((Application.OpenForms["BajaAfiliado"] as BajaAfiliado) == null)
            {
                var baja = new BajaAfiliado();
                baja.Show();
            }

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
