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

namespace ClinicaFrba.AbmRol
{
    public partial class BajaRol : Form
    {
        private BindingSource bindingSource1 = new BindingSource();

        public BajaRol()
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
            using (RolDAO dao = new RolDAO())
            {
                try
                {
                    dataGridView1.Columns.Clear();
                    DataTable table = dao.buscarRolesHabilitados();
                    DataGridViewButtonColumn btn = new DataGridViewButtonColumn();
                    dataGridView1.Columns.Add(btn);
                    btn.HeaderText = "Seleccionar";
                    btn.Text = "Dar de baja";
                    btn.Name = "btnBaja";
                    btn.UseColumnTextForButtonValue = true;
                    bindingSource1.DataSource = table;
                    dataGridView1.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.AllCellsExceptHeader);
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

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {
            using (RolDAO dao = new RolDAO())
            {
                if (e.ColumnIndex == 0)
                {
                    int indiceColumnaNombre = e.ColumnIndex + 1;
                    int indiceFila = e.RowIndex;
                    string rol = dataGridView1[indiceColumnaNombre, indiceFila].Value.ToString();
                    dao.darBajaRol(rol);
                    MessageBox.Show("Se dio de baja el rol: " + rol);
                }
                ActualizarTabla();
            }
        }
    }
}
