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
    public partial class RolAModificar : Form
    {
        public string NombreViejo { get; set; }

        public RolAModificar(string rol)
        {
            InitializeComponent();
            NombreViejo = rol;
            nombreRol.Text = rol;
            comboBoxFuncionalidades.DropDownStyle = ComboBoxStyle.DropDownList;
            ArmarDropdownFuncionalidades();
            ArmarListadoFuncionalidades();
            setearCheckbox(rol);
        }

        public void setearCheckbox(string rol)
        {
            int estado;
            using (RolDAO dao = new RolDAO())
            {
                estado = dao.getHabilitacion(rol);
                Habilitar.Checked = (estado == 1);
            }
        }

        public void ArmarDropdownFuncionalidades()
        {
            using (RolDAO dao = new RolDAO())
            {
                List<string> funcionalidades = dao.getFuncionalides();
                foreach (string func in funcionalidades)
                {
                    comboBoxFuncionalidades.Items.Add(func);
                }
            }
        }

        public void ArmarListadoFuncionalidades()
        {
            using (RolDAO dao = new RolDAO())
            {
                List<string> funcs = dao.getFuncionalidesDeRol(nombreRol.Text);
                foreach (string func in funcs)
                {
                    Funcionalidades.Items.Add(func);
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (comboBoxFuncionalidades.SelectedItem != null)
            {
                string func = comboBoxFuncionalidades.SelectedItem.ToString();
                if (!Funcionalidades.Items.Contains(func))
                {
                    Funcionalidades.Items.Add(func);
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (Funcionalidades.SelectedItem != null)
            {
                string func = Funcionalidades.SelectedItem.ToString();
                if (Funcionalidades.Items.Contains(func))
                {
                    Funcionalidades.Items.Remove(func);
                }
            }
        }

        private void guardarRol_Click(object sender, EventArgs e)
        {
            string nombre = nombreRol.Text;
            List<String> funcionalidades = new List<string>();

            if (String.IsNullOrWhiteSpace(nombre)) //Si el campo esta vacio, no inserta los datos
            {
                MessageBox.Show("Completar el campo nombre para poder guardar.");
            }
            else
            {
                using (RolDAO dao = new RolDAO())
                {
                    try
                    {
                        int habilitado = getHabilitado();
                        dao.actualizarRol(nombre, NombreViejo, habilitado);
                        dao.limpiarFuncionalidadRol(nombre);
                        foreach (string item in Funcionalidades.Items)
                        {
                            dao.AgregarFuncionalidad(nombre, item.ToString());
                        }
                        MessageBox.Show("Se han guardado los datos de manera correcta.");
                        this.Close();
                    }
                    catch (Exception exc)
                    {
                        MessageBox.Show(exc.Message);
                    }
                }
            }

        }

        private int getHabilitado()
        {
            if (Habilitar.Checked)
                return 1;
            else
                return 0;
        }

        private void RolAModificar_Load(object sender, EventArgs e)
        {

        }

        private void Habilitar_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}
