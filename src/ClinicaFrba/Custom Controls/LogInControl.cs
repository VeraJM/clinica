using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClinicaFrba.Custom_Controls
{
    public partial class LogInControl : UserControl
    {
        public LogInControl()
        {
            InitializeComponent();
        }

        private void AcceptButton_Click(object sender, EventArgs e)
        {
            string username = UsernameTextBox.Text;
            string password = PasswordTextBox.Text;
            LoginForm parent = (LoginForm)this.ParentForm;
            parent.Login(username, password);
        }

        public void ShowErrorMessage(Exception ex)
        {
            MessageBox.Show(ex.Message);
        }
    }
}
