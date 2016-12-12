namespace ClinicaFrba.Listados
{
    partial class ListadoProfesionalHorasTrabajadas
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
            this.ProfMenosHorasGridView = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.especComboBox = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.filtroPlan = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.semestreComboBox = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.anioUpDown = new System.Windows.Forms.NumericUpDown();
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.ProfMenosHorasGridView)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.anioUpDown)).BeginInit();
            this.SuspendLayout();
            // 
            // limpiar
            // 
            this.limpiar.Location = new System.Drawing.Point(12, 132);
            this.limpiar.Name = "limpiar";
            this.limpiar.Size = new System.Drawing.Size(75, 23);
            this.limpiar.TabIndex = 19;
            this.limpiar.Text = "Limpiar";
            this.limpiar.UseVisualStyleBackColor = true;
            this.limpiar.Click += new System.EventHandler(this.limpiar_Click);
            // 
            // buscar
            // 
            this.buscar.Location = new System.Drawing.Point(527, 132);
            this.buscar.Name = "buscar";
            this.buscar.Size = new System.Drawing.Size(75, 23);
            this.buscar.TabIndex = 18;
            this.buscar.Text = "Buscar";
            this.buscar.UseVisualStyleBackColor = true;
            this.buscar.Click += new System.EventHandler(this.buscar_Click);
            // 
            // ProfMenosHorasGridView
            // 
            this.ProfMenosHorasGridView.AllowUserToAddRows = false;
            this.ProfMenosHorasGridView.AllowUserToDeleteRows = false;
            this.ProfMenosHorasGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ProfMenosHorasGridView.Location = new System.Drawing.Point(12, 161);
            this.ProfMenosHorasGridView.Name = "ProfMenosHorasGridView";
            this.ProfMenosHorasGridView.ReadOnly = true;
            this.ProfMenosHorasGridView.Size = new System.Drawing.Size(590, 252);
            this.ProfMenosHorasGridView.TabIndex = 17;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.especComboBox);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.filtroPlan);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.semestreComboBox);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.anioUpDown);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Location = new System.Drawing.Point(12, 17);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(590, 94);
            this.groupBox1.TabIndex = 16;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Seleccion de consulta";
            // 
            // especComboBox
            // 
            this.especComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.especComboBox.FormattingEnabled = true;
            this.especComboBox.Location = new System.Drawing.Point(280, 58);
            this.especComboBox.Name = "especComboBox";
            this.especComboBox.Size = new System.Drawing.Size(171, 21);
            this.especComboBox.TabIndex = 14;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(207, 61);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(67, 13);
            this.label4.TabIndex = 13;
            this.label4.Text = "Especialidad";
            // 
            // filtroPlan
            // 
            this.filtroPlan.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.filtroPlan.FormattingEnabled = true;
            this.filtroPlan.Location = new System.Drawing.Point(280, 31);
            this.filtroPlan.Name = "filtroPlan";
            this.filtroPlan.Size = new System.Drawing.Size(171, 21);
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
            // ListadoProfMenosHorasTrabajadas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(641, 465);
            this.Controls.Add(this.limpiar);
            this.Controls.Add(this.buscar);
            this.Controls.Add(this.ProfMenosHorasGridView);
            this.Controls.Add(this.groupBox1);
            this.Name = "ListadoProfesionalHorasTrabajadas";
            this.Text = "Profesionales con menos horas trabajadas";
            ((System.ComponentModel.ISupportInitialize)(this.ProfMenosHorasGridView)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.anioUpDown)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button limpiar;
        private System.Windows.Forms.Button buscar;
        private System.Windows.Forms.DataGridView ProfMenosHorasGridView;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ComboBox especComboBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox filtroPlan;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox semestreComboBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.NumericUpDown anioUpDown;
        private System.Windows.Forms.Label label2;
    }
}