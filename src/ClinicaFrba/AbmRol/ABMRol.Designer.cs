namespace ClinicaFrba.AbmRol
{
    partial class ABMRol
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Alta_Rol = new System.Windows.Forms.Button();
            this.Modificacion_Rol = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // Alta_Rol
            // 
            this.Alta_Rol.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Alta_Rol.Location = new System.Drawing.Point(12, 69);
            this.Alta_Rol.Name = "Alta_Rol";
            this.Alta_Rol.Size = new System.Drawing.Size(75, 23);
            this.Alta_Rol.TabIndex = 1;
            this.Alta_Rol.Text = "Alta";
            this.Alta_Rol.UseVisualStyleBackColor = true;
            this.Alta_Rol.Click += new System.EventHandler(this.Alta_Rol_Click);
            // 
            // Modificacion_Rol
            // 
            this.Modificacion_Rol.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Modificacion_Rol.Location = new System.Drawing.Point(109, 69);
            this.Modificacion_Rol.Name = "Modificacion_Rol";
            this.Modificacion_Rol.Size = new System.Drawing.Size(75, 23);
            this.Modificacion_Rol.TabIndex = 2;
            this.Modificacion_Rol.Text = "Modificar";
            this.Modificacion_Rol.UseVisualStyleBackColor = true;
            this.Modificacion_Rol.Click += new System.EventHandler(this.Modificacion_Rol_Click);
            // 
            // button3
            // 
            this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button3.Location = new System.Drawing.Point(201, 69);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(75, 23);
            this.button3.TabIndex = 3;
            this.button3.Text = "Baja";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(54, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(185, 18);
            this.label1.TabIndex = 4;
            this.label1.Text = "Elija una acción para un rol";
            // 
            // ABMRol
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(311, 145);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.Modificacion_Rol);
            this.Controls.Add(this.Alta_Rol);
            this.Name = "ABMRol";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "ABMRol";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button Alta_Rol;
        private System.Windows.Forms.Button Modificacion_Rol;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Label label1;
    }
}