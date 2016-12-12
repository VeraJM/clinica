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
    public partial class AltaRol : Form
    {
        public AltaRol()
        {
            InitializeComponent();
            comboBoxFuncionalidades.DropDownStyle = ComboBoxStyle.DropDownList;
            ArmarListaFuncionalidades();
        }

        public void ArmarListaFuncionalidades()
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
                        dao.InsertarRol(nombre);
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

        private void Funcionalidades_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (comboBoxFuncionalidades.SelectedItem == null)
            {
                return;
            }

            string func = comboBoxFuncionalidades.SelectedItem.ToString();

            if (Funcionalidades.Items.Contains(func))
            {
                Funcionalidades.Items.Remove(func);
            }
        }

        private void comboBoxFuncionalidades_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void nombreRol_TextChanged(object sender, EventArgs e)
        {

        }

    }
}
