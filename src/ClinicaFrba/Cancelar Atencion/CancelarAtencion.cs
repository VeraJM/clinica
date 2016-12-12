using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ClinicaFrba.DAO;
using ClinicaFrba.Model;
using ClinicaFrba.Utils;

namespace ClinicaFrba.Cancelar_Atencion
{
    public partial class CancelarAtencion : Form
    {
        private BindingSource bindingSource1 = new BindingSource();

        public CancelarAtencion()
        {
            InitializeComponent();
            cboTiposCancelaciones_Cagar();
        }

        private void cboTiposCancelaciones_Cagar()
        {
            using (TurnosDAO dao = new TurnosDAO())
            {
                List<TipoCancelacion> tiposCancelaciones = dao.getTiposCancelacion();
                cboMotivos.Items.Clear();
                cboMotivos.Items.Add("-- Seleccione un motivo --");
                foreach (TipoCancelacion tipoCancelacion in tiposCancelaciones)
                {
                    cboMotivos.Items.Add(tipoCancelacion);
                }
                cboMotivos.SelectedIndex = 0;
            }
        }

        public void ActualizarTabla()
        {
            using (TurnosDAO dao = new TurnosDAO())
            {
                try
                {
                    gridTurnos.Columns.Clear();
                    DataTable table = dao.buscarTurnos(LogInManager.afiliadoId);
                    DataGridViewButtonColumn btn = new DataGridViewButtonColumn();
                    gridTurnos.Columns.Add(btn);
                    btn.HeaderText = "Cancelar";
                    btn.Text = "Cancelar";
                    btn.Name = "btnCancelar";
                    btn.UseColumnTextForButtonValue = true;
                    bindingSource1.DataSource = table;
                    gridTurnos.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.AllCellsExceptHeader);
                }
                catch (Exception e)
                {
                    MessageBox.Show(e.Message);
                }
            }
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            gridTurnos.DataSource = bindingSource1;
            ActualizarTabla();
        }

        private void gridTurnos_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {
            if (cboMotivos.SelectedIndex <= 0)
            {
                MessageBox.Show("Debe seleccionar un motivo antes de cancelar!");
                return;
            }

            using (TurnosDAO dao = new TurnosDAO())
            {
                if (e.ColumnIndex == 0)
                {
                    int indiceColumna = e.ColumnIndex + 1;
                    int indiceFila = e.RowIndex;
                    int turnoId = (int)gridTurnos[indiceColumna, indiceFila].Value;
                    TipoCancelacion TipoCancelacion = (TipoCancelacion)cboMotivos.SelectedItem;
                    try
                    {
                        dao.CancelarTurnoAfiliado(turnoId, LogInManager.afiliadoId, TipoCancelacion.codigo, txtDetalle.Text);
                        ActualizarTabla();
                        MessageBox.Show("Turno cancelado con éxito!");
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }

            }
        }
    }
}
