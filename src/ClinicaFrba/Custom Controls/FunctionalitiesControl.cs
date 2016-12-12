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

namespace ClinicaFrba.Custom_Controls
{
    public partial class FunctionalitiesControl : UserControl
    {

        private List<string> functionalities;

        public FunctionalitiesControl()
        {
            InitializeComponent();
            functionalities = new List<string>();
        }

        public void BuildScreen(Rol role)
        {

            using (RolDAO dao = new RolDAO())
            {
                try
                {
                    this.functionalities = dao.getFuncionalidesDeRol(role.Nombre);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }

            for (int i = 0; i < this.functionalities.Count; i++)
            {
                string functionality = functionalities[i];
                Button button = new Button();
                button.Text = functionality;
                button.Location = new System.Drawing.Point(40, i * 32);
                button.Size = new Size(250, 30);
                button.Click += (s, e) =>
                {
                    OnFunctionalityClicked(functionality);
                };
                this.Controls.Add(button);
            }

        }

        private void OnFunctionalityClicked(string functionality)
        {
            LoginForm parent = (LoginForm)this.ParentForm;
            parent.OpenFunctionality(functionality);
        }
    }
}
