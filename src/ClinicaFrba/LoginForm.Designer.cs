namespace ClinicaFrba
{
    partial class LoginForm
    {
        /// <summary>
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.functionalitiesControl = new ClinicaFrba.Custom_Controls.FunctionalitiesControl();
            this.roleSelectionControl = new ClinicaFrba.Custom_Controls.RoleSelectionControl();
            this.logInControl = new ClinicaFrba.Custom_Controls.LogInControl();
            this.SuspendLayout();
            // 
            // functionalitiesControl
            // 
            this.functionalitiesControl.Location = new System.Drawing.Point(7, 30);
            this.functionalitiesControl.Name = "functionalitiesControl";
            this.functionalitiesControl.Size = new System.Drawing.Size(400, 350);
            this.functionalitiesControl.TabIndex = 2;
            this.functionalitiesControl.Visible = false;
            // 
            // roleSelectionControl
            // 
            this.roleSelectionControl.Location = new System.Drawing.Point(37, 31);
            this.roleSelectionControl.Name = "roleSelectionControl";
            this.roleSelectionControl.Size = new System.Drawing.Size(294, 191);
            this.roleSelectionControl.TabIndex = 1;
            this.roleSelectionControl.Visible = false;
            // 
            // logInControl
            // 
            this.logInControl.Location = new System.Drawing.Point(28, 22);
            this.logInControl.Name = "logInControl";
            this.logInControl.Size = new System.Drawing.Size(326, 222);
            this.logInControl.TabIndex = 0;
            // 
            // LoginForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(383, 362);
            this.Controls.Add(this.functionalitiesControl);
            this.Controls.Add(this.roleSelectionControl);
            this.Controls.Add(this.logInControl);
            this.Name = "LoginForm";
            this.Text = "Clinica";
            this.ResumeLayout(false);

        }

        #endregion

        private Custom_Controls.LogInControl logInControl;
        private Custom_Controls.RoleSelectionControl roleSelectionControl;
        private Custom_Controls.FunctionalitiesControl functionalitiesControl;
    }
}

