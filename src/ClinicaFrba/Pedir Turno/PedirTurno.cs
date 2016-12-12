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

namespace ClinicaFrba.Pedir_Turno
{
    public partial class PedirTurno : Form
    {
        public PedirTurno()
        {
            InitializeComponent();

            cboEspecialidades_Cargar();
        }

        private void cboEspecialidades_Cargar()
        {
            using (EspecialidadDAO dao = new EspecialidadDAO())
            {
                List<Especialidad> especialidades = dao.getEspecialidades();
                cboEspecialidades.Items.Clear();
                cboEspecialidades.Items.Add("-- Elija una especialidad --");
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
            if (cboEspecialidades.SelectedIndex <= 0) {
                cboProfesionales.Enabled = false;
                return; 
            }

            Especialidad especialidad = (Especialidad)cboEspecialidades.SelectedItem;
            cboProfesionales.Enabled = true;
            cboProfesionales.Items.Add("-- Elija un profesional --");

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
            cboFechasDisponibles.Items.Clear();
            if (cboProfesionales.SelectedIndex <= 0)
            {
                cboFechasDisponibles.Enabled = false;
                return;
            }

            Especialidad especialidad = (Especialidad)cboEspecialidades.SelectedItem;
            Profesional profesional = (Profesional)cboProfesionales.SelectedItem;
            cboFechasDisponibles.Enabled = true;
            cboFechasDisponibles.Items.Add("-- Elija una fecha --");

            using (ProfesionalDAO dao = new ProfesionalDAO())
            {
                List<String> fechas = dao.getFechasDisponibles(profesional.codigo, especialidad.EspecialidadId);
                
                foreach (String fecha in fechas)
                {
                    //Se filtra por fecha de sistema, no se ofrecen las opciones que sean anteriores.
                    DateTime datefecha = DateTime.Parse(fecha);
                    DateTime fechaActual = FechaSistema.getFechaActual();
                    if ( DateTime.Compare(datefecha, fechaActual) >= 0)
                    {
                        cboFechasDisponibles.Items.Add(fecha);
                    }
                }
                cboFechasDisponibles.SelectedIndex = 0;
            }
        }

        private void cboFechasDisponibles_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboHorariosDisponibles.Items.Clear();
            if (cboFechasDisponibles.SelectedIndex <= 0)
            {
                cboHorariosDisponibles.Enabled = false;
                return;
            }

            Especialidad especialidad = (Especialidad)cboEspecialidades.SelectedItem;
            Profesional profesional = (Profesional)cboProfesionales.SelectedItem;
            String fecha = (String)cboFechasDisponibles.SelectedItem;
            cboHorariosDisponibles.Enabled = true;
            cboHorariosDisponibles.Items.Add("-- Elija horario --");

            using (ProfesionalDAO dao = new ProfesionalDAO())
            {
                List<String> horas = dao.getHorasDisponibles(profesional.codigo, especialidad.EspecialidadId, fecha);

                foreach (String hora in horas)
                {
                    cboHorariosDisponibles.Items.Add(hora);
                }
                cboHorariosDisponibles.SelectedIndex = 0;
            }
        }

        private void btnSolicitar_Click(object sender, EventArgs e)
        {

            if (!DatosValidos()) { return; }

            Especialidad especialidad = (Especialidad)cboEspecialidades.SelectedItem;
            Profesional profesional = (Profesional)cboProfesionales.SelectedItem;
            String fecha = (String)cboFechasDisponibles.SelectedItem + " " + (String)cboHorariosDisponibles.SelectedItem;

            using (ProfesionalDAO dao = new ProfesionalDAO())
            {
                try
                {
                    dao.solicitarTurno(LogInManager.afiliadoId, profesional.codigo, especialidad.EspecialidadId, fecha);

                    MessageBox.Show("Turno solicitado correctamente!");
                    
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private bool DatosValidos()
        {

            if (LogInManager.afiliadoId == 0) {
                MessageBox.Show("Solo los afiliados pueden solicitar turnos!");
                return false;
            }

            if (cboEspecialidades.SelectedIndex <= 0)
            {
                MessageBox.Show("Debe elegir una especialidad");
                return false;
            }

            if (cboProfesionales.SelectedIndex <= 0)
            {
                MessageBox.Show("Debe elegir un profesional");
                return false;
            }

            if (cboFechasDisponibles.SelectedIndex <= 0)
            {
                MessageBox.Show("Debe elegir una fecha válida");
                return false;
            }

            if (cboHorariosDisponibles.SelectedIndex <= 0)
            {
                MessageBox.Show("Debe elegir una hora válida");
                return false;
            }

            return true;
        }
    }
}
