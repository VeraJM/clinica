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
using ClinicaFrba.Abm_Planes;

namespace ClinicaFrba.Abm_Afiliado
{
    public partial class ModificarAfiliado : Form
    {
        public List<Plan> planes { get; set; }
        public List<EstadoCivil> listaEstadosCiviles { get; set; }
        public string planViejo { get; set; }
        public Afiliado afiliadoAModificar { get; set; }

        public ModificarAfiliado(Afiliado afil)
        {
            InitializeComponent();
            afiliadoAModificar = afil;
            listaPlanes.DropDownStyle = ComboBoxStyle.DropDownList;
            estadoCivilCombo.DropDownStyle = ComboBoxStyle.DropDownList;
            sexoComboBox.DropDownStyle = ComboBoxStyle.DropDownList;
            ArmarListaPlanes();
            ArmarListaEstadosCiviles();
            sexoComboBox.Items.Add("Masculino");
            sexoComboBox.Items.Add("Femenino");
            cantidadHijos.Text = afil.cantidad_hijos.ToString();
            estadoCivilCombo.SelectedItem = afil.estadoCivil.Descripcion;
            listaPlanes.SelectedItem = afil.plan.Nivel;
            direccion.Text = afil.detalle.Direccion;
            telefono.Text = afil.detalle.Telefono;
            mail.Text = afil.detalle.Mail;
            sexoComboBox.SelectedItem = afil.detalle.Sexo;
            planViejo = afil.plan.Nivel;
        }

        private void ArmarListaPlanes()
        {
            using (PlanDAO dao = new PlanDAO())
            {
                this.planes = dao.getPlanes();
                foreach (Plan plan in planes)
                {
                    listaPlanes.Items.Add(plan.Nivel);
                }
            }
        }

        private void ArmarListaEstadosCiviles()
        {
            using (AfiliadoDAO dao = new AfiliadoDAO())
            {
                this.listaEstadosCiviles = dao.getEstadosCiviles();
                foreach (EstadoCivil cc in listaEstadosCiviles)
                {
                    estadoCivilCombo.Items.Add(cc.Descripcion);
                }
            }
        }

        private void Guardar_Click(object sender, EventArgs e)
        {

            string planSeleccionado = listaPlanes.SelectedItem.ToString();
            afiliadoAModificar.plan = planes.Find(plan => plan.Nivel == planSeleccionado);
            afiliadoAModificar.detalle.Direccion = direccion.Text;
            afiliadoAModificar.detalle.Mail = mail.Text;
            afiliadoAModificar.detalle.Telefono = telefono.Text;
            try
            {
                int cantHijos;
                if (estadoCivilCombo.SelectedItem == null)
                {
                    throw new InvalidOperationException("Por favor, seleccione un estado civil");
                }
                if (sexoComboBox.SelectedItem == null)
                {
                    throw new InvalidOperationException("Por favor, seleccione el género");
                }
                if (!Int32.TryParse(cantidadHijos.Text, out cantHijos) || cantHijos < 0)
                {
                    throw new InvalidOperationException(String.Format("{0} no es un numero de cantidad de hijos o familiares a cargo válido", cantidadHijos.Text));
                }
                afiliadoAModificar.detalle.Sexo = sexoComboBox.SelectedItem.ToString();
                string estadoSeleccionado = estadoCivilCombo.SelectedItem.ToString();
                afiliadoAModificar.estadoCivil = listaEstadosCiviles.Find(estado => estado.Descripcion == estadoSeleccionado);
                afiliadoAModificar.cantidad_hijos = cantHijos;

                if (planViejo != planSeleccionado)
                {
                    int codigoPlanViejo = planes.Find(plan => plan.Nivel == planViejo).PlanId;
                    var camPlan = new CambioPlan(afiliadoAModificar, codigoPlanViejo);
                    this.Visible = false;
                    camPlan.Show();
                }
                else
                {
                    using (AfiliadoDAO dao = new AfiliadoDAO())
                    {
                        dao.ModificarAfiliado(afiliadoAModificar, "", false, -1);
                    }
                    MessageBox.Show("Se han guardado los datos de manera correcta.");
                    this.Close();
                }
            }
            catch (Exception exc)
            {
                MessageBox.Show(exc.Message);
            }
        }
    }
}
