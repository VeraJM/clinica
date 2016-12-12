namespace ClinicaFrba.Abm_Afiliado
{
    partial class ModificacionAfiliado
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
            this.cargar = new System.Windows.Forms.Button();
            this.afiliadoDataGrid = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            ((System.ComponentModel.ISupportInitialize)(this.afiliadoDataGrid)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // limpiar
            // 
            this.limpiar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.limpiar.Location = new System.Drawing.Point(6, 71);
            this.limpiar.Name = "limpiar";
            this.limpiar.Size = new System.Drawing.Size(75, 23);
            this.limpiar.TabIndex = 9;
            this.limpiar.Text = "Limpiar";
            this.limpiar.UseVisualStyleBackColor = true;
            this.limpiar.Click += new System.EventHandler(this.limpiar_Click);
            // 
            // cargar
            // 
            this.cargar.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cargar.Location = new System.Drawing.Point(642, 74);
            this.cargar.Name = "cargar";
            this.cargar.Size = new System.Drawing.Size(75, 23);
            this.cargar.TabIndex = 10;
            this.cargar.Text = "Buscar";
            this.cargar.UseVisualStyleBackColor = true;
            this.cargar.Click += new System.EventHandler(this.cargar_Click);
            // 
            // afiliadoDataGrid
            // 
            this.afiliadoDataGrid.AllowUserToAddRows = false;
            this.afiliadoDataGrid.AllowUserToDeleteRows = false;
            this.afiliadoDataGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.afiliadoDataGrid.Location = new System.Drawing.Point(12, 115);
            this.afiliadoDataGrid.Name = "afiliadoDataGrid";
            this.afiliadoDataGrid.ReadOnly = true;
            this.afiliadoDataGrid.Size = new System.Drawing.Size(723, 360);
            this.afiliadoDataGrid.TabIndex = 11;
            this.afiliadoDataGrid.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.afiliadoDataGrid_CellContentClick);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.cargar);
            this.groupBox1.Controls.Add(this.limpiar);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(723, 100);
            this.groupBox1.TabIndex = 12;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Modificar afiliado";
            // 
            // ModificacionAfiliado
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(747, 487);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.afiliadoDataGrid);
            this.Name = "ModificacionAfiliado";
            this.Text = "ModificacionAfiliado";
            ((System.ComponentModel.ISupportInitialize)(this.afiliadoDataGrid)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button limpiar;
        private System.Windows.Forms.Button cargar;
        private System.Windows.Forms.DataGridView afiliadoDataGrid;
        private System.Windows.Forms.GroupBox groupBox1;
    }
}