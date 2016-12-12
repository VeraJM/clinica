namespace ClinicaFrba.Registro_Resultado
{
    partial class RegistroDiagnostico
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
            this.quitarSintoma = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.agregarSintoma = new System.Windows.Forms.Button();
            this.Sintomas = new System.Windows.Forms.ListBox();
            this.label2 = new System.Windows.Forms.Label();
            this.guardar = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.sintomaBox = new System.Windows.Forms.ComboBox();
            this.diagnosticoTextBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.diagnosticoBox = new System.Windows.Forms.GroupBox();
            this.label4 = new System.Windows.Forms.Label();
            this.turno = new System.Windows.Forms.NumericUpDown();
            this.groupBox1.SuspendLayout();
            this.diagnosticoBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.turno)).BeginInit();
            this.SuspendLayout();
            // 
            // quitarSintoma
            // 
            this.quitarSintoma.Location = new System.Drawing.Point(381, 39);
            this.quitarSintoma.Name = "quitarSintoma";
            this.quitarSintoma.Size = new System.Drawing.Size(132, 23);
            this.quitarSintoma.TabIndex = 21;
            this.quitarSintoma.Text = "Quitar sintoma";
            this.quitarSintoma.UseVisualStyleBackColor = true;
            this.quitarSintoma.Click += new System.EventHandler(this.quitarSintoma_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(15, 15);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(84, 13);
            this.label3.TabIndex = 20;
            this.label3.Text = "Ingresar sintoma";
            // 
            // agregarSintoma
            // 
            this.agregarSintoma.Location = new System.Drawing.Point(381, 10);
            this.agregarSintoma.Name = "agregarSintoma";
            this.agregarSintoma.Size = new System.Drawing.Size(77, 23);
            this.agregarSintoma.TabIndex = 19;
            this.agregarSintoma.Text = "Agregar";
            this.agregarSintoma.UseVisualStyleBackColor = true;
            this.agregarSintoma.Click += new System.EventHandler(this.agregarSintoma_Click);
            // 
            // Sintomas
            // 
            this.Sintomas.FormattingEnabled = true;
            this.Sintomas.Location = new System.Drawing.Point(145, 38);
            this.Sintomas.Name = "Sintomas";
            this.Sintomas.Size = new System.Drawing.Size(218, 95);
            this.Sintomas.TabIndex = 18;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(15, 38);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(124, 13);
            this.label2.TabIndex = 16;
            this.label2.Text = "Sintomas del diagnostico";
            // 
            // guardar
            // 
            this.guardar.Location = new System.Drawing.Point(469, 383);
            this.guardar.Name = "guardar";
            this.guardar.Size = new System.Drawing.Size(77, 23);
            this.guardar.TabIndex = 15;
            this.guardar.Text = "Guardar";
            this.guardar.UseVisualStyleBackColor = true;
            this.guardar.Click += new System.EventHandler(this.guardar_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.sintomaBox);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.Sintomas);
            this.groupBox1.Controls.Add(this.quitarSintoma);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.agregarSintoma);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(534, 149);
            this.groupBox1.TabIndex = 22;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Sintomas";
            // 
            // sintomaBox
            // 
            this.sintomaBox.FormattingEnabled = true;
            this.sintomaBox.Location = new System.Drawing.Point(145, 7);
            this.sintomaBox.Name = "sintomaBox";
            this.sintomaBox.Size = new System.Drawing.Size(218, 21);
            this.sintomaBox.TabIndex = 22;
            // 
            // diagnosticoTextBox
            // 
            this.diagnosticoTextBox.Location = new System.Drawing.Point(135, 26);
            this.diagnosticoTextBox.Multiline = true;
            this.diagnosticoTextBox.Name = "diagnosticoTextBox";
            this.diagnosticoTextBox.Size = new System.Drawing.Size(389, 116);
            this.diagnosticoTextBox.TabIndex = 23;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(15, 29);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(110, 13);
            this.label1.TabIndex = 24;
            this.label1.Text = "Ingrese el diagnostico";
            // 
            // diagnosticoBox
            // 
            this.diagnosticoBox.Controls.Add(this.label4);
            this.diagnosticoBox.Controls.Add(this.turno);
            this.diagnosticoBox.Controls.Add(this.label1);
            this.diagnosticoBox.Controls.Add(this.diagnosticoTextBox);
            this.diagnosticoBox.Location = new System.Drawing.Point(12, 167);
            this.diagnosticoBox.Name = "diagnosticoBox";
            this.diagnosticoBox.Size = new System.Drawing.Size(534, 210);
            this.diagnosticoBox.TabIndex = 25;
            this.diagnosticoBox.TabStop = false;
            this.diagnosticoBox.Text = "Diagnostico";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(7, 161);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(122, 13);
            this.label4.TabIndex = 26;
            this.label4.Text = "Ingresar codigo de turno";
            // 
            // turno
            // 
            this.turno.Location = new System.Drawing.Point(135, 159);
            this.turno.Maximum = new decimal(new int[] {
            1000000000,
            0,
            0,
            0});
            this.turno.Name = "turno";
            this.turno.Size = new System.Drawing.Size(96, 20);
            this.turno.TabIndex = 25;
            this.turno.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // RegistroDiagnostico
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(562, 418);
            this.Controls.Add(this.diagnosticoBox);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.guardar);
            this.Name = "RegistroDiagnostico";
            this.Text = "Registro de Diagnostico";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.diagnosticoBox.ResumeLayout(false);
            this.diagnosticoBox.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.turno)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button quitarSintoma;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button agregarSintoma;
        private System.Windows.Forms.ListBox Sintomas;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button guardar;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox diagnosticoTextBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox diagnosticoBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.NumericUpDown turno;
        private System.Windows.Forms.ComboBox sintomaBox;
    }
}