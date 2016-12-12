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

namespace ClinicaFrba.Abm_Planes
{
    public partial class CambioPlan : Form
    {
        public Afiliado afiliadoAModificar { get; set; }
        public int codigoViejo { get; set; }
        public CambioPlan(Afiliado afil, int codigoPlanViejo)
        {
            InitializeComponent();
            afiliadoAModificar = afil;
            codigoViejo = codigoPlanViejo;
        }

        private void Guardar_Click(object sender, EventArgs e)
        {
            try
            {
                using (AfiliadoDAO dao = new AfiliadoDAO())
                {
                    dao.ModificarAfiliado(afiliadoAModificar, Motivo.Text, true, codigoViejo);
                }
            }
            catch (Exception exc)
            {
                MessageBox.Show(exc.Message);
            }
            MessageBox.Show("Se han guardado los datos de manera correcta.");
            this.Close();
        }
    }
}
