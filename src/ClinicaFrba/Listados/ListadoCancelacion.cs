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
    public partial class ListadoCancelacion : Form
    {
        private BindingSource bindingSource1 = new BindingSource();

        public ListadoCancelacion()
        {
            InitializeComponent();
            ArmarComboBoxes();
        }

        public void ArmarComboBoxes()
        {
            semestreComboBox.DropDownStyle = ComboBoxStyle.DropDownList;
            semestreComboBox.Items.Add(1);
            semestreComboBox.Items.Add(2);
            filtroCancelacion.DropDownStyle = ComboBoxStyle.DropDownList;
            filtroCancelacion.Items.Add("Afiliado");
            filtroCancelacion.Items.Add("Profesional");
            filtroCancelacion.Items.Add("Ambos");
        }

        private void Limpiar_Click(object sender, EventArgs e)
        {
            cancelacionesGridView.DataSource = null;
            cancelacionesGridView.Columns.Clear();
        }

        private void buscar_Click(object sender, EventArgs e)
        {
            cancelacionesGridView.DataSource = bindingSource1;
            ActualizarTabla();
        }

        public void ActualizarTabla()
        {
            using (EstadisticaDAO dao = new EstadisticaDAO())
            {
                try
                {
                    cancelacionesGridView.Columns.Clear();
                    var filtro = armarFiltro();
                    DataTable table = dao.armarEstadisticaCancelaciones(filtro);
                    bindingSource1.DataSource = table;
                    if (table.Rows.Count >= 1)
                    {
                        cancelacionesGridView.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.AllCellsExceptHeader);
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

            if (filtroCancelacion.SelectedItem == null)
            {
                throw new InvalidOperationException("Seleccionar un filtro de responsable de cancelacion para continuar");
            }

            Filtro filtro = new Filtro();
            filtro.Anio = (int)anioUpDown.Value;
            filtro.Semestre = (int)semestreComboBox.SelectedItem;
            filtro.ResponsableCancelacion = (string)filtroCancelacion.SelectedItem;

            return filtro;
        }
    }
}
