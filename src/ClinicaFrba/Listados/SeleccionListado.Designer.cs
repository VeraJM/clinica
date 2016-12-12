namespace ClinicaFrba.Listados
{
    partial class SeleccionListado
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
            this.estadCancelaciones = new System.Windows.Forms.Button();
            this.profMasConsultados = new System.Windows.Forms.Button();
            this.profMenosHoras = new System.Windows.Forms.Button();
            this.afilMasBonos = new System.Windows.Forms.Button();
            this.especMedBonos = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // estadCancelaciones
            // 
            this.estadCancelaciones.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.estadCancelaciones.Location = new System.Drawing.Point(39, 38);
            this.estadCancelaciones.Name = "estadCancelaciones";
            this.estadCancelaciones.Size = new System.Drawing.Size(266, 45);
            this.estadCancelaciones.TabIndex = 0;
            this.estadCancelaciones.Text = "Estadistica de especialidades que mas registraron cancelaciones";
            this.estadCancelaciones.UseVisualStyleBackColor = true;
            this.estadCancelaciones.Click += new System.EventHandler(this.estadCancelaciones_Click);
            // 
            // profMasConsultados
            // 
            this.profMasConsultados.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.profMasConsultados.Location = new System.Drawing.Point(39, 89);
            this.profMasConsultados.Name = "profMasConsultados";
            this.profMasConsultados.Size = new System.Drawing.Size(266, 37);
            this.profMasConsultados.TabIndex = 1;
            this.profMasConsultados.Text = "Profesionales mas consultados";
            this.profMasConsultados.UseVisualStyleBackColor = true;
            this.profMasConsultados.Click += new System.EventHandler(this.profMasConsultados_Click);
            // 
            // profMenosHoras
            // 
            this.profMenosHoras.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.profMenosHoras.Location = new System.Drawing.Point(39, 132);
            this.profMenosHoras.Name = "profMenosHoras";
            this.profMenosHoras.Size = new System.Drawing.Size(266, 44);
            this.profMenosHoras.TabIndex = 2;
            this.profMenosHoras.Text = "Profesionales con menos horas trabajadas";
            this.profMenosHoras.UseVisualStyleBackColor = true;
            this.profMenosHoras.Click += new System.EventHandler(this.profMenosHoras_Click);
            // 
            // afilMasBonos
            // 
            this.afilMasBonos.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.afilMasBonos.Location = new System.Drawing.Point(39, 182);
            this.afilMasBonos.Name = "afilMasBonos";
            this.afilMasBonos.Size = new System.Drawing.Size(266, 44);
            this.afilMasBonos.TabIndex = 3;
            this.afilMasBonos.Text = "Afiliados con mayor cantidad de bonos comprados";
            this.afilMasBonos.UseVisualStyleBackColor = true;
            this.afilMasBonos.Click += new System.EventHandler(this.afilMasBonos_Click);
            // 
            // especMedBonos
            // 
            this.especMedBonos.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.especMedBonos.Location = new System.Drawing.Point(39, 232);
            this.especMedBonos.Name = "especMedBonos";
            this.especMedBonos.Size = new System.Drawing.Size(266, 44);
            this.especMedBonos.TabIndex = 4;
            this.especMedBonos.Text = "Especialidades con mas bonos utilizados";
            this.especMedBonos.UseVisualStyleBackColor = true;
            this.especMedBonos.Click += new System.EventHandler(this.especMedBonos_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.especMedBonos);
            this.groupBox1.Controls.Add(this.estadCancelaciones);
            this.groupBox1.Controls.Add(this.afilMasBonos);
            this.groupBox1.Controls.Add(this.profMasConsultados);
            this.groupBox1.Controls.Add(this.profMenosHoras);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(24, 22);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(355, 308);
            this.groupBox1.TabIndex = 5;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Seleccionar estadistica";
            // 
            // SeleccionListado
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(401, 353);
            this.Controls.Add(this.groupBox1);
            this.Name = "SeleccionListado";
            this.Text = "Listados de estadistica";
            this.groupBox1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button estadCancelaciones;
        private System.Windows.Forms.Button profMasConsultados;
        private System.Windows.Forms.Button profMenosHoras;
        private System.Windows.Forms.Button afilMasBonos;
        private System.Windows.Forms.Button especMedBonos;
        private System.Windows.Forms.GroupBox groupBox1;
    }
}