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

namespace ClinicaFrba.Compra_Bono
{
    public partial class ComprarBonos : Form
    {
        private Afiliado afiliadoActual = null;

        public ComprarBonos(int codigoAfiliado)
        {
            InitializeComponent();

            txtPrecio.Enabled = false;
            txtTotal.Enabled = false;

            if (codigoAfiliado != 0) {
                txtAfiliado.ReadOnly = true;
                btnBuscar.Enabled = false;
                CargarDatosAfiliado(codigoAfiliado);
            }

            if (LogInManager.AssignedRole.Nombre != "Administrador")
            {
                txtAfiliado.ReadOnly = true;
                btnBuscar.Enabled = false;
                txtNroAfiliado.Value = LogInManager.afiliadoNro;
                txtNroAfiliado.ReadOnly = true;
                txtNroAfiliado.Enabled = false;
                CargarDatosAfiliado(LogInManager.afiliadoNro);
            }
        }
        
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            int codigoAfiliado = (int)txtNroAfiliado.Value;
            CargarDatosAfiliado(codigoAfiliado);
        }

        private void CargarDatosAfiliado(int codigoAfiliado)
        {
            Afiliado afiliado;

            // Limpio
            afiliadoActual = null;
            txtAfiliado.Text = "";
            txtPlan.Text = "";
            txtPrecio.Value = 0;

            using (PlanDAO dao = new PlanDAO())
            {
                afiliado = dao.buscarPlanAfiliado(codigoAfiliado);
               
                // Existe?
                if (afiliado == null) {
                    MessageBox.Show("Afiliado inexistente!");
                    return;
                }

                if (!afiliado.Habilitado)
                {
                    MessageBox.Show("El afiliado debe estar habilitado!");
                    return;
                }

                // Es valido
                afiliadoActual = afiliado;

                // Completo datos
                txtAfiliado.Text = afiliado.detalle.Nombre + ' ' + afiliado.detalle.Apellido;
                txtPlan.Text = afiliado.plan.Nivel;
                txtPrecio.Value = afiliado.plan.PrecioConsulta;
            }
        }

        private void txtCantidad_ValueChanged(object sender, EventArgs e)
        {
            ActualizarTotal();
        }

        private void ActualizarTotal()
        {
            txtTotal.Value = txtCantidad.Value * txtPrecio.Value;
        }

        private void txtPrecio_ValueChanged(object sender, EventArgs e)
        {
            ActualizarTotal();
        }

        private void btnComprar_Click(object sender, EventArgs e)
        {
            // Selecciono un afiliado?
            if (afiliadoActual == null)
            {
                MessageBox.Show("Falta seleccionar el afiliado!");
                return;
            }

            // Cantidad valida?
            Int32 cantidad = (Int32)txtCantidad.Value;

            using (BonoDAO dao = new BonoDAO())
            {
                try
                {

                    dao.ComprarBono(afiliadoActual.numero, cantidad);
                    
                    MessageBox.Show("Compra realizada exitosamente!");
                    this.Dispose();
                }
                catch (Exception exc)
                {
                    MessageBox.Show(exc.Message);
                }
            }
        }
    }
}
