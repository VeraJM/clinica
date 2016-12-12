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

namespace ClinicaFrba.Registro_Llegada
{
    public partial class RegistroLlegada : Form
    {
        public RegistroLlegada()
        {
            InitializeComponent();

            cboEspecialidades_Cagar();
        }

        private void cboEspecialidades_Cagar()
        {
            using (EspecialidadDAO dao = new EspecialidadDAO())
            {
                List<Especialidad> especialidades = dao.getEspecialidades();
                cboEspecialidades.Items.Clear();
                cboEspecialidades.Items.Add("-- Seleccione una especialidad --");
                foreach (Especialidad especialidad in especialidades)
                {
                    cboEspecialidades.Items.Add(especialidad);
                }
                cboEspecialidades.SelectedIndex = 0;
            }
        }

        private void cboEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboProfesionales.Items.Clear();
            if (cboEspecialidades.SelectedIndex <= 0)
            {
                cboProfesionales.Enabled = false;
                return;
            }

            Especialidad especialidad = (Especialidad)cboEspecialidades.SelectedItem;
            cboProfesionales.Enabled = true;
            cboProfesionales.Items.Add("-- Seleccione un profesional --");

            using (ProfesionalDAO dao = new ProfesionalDAO())
            {
                List<Profesional> profesionales = dao.getProfesionales(especialidad.EspecialidadId);

                foreach (Profesional profesional in profesionales)
                {
                    cboProfesionales.Items.Add(profesional);
                }
                cboProfesionales.SelectedIndex = 0;
            }
        }

        private void cboProfesionales_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboFechas.Items.Clear();
            if (cboProfesionales.SelectedIndex <= 0)
            {
                cboFechas.Enabled = false;
                return;
            }

            Especialidad especialidad = (Especialidad)cboEspecialidades.SelectedItem;
            Profesional profesional = (Profesional)cboProfesionales.SelectedItem;
            cboFechas.Enabled = true;
            cboFechas.Items.Add("-- Seleccione una fecha --");

            using (ProfesionalDAO dao = new ProfesionalDAO())
            {
                List<String> fechas = dao.getFechasConTurno(profesional.codigo, especialidad.EspecialidadId);

                foreach (String fecha in fechas)
                {
                    cboFechas.Items.Add(fecha);
                }
                cboFechas.SelectedIndex = 0;
            }
        }

        private void cboFechas_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboHorariosDisponibles.Items.Clear();
            if (cboFechas.SelectedIndex <= 0)
            {
                cboHorariosDisponibles.Enabled = false;
                return;
            }

            Especialidad especialidad = (Especialidad)cboEspecialidades.SelectedItem;
            Profesional profesional = (Profesional)cboProfesionales.SelectedItem;
            String fecha = (String)cboFechas.SelectedItem;
            cboHorariosDisponibles.Enabled = true;
            cboHorariosDisponibles.Items.Add("-- Seleccione horario --");

            using (ProfesionalDAO dao = new ProfesionalDAO())
            {
                List<Turno> horas = dao.getHorasConTurno(profesional.codigo, especialidad.EspecialidadId, fecha);

                foreach (Turno hora in horas)
                {
                    cboHorariosDisponibles.Items.Add(hora);
                }
                cboHorariosDisponibles.SelectedIndex = 0;
            }
        }

        private void cboHorariosDisponibles_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboAfiliado.Items.Clear();
            if (cboHorariosDisponibles.SelectedIndex <= 0)
            {
                cboAfiliado.Enabled = false;
                return;
            }

            Turno turno = (Turno)cboHorariosDisponibles.SelectedItem;

            cboAfiliado.Enabled = true;
            cboAfiliado.Items.Add("-- Seleccione afiliado --");

            using (AfiliadoDAO dao = new AfiliadoDAO())
            {
                List<Afiliado> afiliados = dao.getAfiliadosRelacionados(turno.afiliado.codigo);

                foreach (Afiliado afiliado in afiliados)
                {
                    cboAfiliado.Items.Add(afiliado);
                }
                cboAfiliado.SelectedIndex = 0;
            }
        }

        private void cboAfiliado_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboBonos.Items.Clear();
            if (cboAfiliado.SelectedIndex <= 0)
            {
                cboBonos.Enabled = false;
                return;
            }

            Afiliado afiliado = (Afiliado)cboAfiliado.SelectedItem;

            cboBonos.Enabled = true;
            cboBonos.Items.Add("-- Seleccione bono consulta --");

            using (BonoDAO dao = new BonoDAO())
            {
                List<Bono> bonos = dao.getBonosAfiliado(afiliado.codigo);

                foreach (Bono bono in bonos)
                {
                    cboBonos.Items.Add(bono);
                }
                cboBonos.SelectedIndex = 0;
            }
        }

        private void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (!DatosValidos()) { return; }

            using (TurnosDAO dao = new TurnosDAO()) {
                try
                {
                    Turno turno = (Turno)cboHorariosDisponibles.SelectedItem;
                    Afiliado afiliado = (Afiliado)cboAfiliado.SelectedItem;
                    Bono bono = (Bono)cboBonos.SelectedItem;

                    dao.registrarLlegada(turno.codigo, afiliado.codigo, bono.BonoCod);

                    MessageBox.Show("Registro de llegada realizado exitosamente!");
                    this.Dispose();
                }
                catch (Exception exc)
                {
                    MessageBox.Show(exc.Message);
                }
            }
        }

        private bool DatosValidos()
        {
            
            if (cboEspecialidades.SelectedIndex <= 0)
            {
                MessageBox.Show("Falta seleccionar una especialidad!");
                return false;
            }

            if (cboProfesionales.SelectedIndex <= 0)
            {
                MessageBox.Show("Falta seleccionar un profesional!");
                return false;
            }

            if (cboFechas.SelectedIndex <= 0)
            {
                MessageBox.Show("Falta seleccionar una fecha válida!");
                return false;
            }

            if (cboHorariosDisponibles.SelectedIndex <= 0)
            {
                MessageBox.Show("Falta seleccionar una hora válida!");
                return false;
            }


            if (cboAfiliado.SelectedIndex <= 0)
            {
                MessageBox.Show("Falta seleccionar el afiliado!");
                return false;
            }


            if (cboBonos.SelectedIndex <= 0)
            {
                MessageBox.Show("Falta seleccionar el bono!");
                return false;
            }
            return true;
        }
    }
}
