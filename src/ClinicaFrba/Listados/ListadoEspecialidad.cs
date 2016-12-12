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
    public partial class ListadoEspecialidad : Form
    {
        private BindingSource bindingSource1 = new BindingSource();

        public ListadoEspecialidad()
        {
            InitializeComponent();
            cargarDropBoxes();
        }

        private void buscar_Click(object sender, EventArgs e)
        {
            EspecMasBonosGridView.DataSource = bindingSource1;
            ActualizarTabla();
        }

        private void limpiar_Click(object sender, EventArgs e)
        {
            EspecMasBonosGridView.DataSource = null;
            EspecMasBonosGridView.Columns.Clear();
        }

        public void cargarDropBoxes()
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
                    EspecMasBonosGridView.Columns.Clear();
                    var filtro = armarFiltro();
                    DataTable table = dao.armarEstadisticaEspecMasBonos(filtro);
                    bindingSource1.DataSource = table;
                    if (table.Rows.Count >= 1)
                    {
                        EspecMasBonosGridView.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.AllCellsExceptHeader);
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
