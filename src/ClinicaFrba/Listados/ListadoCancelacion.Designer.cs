namespace ClinicaFrba.Listados
{
    partial class ListadoCancelacion
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
            this.anioUpDown = new System.Windows.Forms.NumericUpDown();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.filtroCancelacion = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.semestreComboBox = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.cancelacionesGridView = new System.Windows.Forms.DataGridView();
            this.buscar = new System.Windows.Forms.Button();
            this.Limpiar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.anioUpDown)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cancelacionesGridView)).BeginInit();
            this.SuspendLayout();
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
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.filtroCancelacion);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.semestreComboBox);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.anioUpDown);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Location = new System.Drawing.Point(22, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(590, 92);
            this.groupBox1.TabIndex = 7;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Seleccion de consulta";
            // 
            // filtroCancelacion
            // 
            this.filtroCancelacion.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.filtroCancelacion.FormattingEnabled = true;
            this.filtroCancelacion.Location = new System.Drawing.Point(272, 34);
            this.filtroCancelacion.Name = "filtroCancelacion";
            this.filtroCancelacion.Size = new System.Drawing.Size(97, 21);
            this.filtroCancelacion.TabIndex = 12;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(182, 35);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(84, 13);
            this.label3.TabIndex = 11;
            this.label3.Text = "Cancelacion por";
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
            // cancelacionesGridView
            // 
            this.cancelacionesGridView.AllowUserToAddRows = false;
            this.cancelacionesGridView.AllowUserToDeleteRows = false;
            this.cancelacionesGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.cancelacionesGridView.Location = new System.Drawing.Point(22, 156);
            this.cancelacionesGridView.Name = "cancelacionesGridView";
            this.cancelacionesGridView.ReadOnly = true;
            this.cancelacionesGridView.Size = new System.Drawing.Size(590, 252);
            this.cancelacionesGridView.TabIndex = 9;
            // 
            // buscar
            // 
            this.buscar.Location = new System.Drawing.Point(537, 127);
            this.buscar.Name = "buscar";
            this.buscar.Size = new System.Drawing.Size(75, 23);
            this.buscar.TabIndex = 10;
            this.buscar.Text = "Buscar";
            this.buscar.UseVisualStyleBackColor = true;
            this.buscar.Click += new System.EventHandler(this.buscar_Click);
            // 
            // Limpiar
            // 
            this.Limpiar.Location = new System.Drawing.Point(22, 127);
            this.Limpiar.Name = "Limpiar";
            this.Limpiar.Size = new System.Drawing.Size(75, 23);
            this.Limpiar.TabIndex = 11;
            this.Limpiar.Text = "Limpiar";
            this.Limpiar.UseVisualStyleBackColor = true;
            this.Limpiar.Click += new System.EventHandler(this.Limpiar_Click);
            // 
            // ListadoCancelaciones
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(643, 446);
            this.Controls.Add(this.Limpiar);
            this.Controls.Add(this.buscar);
            this.Controls.Add(this.cancelacionesGridView);
            this.Controls.Add(this.groupBox1);
            this.Name = "ListadoCancelacion";
            this.Text = "Cancelaciones";
            ((System.ComponentModel.ISupportInitialize)(this.anioUpDown)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cancelacionesGridView)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.NumericUpDown anioUpDown;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ComboBox semestreComboBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox filtroCancelacion;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DataGridView cancelacionesGridView;
        private System.Windows.Forms.Button buscar;
        private System.Windows.Forms.Button Limpiar;

    }
}