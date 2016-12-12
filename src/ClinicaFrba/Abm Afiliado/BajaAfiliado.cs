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
    public partial class BajaAfiliado : Form
    {
        private BindingSource bindingSource1 = new BindingSource();

        public BajaAfiliado()
        {
            InitializeComponent();
        }

        private void limpiar_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = null;
            dataGridView1.Columns.Clear();
        }


        private void ActualizarTabla()
        {
            using (AfiliadoDAO dao = new AfiliadoDAO())
            {
                try
                {
                    dataGridView1.Columns.Clear();
                    DataTable table = dao.buscarAfiliadosHabilitados();
                    DataGridViewButtonColumn btn = new DataGridViewButtonColumn();
                    dataGridView1.Columns.Add(btn);
                    btn.HeaderText = "Seleccionar";
                    btn.Text = "Dar de baja";
                    btn.Name = "btnBaja";
                    btn.UseColumnTextForButtonValue = true;
                    bindingSource1.DataSource = table;

                }
                catch (Exception e)
                {
                    MessageBox.Show(e.Message);
                }
            }
        }

        private void buscar_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = bindingSource1;
            ActualizarTabla();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            using (AfiliadoDAO dao = new AfiliadoDAO())
            {
                if (e.ColumnIndex == 0)
                {
                    int indiceColumnaNombre = e.ColumnIndex + 1;
                    int indiceFila = e.RowIndex;
                    int codigo = (int)dataGridView1[indiceColumnaNombre, indiceFila].Value;
                    dao.darBajaAfiliado(codigo);
                    MessageBox.Show("Se dio de baja al afiliado de codigo: " + codigo);
                }
                ActualizarTabla();
            }
        }
    }
}
