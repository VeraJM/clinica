namespace ClinicaFrba.Pedir_Turno
{
    partial class PedirTurno
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
            this.cboEspecialidades = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.cboProfesionales = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cboFechasDisponibles = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cboHorariosDisponibles = new System.Windows.Forms.ComboBox();
            this.btnSolicitar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(8, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(79, 13);
            this.label1.TabIndex = 27;
            this.label1.Text = "Especialidad";
            // 
            // cboEspecialidades
            // 
            this.cboEspecialidades.FormattingEnabled = true;
            this.cboEspecialidades.Location = new System.Drawing.Point(11, 36);
            this.cboEspecialidades.Name = "cboEspecialidades";
            this.cboEspecialidades.Size = new System.Drawing.Size(233, 21);
            this.cboEspecialidades.TabIndex = 26;
            this.cboEspecialidades.SelectedIndexChanged += new System.EventHandler(this.cboEspecialidades_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(247, 20);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(70, 13);
            this.label2.TabIndex = 29;
            this.label2.Text = "Profesional";
            // 
            // cboProfesionales
            // 
            this.cboProfesionales.Enabled = false;
            this.cboProfesionales.FormattingEnabled = true;
            this.cboProfesionales.Location = new System.Drawing.Point(250, 36);
            this.cboProfesionales.Name = "cboProfesionales";
            this.cboProfesionales.Size = new System.Drawing.Size(248, 21);
            this.cboProfesionales.TabIndex = 28;
            this.cboProfesionales.SelectedIndexChanged += new System.EventHandler(this.cboProfesionales_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(9, 62);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(117, 13);
            this.label3.TabIndex = 31;
            this.label3.Text = "Fechas Disponibles";
            // 
            // cboFechasDisponibles
            // 
            this.cboFechasDisponibles.Enabled = false;
            this.cboFechasDisponibles.FormattingEnabled = true;
            this.cboFechasDisponibles.Location = new System.Drawing.Point(12, 78);
            this.cboFechasDisponibles.Name = "cboFechasDisponibles";
            this.cboFechasDisponibles.Size = new System.Drawing.Size(162, 21);
            this.cboFechasDisponibles.TabIndex = 30;
            this.cboFechasDisponibles.SelectedIndexChanged += new System.EventHandler(this.cboFechasDisponibles_SelectedIndexChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(8, 110);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(48, 13);
            this.label4.TabIndex = 33;
            this.label4.Text = "Horario";
            // 
            // cboHorariosDisponibles
            // 
            this.cboHorariosDisponibles.Enabled = false;
            this.cboHorariosDisponibles.FormattingEnabled = true;
            this.cboHorariosDisponibles.Location = new System.Drawing.Point(11, 126);
            this.cboHorariosDisponibles.Name = "cboHorariosDisponibles";
            this.cboHorariosDisponibles.Size = new System.Drawing.Size(163, 21);
            this.cboHorariosDisponibles.TabIndex = 32;
            // 
            // btnSolicitar
            // 
            this.btnSolicitar.Location = new System.Drawing.Point(341, 157);
            this.btnSolicitar.Name = "btnSolicitar";
            this.btnSolicitar.Size = new System.Drawing.Size(157, 23);
            this.btnSolicitar.TabIndex = 34;
            this.btnSolicitar.Text = "Solicitar Turno";
            this.btnSolicitar.UseVisualStyleBackColor = true;
            this.btnSolicitar.Click += new System.EventHandler(this.btnSolicitar_Click);
            // 
            // frmPedirTurno
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(511, 189);
            this.Controls.Add(this.btnSolicitar);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.cboHorariosDisponibles);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.cboFechasDisponibles);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.cboProfesionales);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cboEspecialidades);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "PedirTurno";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Pedir Turno";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cboEspecialidades;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cboProfesionales;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cboFechasDisponibles;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cboHorariosDisponibles;
        private System.Windows.Forms.Button btnSolicitar;
    }
}