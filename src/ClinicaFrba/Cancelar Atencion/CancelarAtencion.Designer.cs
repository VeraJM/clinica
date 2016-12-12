namespace ClinicaFrba.Cancelar_Atencion
{
    partial class CancelarAtencion
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
            this.gridTurnos = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.btnConsultar = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.cboMotivos = new System.Windows.Forms.ComboBox();
            this.txtDetalle = new System.Windows.Forms.RichTextBox();
            this.label3 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.gridTurnos)).BeginInit();
            this.SuspendLayout();
            // 
            // gridTurnos
            // 
            this.gridTurnos.AllowUserToAddRows = false;
            this.gridTurnos.AllowUserToDeleteRows = false;
            this.gridTurnos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridTurnos.Location = new System.Drawing.Point(14, 139);
            this.gridTurnos.Name = "gridTurnos";
            this.gridTurnos.ReadOnly = true;
            this.gridTurnos.Size = new System.Drawing.Size(619, 150);
            this.gridTurnos.TabIndex = 7;
            this.gridTurnos.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.gridTurnos_CellContentClick_1);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(11, 123);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(92, 13);
            this.label1.TabIndex = 28;
            this.label1.Text = "Turnos solicitados";
            // 
            // btnConsultar
            // 
            this.btnConsultar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnConsultar.Location = new System.Drawing.Point(476, 295);
            this.btnConsultar.Name = "btnConsultar";
            this.btnConsultar.Size = new System.Drawing.Size(157, 23);
            this.btnConsultar.TabIndex = 35;
            this.btnConsultar.Text = "Consultar";
            this.btnConsultar.UseVisualStyleBackColor = true;
            this.btnConsultar.Click += new System.EventHandler(this.btnConsultar_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(9, 18);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(39, 13);
            this.label2.TabIndex = 37;
            this.label2.Text = "Motivo";
            // 
            // cboMotivos
            // 
            this.cboMotivos.FormattingEnabled = true;
            this.cboMotivos.Location = new System.Drawing.Point(12, 34);
            this.cboMotivos.Name = "cboMotivos";
            this.cboMotivos.Size = new System.Drawing.Size(233, 21);
            this.cboMotivos.TabIndex = 36;
            // 
            // txtDetalle
            // 
            this.txtDetalle.Location = new System.Drawing.Point(273, 34);
            this.txtDetalle.Name = "txtDetalle";
            this.txtDetalle.Size = new System.Drawing.Size(360, 55);
            this.txtDetalle.TabIndex = 38;
            this.txtDetalle.Text = "";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(270, 18);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(40, 13);
            this.label3.TabIndex = 39;
            this.label3.Text = "Detalle";
            // 
            // CancelarAtencion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(645, 375);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtDetalle);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.cboMotivos);
            this.Controls.Add(this.btnConsultar);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.gridTurnos);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "CancelarAtencion";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Cancelación de Turnos";
            ((System.ComponentModel.ISupportInitialize)(this.gridTurnos)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView gridTurnos;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnConsultar;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cboMotivos;
        private System.Windows.Forms.RichTextBox txtDetalle;
        private System.Windows.Forms.Label label3;
    }
}