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
    public partial class ListadoProfesionalConsultado : Form
    {
        public List<Plan> planes { get; set; }
        private BindingSource bindingSource1 = new BindingSource();

        public ListadoProfesionalConsultado()
        {            
            InitializeComponent();
            cargarDropBoxes();
        }

        public void cargarDropBoxes()
        {
            filtroPlan.DropDownStyle = ComboBoxStyle.DropDownList;
            ArmarListaPlanes();

            semestreComboBox.DropDownStyle = ComboBoxStyle.DropDownList;
            semestreComboBox.Items.Add(1);
            semestreComboBox.Items.Add(2);
        }

        private void ArmarListaPlanes()
        {
            using (PlanDAO dao = new PlanDAO())
            {
                this.planes = dao.getPlanes();
                foreach (Plan plan in planes)
                {
                    filtroPlan.Items.Add(plan.Nivel);
                }
            }
        }

        private void limpiar_Click(object sender, EventArgs e)
        {
            ProfMasConsultadosGridView.DataSource = null;
            ProfMasConsultadosGridView.Columns.Clear();
        }

        private void buscar_Click(object sender, EventArgs e)
        {
            ProfMasConsultadosGridView.DataSource = bindingSource1;
            ActualizarTabla();
        }

        public void ActualizarTabla()
        {
            using (EstadisticaDAO dao = new EstadisticaDAO())
            {
                try
                {
                    ProfMasConsultadosGridView.Columns.Clear();
                    var filtro = armarFiltro();
                    DataTable table = dao.armarEstadisticaProfMasConsultados(filtro);
                    bindingSource1.DataSource = table;
                    if (table.Rows.Count >= 1)
                    {
                        ProfMasConsultadosGridView.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.AllCellsExceptHeader);
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

            if (filtroPlan.SelectedItem == null)
            {
                throw new InvalidOperationException("Seleccionar un filtro de plan para continuar");
            }

            Filtro filtro = new Filtro();
            filtro.Anio = (int)anioUpDown.Value;
            filtro.Semestre = (int)semestreComboBox.SelectedItem;        
            Plan planSeleccionado = planes.Find(plan => plan.Nivel == (string)filtroPlan.SelectedItem);
            filtro.AgregarPlan(planSeleccionado.PlanId);
            return filtro;
        }
    }
}
