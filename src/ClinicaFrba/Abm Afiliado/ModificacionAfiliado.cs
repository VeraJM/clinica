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

namespace ClinicaFrba.Abm_Afiliado
{
    public partial class ModificacionAfiliado : Form
    {
        private BindingSource bindingSource1 = new BindingSource();

        public List<Afiliado> listaAfiliados { get; set; }
        public ModificacionAfiliado()
        {
            InitializeComponent();
            listaAfiliados = new List<Afiliado>();
        }

        private void limpiar_Click(object sender, EventArgs e)
        {
            afiliadoDataGrid.DataSource = null;
            afiliadoDataGrid.Columns.Clear();
        }

        private void cargar_Click(object sender, EventArgs e)
        {
            afiliadoDataGrid.DataSource = bindingSource1;
            ActualizarTabla();
        }

        private void ActualizarTabla()
        {
            using (AfiliadoDAO dao = new AfiliadoDAO())
            {
                try
                {
                    afiliadoDataGrid.Columns.Clear();
                    DataTable table = dao.buscarAfiliados(this.listaAfiliados);
                    DataGridViewButtonColumn btn = new DataGridViewButtonColumn();
                    afiliadoDataGrid.Columns.Add(btn);
                    btn.HeaderText = "Seleccionar";
                    btn.Text = "Modificar";
                    btn.Name = "btnModificar";
                    btn.UseColumnTextForButtonValue = true;
                    bindingSource1.DataSource = table;
                }
                catch (Exception e)
                {
                    MessageBox.Show(e.Message);
                }
            }
        }

        private void afiliadoDataGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            using (AfiliadoDAO dao = new AfiliadoDAO())
            {
                if (e.ColumnIndex == 0)
                {
                    int indiceColumnaNombre = e.ColumnIndex + 1;
                    int codigo = (int)afiliadoDataGrid[indiceColumnaNombre, e.RowIndex].Value;
                    Afiliado afil = listaAfiliados.Find(a => a.codigo == codigo);
                    var AAM = new ModificarAfiliado(afil);
                    AAM.Show();
                }
                ActualizarTabla();
            }
        }
    }
}
