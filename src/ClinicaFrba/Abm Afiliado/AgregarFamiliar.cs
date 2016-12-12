using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ClinicaFrba.Model;

namespace ClinicaFrba.Abm_Afiliado
{
    public partial class AgregarFamiliar : Form
    {
        public int numeroAfiliado { get; set; }
        public int famAAnotar { get; set; }
        public int grupofamilia { get; set; }

        public AgregarFamiliar(int numero, int aAnotar,int unGrupofamilia)
        {
            InitializeComponent();
            numeroAfiliado = numero;
            famAAnotar = aAnotar - 1;
            grupofamilia = unGrupofamilia;
        }

        private void si_Click_1(object sender, EventArgs e)
        {
            var afiliado = new Afiliado(numeroAfiliado, famAAnotar, grupofamilia);
            var alta = new AltaAfiliado(afiliado);
            this.Visible = false;
            alta.Show();
        }

        private void no_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
