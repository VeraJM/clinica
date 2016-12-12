namespace ClinicaFrba.Registro_Llegada
{
    partial class RegistroLlegada
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
            this.label2 = new System.Windows.Forms.Label();
            this.cboProfesionales = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.cboEspecialidades = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cboHorariosDisponibles = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cboFechas = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.cboAfiliado = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.cboBonos = new System.Windows.Forms.ComboBox();
            this.btnRegistrar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(248, 19);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(70, 13);
            this.label2.TabIndex = 33;
            this.label2.Text = "Profesional";
            // 
            // cboProfesionales
            // 
            this.cboProfesionales.Enabled = false;
            this.cboProfesionales.FormattingEnabled = true;
            this.cboProfesionales.Location = new System.Drawing.Point(251, 35);
            this.cboProfesionales.Name = "cboProfesionales";
            this.cboProfesionales.Size = new System.Drawing.Size(248, 21);
            this.cboProfesionales.TabIndex = 32;
            this.cboProfesionales.SelectedIndexChanged += new System.EventHandler(this.cboProfesionales_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(9, 19);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(79, 13);
            this.label1.TabIndex = 31;
            this.label1.Text = "Especialidad";
            // 
            // cboEspecialidades
            // 
            this.cboEspecialidades.FormattingEnabled = true;
            this.cboEspecialidades.Location = new System.Drawing.Point(12, 35);
            this.cboEspecialidades.Name = "cboEspecialidades";
            this.cboEspecialidades.Size = new System.Drawing.Size(233, 21);
            this.cboEspecialidades.TabIndex = 30;
            this.cboEspecialidades.SelectedIndexChanged += new System.EventHandler(this.cboEspecialidades_SelectedIndexChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(9, 116);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(48, 13);
            this.label4.TabIndex = 37;
            this.label4.Text = "Horario";
            // 
            // cboHorariosDisponibles
            // 
            this.cboHorariosDisponibles.Enabled = false;
            this.cboHorariosDisponibles.FormattingEnabled = true;
            this.cboHorariosDisponibles.Location = new System.Drawing.Point(12, 132);
            this.cboHorariosDisponibles.Name = "cboHorariosDisponibles";
            this.cboHorariosDisponibles.Size = new System.Drawing.Size(163, 21);
            this.cboHorariosDisponibles.TabIndex = 36;
            this.cboHorariosDisponibles.SelectedIndexChanged += new System.EventHandler(this.cboHorariosDisponibles_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(10, 68);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(42, 13);
            this.label3.TabIndex = 35;
            this.label3.Text = "Fecha";
            // 
            // cboFechas
            // 
            this.cboFechas.Enabled = false;
            this.cboFechas.FormattingEnabled = true;
            this.cboFechas.Location = new System.Drawing.Point(13, 84);
            this.cboFechas.Name = "cboFechas";
            this.cboFechas.Size = new System.Drawing.Size(162, 21);
            this.cboFechas.TabIndex = 34;
            this.cboFechas.SelectedIndexChanged += new System.EventHandler(this.cboFechas_SelectedIndexChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(10, 172);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(49, 13);
            this.label5.TabIndex = 39;
            this.label5.Text = "Afiliado";
            // 
            // cboAfiliado
            // 
            this.cboAfiliado.Enabled = false;
            this.cboAfiliado.FormattingEnabled = true;
            this.cboAfiliado.Location = new System.Drawing.Point(13, 188);
            this.cboAfiliado.Name = "cboAfiliado";
            this.cboAfiliado.Size = new System.Drawing.Size(233, 21);
            this.cboAfiliado.TabIndex = 38;
            this.cboAfiliado.SelectedIndexChanged += new System.EventHandler(this.cboAfiliado_SelectedIndexChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(248, 172);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(89, 13);
            this.label6.TabIndex = 41;
            this.label6.Text = "Bono Consulta";
            // 
            // cboBonos
            // 
            this.cboBonos.Enabled = false;
            this.cboBonos.FormattingEnabled = true;
            this.cboBonos.Location = new System.Drawing.Point(251, 188);
            this.cboBonos.Name = "cboBonos";
            this.cboBonos.Size = new System.Drawing.Size(248, 21);
            this.cboBonos.TabIndex = 40;
            // 
            // btnRegistrar
            // 
            this.btnRegistrar.Location = new System.Drawing.Point(341, 233);
            this.btnRegistrar.Name = "btnRegistrar";
            this.btnRegistrar.Size = new System.Drawing.Size(157, 23);
            this.btnRegistrar.TabIndex = 42;
            this.btnRegistrar.Text = "Registrar";
            this.btnRegistrar.UseVisualStyleBackColor = true;
            this.btnRegistrar.Click += new System.EventHandler(this.btnRegistrar_Click);
            // 
            // frmRegistroLlegada
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(510, 269);
            this.Controls.Add(this.btnRegistrar);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.cboBonos);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.cboAfiliado);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.cboHorariosDisponibles);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.cboFechas);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.cboProfesionales);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cboEspecialidades);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "RegistroLlegada";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Registro de Llegada de Afiliado";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cboProfesionales;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cboEspecialidades;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cboHorariosDisponibles;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cboFechas;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox cboAfiliado;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ComboBox cboBonos;
        private System.Windows.Forms.Button btnRegistrar;
    }
}