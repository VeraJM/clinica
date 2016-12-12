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
    public partial class ListadoAfiliadoMasBonos : Form
    {
        private BindingSource bindingSource1 = new BindingSource();

        public ListadoAfiliadoMasBonos()
        {
            InitializeComponent();
            ArmarComboBoxes();
        }

        private void limpiar_Click(object sender, EventArgs e)
        {
            AfilMasBonosGridView.DataSource = null;
            AfilMasBonosGridView.Columns.Clear();
        }

        private void buscar_Click(object sender, EventArgs e)
        {
            AfilMasBonosGridView.DataSource = bindingSource1;
            ActualizarTabla();
        }

        public void ArmarComboBoxes()
        {
            semestreComboBox.DropDownStyle = ComboBoxStyle.DropDownList;
            semestreComboBox.Items.Add(1);
            semestreComboBox.Items.Add(2);
        }

        public void ActualizarTabla()
        {
            using (EstadisticaDAO dao = new EstadisticaDAO())
            {
                try
                {
                    AfilMasBonosGridView.Columns.Clear();
                    var filtro = armarFiltro();
                    DataTable table = dao.armarEstadisticaAfilMasBonos(filtro);
                    bindingSource1.DataSource = table;
                    if (table.Rows.Count >= 1)
                    {
                        AfilMasBonosGridView.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.AllCellsExceptHeader);
                    }
                }
                catch (Exception e)
                {
                    MessageBox.Show(e.Message);
                }
            }
        }

        public Filtro armarFiltro()
        {
            if (semestreComboBox.SelectedItem == null)
            {
                throw new InvalidOperationException("Seleccionar un semestre para continuar.");
            }

            Filtro filtro = new Filtro();
            filtro.Anio = (int)anioUpDown.Value;
            filtro.Semestre = (int)semestreComboBox.SelectedItem;

            return filtro;
        }
    }
}
