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
using System.Security.Cryptography;

namespace ClinicaFrba
{
    public partial class LoginForm : Form
    {
        private Hasher hasher = new Hasher(new SHA256Managed());
        public LoginForm()
        {
            InitializeComponent();
        }

        public void Login(string username, string password)
        {
            using (UsuarioDAO dao = new UsuarioDAO())
            {
                try
                {
                    dao.EjecutarLogIn(username, password);
                    dao.CargarDatosUsusario(username);
                    OnLogInSuccess(username);
                }
                catch (Exception ex)
                {
                    OnLogInError(ex);
                }
            }
        }

        public void OnLogInSuccess(string username)
        {
            this.logInControl.Visible = false;
            this.roleSelectionControl.Visible = true;
            this.functionalitiesControl.Visible = false;
            roleSelectionControl.InsertRoles(username);
        }

        public void OnLogInError(Exception ex)
        {
            this.logInControl.ShowErrorMessage(ex);
        }

        public void EnterAsRole(Rol role)
        {
            LogInManager.AssignedRole = role;
            this.functionalitiesControl.BuildScreen(role);
            this.logInControl.Visible = false;
            this.roleSelectionControl.Visible = false;
            this.functionalitiesControl.Visible = true;
        }

        public void OpenFunctionality(string functionality)
        {
            Form form = FunctionalitiesHelper.GetForm(functionality);
            form.Show();
        }
    }
}
