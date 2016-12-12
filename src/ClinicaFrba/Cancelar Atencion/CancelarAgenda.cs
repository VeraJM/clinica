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
    public partial class CancelarAgenda : Form
    {
        private BindingSource bindingSource1 = new BindingSource();

        public CancelarAgenda()
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

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            if (!Datos_Validos()) { return; }

            TipoCancelacion TipoCancelacion = (TipoCancelacion)cboMotivos.SelectedItem;
            DateTime desdeFecha = dtpDesde.Value.Date;
            DateTime hastaFecha = dtpHasta.Value.Date;

            using (TurnosDAO dao = new TurnosDAO())
            {
                
                try
                {
                    dao.CancelarTurnosProfesional(LogInManager.profesionalId, desdeFecha, hastaFecha, TipoCancelacion.codigo, txtDetalle.Text);
                    MessageBox.Show("Turnos cancelado con éxito!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private bool Datos_Validos()
        {
            if (cboMotivos.SelectedIndex <= 0)
            {
                MessageBox.Show("Debe seleccionar un motivo antes de cancelar!");
                return false;
            }

            // Rango de fechas valido?
            DateTime desde = dtpDesde.Value.Date;
            DateTime hasta = dtpHasta.Value.Date;
            if (DateTime.Compare(desde, hasta) >= 0)
            {
                MessageBox.Show("Rango de fechas inválido!");
                return false;
            }

            return true;
        }
    }
}
