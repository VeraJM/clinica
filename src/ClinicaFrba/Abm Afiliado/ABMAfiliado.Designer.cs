namespace ClinicaFrba.Abm_Afiliado
{
    partial class ABMAfiliado
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
            this.label1 = new System.Windows.Forms.Label();
            this.botonBaja = new System.Windows.Forms.Button();
            this.Modificacion_Rol = new System.Windows.Forms.Button();
            this.Alta_Rol = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(37, 36);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(157, 13);
            this.label1.TabIndex = 8;
            this.label1.Text = "Elija una accion para un afiliado";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // botonBaja
            // 
            this.botonBaja.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.botonBaja.Location = new System.Drawing.Point(183, 74);
            this.botonBaja.Name = "botonBaja";
            this.botonBaja.Size = new System.Drawing.Size(75, 23);
            this.botonBaja.TabIndex = 7;
            this.botonBaja.Text = "Baja";
            this.botonBaja.UseVisualStyleBackColor = true;
            this.botonBaja.Click += new System.EventHandler(this.botonBaja_Click);
            // 
            // Modificacion_Rol
            // 
            this.Modificacion_Rol.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Modificacion_Rol.Location = new System.Drawing.Point(102, 74);
            this.Modificacion_Rol.Name = "Modificacion_Rol";
            this.Modificacion_Rol.Size = new System.Drawing.Size(75, 23);
            this.Modificacion_Rol.TabIndex = 6;
            this.Modificacion_Rol.Text = "Modificar";
            this.Modificacion_Rol.UseVisualStyleBackColor = true;
            this.Modificacion_Rol.Click += new System.EventHandler(this.Modificacion_Rol_Click);
            // 
            // Alta_Rol
            // 
            this.Alta_Rol.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Alta_Rol.Location = new System.Drawing.Point(12, 74);
            this.Alta_Rol.Name = "Alta_Rol";
            this.Alta_Rol.Size = new System.Drawing.Size(75, 23);
            this.Alta_Rol.TabIndex = 5;
            this.Alta_Rol.Text = "Alta";
            this.Alta_Rol.UseVisualStyleBackColor = true;
            this.Alta_Rol.Click += new System.EventHandler(this.Alta_Rol_Click);
            // 
            // ABMAfiliado
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(280, 136);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.botonBaja);
            this.Controls.Add(this.Modificacion_Rol);
            this.Controls.Add(this.Alta_Rol);
            this.Name = "ABMAfiliado";
            this.Text = "ABM Afiliado";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button botonBaja;
        private System.Windows.Forms.Button Modificacion_Rol;
        private System.Windows.Forms.Button Alta_Rol;
    }
}