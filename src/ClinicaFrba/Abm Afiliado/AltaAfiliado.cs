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
    public partial class AltaAfiliado : Form
    {
        public List<Plan> planes { get; set; }
        public List<EstadoCivil> listaEstadosCiviles { get; set; }
        public Afiliado afiliadoNuevo { get; set; }
        public int cantidadFamiliares { get; set; }

        public AltaAfiliado(Afiliado afil)
        {
            InitializeComponent();
            cargarDropBoxes();
            afiliadoNuevo = afil;
        }

        public AltaAfiliado()
        {
            InitializeComponent();
            cargarDropBoxes();
            afiliadoNuevo = new Afiliado();
        }

        private void guardar_Click(object sender, EventArgs e)
        {
            try
            {
                string pass = password.Text;
                string repass = repassword.Text;
                if (String.IsNullOrWhiteSpace(password.Text) || String.IsNullOrWhiteSpace(repassword.Text) || String.IsNullOrWhiteSpace(username.Text)
                    || String.IsNullOrWhiteSpace(mail.Text) || String.IsNullOrWhiteSpace(telefono.Text) || String.IsNullOrWhiteSpace(direccion.Text)
                    || String.IsNullOrWhiteSpace(nroDoc.Text) || String.IsNullOrWhiteSpace(TipoDoc.Text) || String.IsNullOrWhiteSpace(Apellido.Text)
                    || String.IsNullOrWhiteSpace(Nombre.Text) || String.IsNullOrWhiteSpace(cantidadHijos.Text))
                {
                    throw new InvalidOperationException("Por favor, complete todos los campos");
                }
                if (pass != repass)
                {
                    throw new InvalidOperationException("La contraseña ingresada no es igual al campo de validacion");
                }
                if (estadoCivilCombo.SelectedItem == null)
                {
                    throw new InvalidOperationException("Debe seleccionar un estado civil");
                }
                if (sexoComboBox.SelectedItem == null)
                {
                    throw new InvalidOperationException("Debe seleccionar el género");
                }
                if (listaPlanes.SelectedItem == null)
                {
                    throw new InvalidOperationException("Debe seleccionar el plan");
                }
                long l;
                if (!long.TryParse(nroDoc.Text, out l) || l < 0)
                {
                    throw new InvalidOperationException(String.Format("{0} no es un numero de documento válido", nroDoc.Text));
                }
                if (!long.TryParse(telefono.Text, out l) || l < 0)
                {
                    throw new InvalidOperationException(String.Format("{0} no es un numero de telefono válido", telefono.Text));
                }
                if (!long.TryParse(cantidadHijos.Text, out l) || l < 0)
                {
                    throw new InvalidOperationException(String.Format("{0} no es un numero de cantidad de hijos o familiares a cargo válido", cantidadHijos.Text));
                }
                cargarAfiliado();

                MessageBox.Show("Se guardaron los datos correctamente.");
                this.Visible = false;
                int famAAnotar;
                if (afiliadoNuevo.numero == 1)
                {
                    famAAnotar = afiliadoNuevo.cantidad_hijos;
                }
                else
                {
                    famAAnotar = afiliadoNuevo.familiaresPorAnotar;
                }
                bool conyugePregunta = String.Equals(afiliadoNuevo.estadoCivil.Descripcion, "Casado/a", StringComparison.CurrentCulture) || String.Equals(afiliadoNuevo.estadoCivil.Descripcion, "Concubinato", StringComparison.CurrentCulture);
                if (conyugePregunta && (afiliadoNuevo.numero == 1))
                {
                    int nuevoNumeroAfiliado = afiliadoNuevo.numero + 1;
                    var nuevoConyuge = new AgregarConyuge(nuevoNumeroAfiliado, famAAnotar,afiliadoNuevo.grupoFamiliar);
                    nuevoConyuge.Show();
                }
                else
                {
                    if (famAAnotar >= 1)
                    {
                        int nuevoNumeroAfiliado = afiliadoNuevo.numero + 1;
                        var nuevoFamiliar = new AgregarFamiliar(nuevoNumeroAfiliado, famAAnotar, afiliadoNuevo.grupoFamiliar);
                        nuevoFamiliar.Show();
                    }
                    else
                    {
                        this.Close();
                    }
                }
            }
            catch (Exception excepcion)
            {
                MessageBox.Show(excepcion.Message);
            }
        }

        private void cargarAfiliado()
        {
            afiliadoNuevo.usuario.Username = username.Text;
            afiliadoNuevo.usuario.Password = password.Text;
            int cant;
            string estadoSeleccionado = estadoCivilCombo.SelectedItem.ToString();
            string planSeleccionado = listaPlanes.SelectedItem.ToString();
            Int32.TryParse(cantidadHijos.Text, out cant);
            afiliadoNuevo.cantidad_hijos = cant;
            afiliadoNuevo.estadoCivil = listaEstadosCiviles.Find(estado => estado.Descripcion == estadoSeleccionado);
            afiliadoNuevo.plan = planes.Find(plan => plan.Nivel == planSeleccionado);
            afiliadoNuevo.detalle.Nombre = Nombre.Text;
            afiliadoNuevo.detalle.Apellido = Apellido.Text;
            afiliadoNuevo.detalle.Sexo = sexoComboBox.SelectedItem.ToString();
            afiliadoNuevo.detalle.Direccion = direccion.Text;
            afiliadoNuevo.detalle.FechaNacimiento = dateTimePicker1.Value;
            afiliadoNuevo.detalle.Mail = mail.Text;
            afiliadoNuevo.detalle.Telefono = telefono.Text;
            afiliadoNuevo.detalle.TipoDoc = TipoDoc.Text;
            afiliadoNuevo.detalle.NroDoc = nroDoc.Text;
            using (UsuarioDAO dao = new UsuarioDAO())
            {
                dao.InsertarUsuario(afiliadoNuevo.usuario, "AFILIADO");
            }
            using (AfiliadoDAO dao = new AfiliadoDAO())
            {
                dao.insertarAfiliado(afiliadoNuevo);
            }
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

        public void cargarDropBoxes()
        {
            sexoComboBox.DropDownStyle = ComboBoxStyle.DropDownList;
            sexoComboBox.Items.Add("Masculino");
            sexoComboBox.Items.Add("Femenino");
            listaPlanes.DropDownStyle = ComboBoxStyle.DropDownList;
            estadoCivilCombo.DropDownStyle = ComboBoxStyle.DropDownList;
            ArmarListaPlanes();
            ArmarListaEstadosCiviles();
        }

    }
}
