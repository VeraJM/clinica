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
    public partial class AgregarConyuge : Form
    {
        public int numeroAfiliado { get; set; }
        public int familiaresAAnotar { get; set; }
        public int grupofamilia { get; set; }

        public AgregarConyuge(int numero, int aAnotar, int unGrupofamilia)
        {
            InitializeComponent();
            numeroAfiliado = numero;
            familiaresAAnotar = aAnotar;
            grupofamilia = unGrupofamilia;
        }

        private void no_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void si_Click(object sender, EventArgs e)
        {
            var afiliado = new Afiliado(numeroAfiliado, familiaresAAnotar, grupofamilia);
            var alta = new AltaAfiliado(afiliado);
            this.Visible = false;
            alta.Show();
        }

    }
}
