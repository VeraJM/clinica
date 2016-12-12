namespace ClinicaFrba.Listados
{
    partial class ListadoProfesionalConsultado
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
            this.limpiar = new System.Windows.Forms.Button();
            this.buscar = new System.Windows.Forms.Button();
            this.ProfMasConsultadosGridView = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.filtroPlan = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.semestreComboBox = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.anioUpDown = new System.Windows.Forms.NumericUpDown();
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.ProfMasConsultadosGridView)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.anioUpDown)).BeginInit();
            this.SuspendLayout();
            // 
            // limpiar
            // 
            this.limpiar.Location = new System.Drawing.Point(12, 112);
            this.limpiar.Name = "limpiar";
            this.limpiar.Size = new System.Drawing.Size(75, 23);
            this.limpiar.TabIndex = 15;
            this.limpiar.Text = "Limpiar";
            this.limpiar.UseVisualStyleBackColor = true;
            this.limpiar.Click += new System.EventHandler(this.limpiar_Click);
            // 
            // buscar
            // 
            this.buscar.Location = new System.Drawing.Point(527, 112);
            this.buscar.Name = "buscar";
            this.buscar.Size = new System.Drawing.Size(75, 23);
            this.buscar.TabIndex = 14;
            this.buscar.Text = "Buscar";
            this.buscar.UseVisualStyleBackColor = true;
            this.buscar.Click += new System.EventHandler(this.buscar_Click);
            // 
            // ProfMasConsultadosGridView
            // 
            this.ProfMasConsultadosGridView.AllowUserToAddRows = false;
            this.ProfMasConsultadosGridView.AllowUserToDeleteRows = false;
            this.ProfMasConsultadosGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ProfMasConsultadosGridView.Location = new System.Drawing.Point(12, 141);
            this.ProfMasConsultadosGridView.Name = "ProfMasConsultadosGridView";
            this.ProfMasConsultadosGridView.ReadOnly = true;
            this.ProfMasConsultadosGridView.Size = new System.Drawing.Size(590, 252);
            this.ProfMasConsultadosGridView.TabIndex = 13;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.filtroPlan);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.semestreComboBox);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.anioUpDown);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(590, 94);
            this.groupBox1.TabIndex = 12;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Seleccion de consulta";
            // 
            // filtroPlan
            // 
            this.filtroPlan.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.filtroPlan.FormattingEnabled = true;
            this.filtroPlan.Location = new System.Drawing.Point(241, 34);
            this.filtroPlan.Name = "filtroPlan";
            this.filtroPlan.Size = new System.Drawing.Size(97, 21);
            this.filtroPlan.TabIndex = 12;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(207, 34);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(28, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "Plan";
            // 
            // semestreComboBox
            // 
            this.semestreComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.semestreComboBox.FormattingEnabled = true;
            this.semestreComboBox.Location = new System.Drawing.Point(65, 61);
            this.semestreComboBox.Name = "semestreComboBox";
            this.semestreComboBox.Size = new System.Drawing.Size(97, 21);
            this.semestreComboBox.TabIndex = 10;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(9, 64);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(51, 13);
            this.label1.TabIndex = 9;
            this.label1.Text = "Semestre";
            // 
            // anioUpDown
            // 
            this.anioUpDown.Location = new System.Drawing.Point(65, 35);
            this.anioUpDown.Maximum = new decimal(new int[] {
            2500,
            0,
            0,
            0});
            this.anioUpDown.Minimum = new decimal(new int[] {
            1950,
            0,
            0,
            0});
            this.anioUpDown.Name = "anioUpDown";
            this.anioUpDown.Size = new System.Drawing.Size(96, 20);
            this.anioUpDown.TabIndex = 6;
            this.anioUpDown.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.anioUpDown.Value = new decimal(new int[] {
            1950,
            0,
            0,
            0});
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(20, 37);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(26, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Año";
            // 
            // ListadoProfMasConsultados
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(639, 420);
            this.Controls.Add(this.limpiar);
            this.Controls.Add(this.buscar);
            this.Controls.Add(this.ProfMasConsultadosGridView);
            this.Controls.Add(this.groupBox1);
            this.Name = "ListadoProfesionalConsultado";
            this.Text = "Profesionales Mas Consultados";
            ((System.ComponentModel.ISupportInitialize)(this.ProfMasConsultadosGridView)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.anioUpDown)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button limpiar;
        private System.Windows.Forms.Button buscar;
        private System.Windows.Forms.DataGridView ProfMasConsultadosGridView;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ComboBox semestreComboBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.NumericUpDown anioUpDown;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox filtroPlan;
        private System.Windows.Forms.Label label3;
    }
}