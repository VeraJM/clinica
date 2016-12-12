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

namespace ClinicaFrba.Registro_Resultado
{
    public partial class RegistroDiagnostico : Form
    {
        public Diagnostico diagARegistrar { get; set; }
        public List<string> sintomasDropDown { get; set; }
        public List<Sintoma> sintomasList { get; set; }

        public RegistroDiagnostico(Diagnostico diag)
        {
            InitializeComponent();
            diagARegistrar = diag;
            sintomasList = new List<Sintoma>();
            sintomaBox.DropDownStyle = ComboBoxStyle.DropDownList;
            ArmarListaSintomas();
        }


        public void ArmarListaSintomas()
        {
            using (DiagnosticoDAO dao = new DiagnosticoDAO())
            {
                sintomasList = dao.getSintomas();
                foreach (Sintoma sint in sintomasList)
                {
                    sintomaBox.Items.Add(sint.Descripcion);
                }
            }
        }

        private void guardarDiagnostico(Diagnostico diag)
        {
            using (DiagnosticoDAO dao = new DiagnosticoDAO())
            {
                try
                {
                    dao.guardarDiagnostico(diag, sintomasList);

                    MessageBox.Show("Datos guardados correctamente");
                    this.Close();
                }
                catch (Exception e)
                {
                    MessageBox.Show("Ha ocurrido un error guardando los datos. Por favor, revise que su entrada fue correcta");
                }
            }
        }

        private void agregarSintoma_Click(object sender, EventArgs e)
        {
            if (sintomaBox.SelectedItem != null)
            {

                if (!Sintomas.Items.Contains(sintomaBox.Text))
                {
                    Sintomas.Items.Add(sintomaBox.Text);
                }
                else
                {
                    MessageBox.Show("No se ha ingresado ningun sintoma.");
                }
            }
        }

        private void quitarSintoma_Click(object sender, EventArgs e)
        {
            if (Sintomas.SelectedItem != null)
            {
                string sint = Sintomas.SelectedItem.ToString();
                if (Sintomas.Items.Contains(sint))
                {
                    Sintomas.Items.Remove(sint);
                }
            }
        }

        private void guardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Sintomas.Items.Count == 0)
                {
                    throw new InvalidOperationException("No se ingreso ningun sintoma.");
                }
                if (String.IsNullOrWhiteSpace(diagnosticoBox.Text))
                {
                    throw new InvalidOperationException("No se ingreso ningun diagnostico.");
                }

                if (turno.Value < 0)
                {
                    throw new InvalidOperationException("No se ingreso un turno valido");
                }

                diagARegistrar.Descripcion = diagnosticoTextBox.Text;
                diagARegistrar.TurnoCod = (int)turno.Value;
                guardarDiagnostico(diagARegistrar);
            }
            catch (Exception exc)
            {
                MessageBox.Show(exc.Message);
            }
        }
    }
}
