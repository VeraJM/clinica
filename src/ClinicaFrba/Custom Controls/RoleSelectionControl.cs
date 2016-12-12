using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ClinicaFrba.DAO;
using ClinicaFrba.Model;
using ClinicaFrba.Utils;

namespace ClinicaFrba.Custom_Controls
{
    public partial class RoleSelectionControl : UserControl
    {
        private List<Rol> roles;
        
        public RoleSelectionControl()
        {
            InitializeComponent();
            roles = new List<Rol>();
        }

        public void InsertRoles(string username)
        {
            using (UsuarioDAO dao = new UsuarioDAO())
            {
                try
                {
                    this.roles = dao.getRolesUsuario(username);

                    if (roles.Count > 1)
                    {
                        BuildScreen(roles);
                    }
                    else if (roles.Count == 1)
                    {
                        EnterAsRole(0);
                    }
                    else if (roles.Count == 0)
                    {
                        MessageBox.Show("Ha ocurrido un problema con los roles de su usuario. Por favor, contáctese con el administrador del sistema.");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        public void BuildScreen(List<Rol> roles)
        {
            for (int i = 0; i < roles.Count; i++)
            {
                Rol rol = roles[i];
                int position = i ;
                Button button = new Button();
                button.Text = rol.Nombre;
                button.Location = new System.Drawing.Point(100, i * 50);
                button.Size = new Size(100, 40);
                button.Click += (s, e) =>
                    {
                        EnterAsRole(position);
                    };
                this.Controls.Add(button);
            }
         }

         private void EnterAsRole(int i)
        {
            LoginForm parent = (LoginForm)this.ParentForm;
            parent.EnterAsRole(roles[i]);
         }
    }
}

