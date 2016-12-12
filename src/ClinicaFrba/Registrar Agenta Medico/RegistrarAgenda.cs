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

namespace ClinicaFrba.Registrar_Agenta_Medico
{
    public partial class RegistrarAgenda : Form
    {
        Profesional profesional;
        bool profesionalNoEncontrado;

        public RegistrarAgenda()
        {
            InitializeComponent();
            cboHorarios_Cargar();
            Profesional_Cargar();
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (profesionalNoEncontrado)
            {
                MessageBox.Show("Por favor, regístrese como el profesional para poder registrar su agenda");
                this.Close();
            }
        }

        private void cboHorarios_Cargar()
        {
            cboHorarios_Cargar(cboDesdeLunes, true);
            cboHorarios_Cargar(cboDesdeMartes, true);
            cboHorarios_Cargar(cboDesdeMiercoles, true);
            cboHorarios_Cargar(cboDesdeJueves, true);
            cboHorarios_Cargar(cboDesdeViernes, true);
            cboHorarios_Cargar(cboDesdeSabado, false);

            cboHorarios_Cargar(cboHastaLunes, true);
            cboHorarios_Cargar(cboHastaMartes, true);
            cboHorarios_Cargar(cboHastaMiercoles, true);
            cboHorarios_Cargar(cboHastaJueves, true);
            cboHorarios_Cargar(cboHastaViernes, true);
            cboHorarios_Cargar(cboHastaSabado, false);
        }

        private void cboHorarios_Cargar(ComboBox cboCombo, bool horarioCompleto)
        {
            cboCombo.Items.Clear();
            Int32 desde = (horarioCompleto ? 7 : 10);
            Int32 hasta = (horarioCompleto ? 20 : 15);

            for (int hora = desde; hora < hasta; hora++)
            {
                cboCombo.Items.Add(new Hora(hora, 0));
                cboCombo.Items.Add(new Hora(hora, 30));
            }
        }

        private void Profesional_Cargar()
        {

            profesional = null;
            txtProfesional.Text = "";
            txtMatricula.Text = "";

            using (ProfesionalDAO dao = new ProfesionalDAO())
            {
                profesional = dao.buscarProfesional(LogInManager.usuarioId);

                // Existe?
                if (profesional == null)
                {
                    this.profesionalNoEncontrado = true;
                    return;
                }

                // Completo datos
                txtProfesional.Text = profesional.detalle.Nombre + ' ' + profesional.detalle.Apellido;
                txtMatricula.Text = profesional.Matricula;
            }

            cboEspecialidades_Cagar();
        }

        private void cboEspecialidades_Cagar()
        {
            using (ProfesionalDAO dao = new ProfesionalDAO())
            {
                List<Especialidad> especialidades = dao.getEspecialidades(profesional.UsuarioId);
                cboEspecialidades_Cagar(especialidades, cboEspecialidadLunes);
                cboEspecialidades_Cagar(especialidades, cboEspecialidadMartes);
                cboEspecialidades_Cagar(especialidades, cboEspecialidadMiercoles);
                cboEspecialidades_Cagar(especialidades, cboEspecialidadJueves);
                cboEspecialidades_Cagar(especialidades, cboEspecialidadViernes);
                cboEspecialidades_Cagar(especialidades, cboEspecialidadSabado);

            }
        }

        private void cboEspecialidades_Cagar(List<Especialidad> especialidades, ComboBox cboCombo)
        {
            cboCombo.Items.Clear();
            foreach (Especialidad especialidad in especialidades)
            {
                cboCombo.Items.Add(especialidad);
            }
        }

        private void chkLunes_CheckedChanged(object sender, EventArgs e)
        {
            HabilitarCombos(cboEspecialidadLunes, cboDesdeLunes, cboHastaLunes, chkLunes.Checked);
        }

        private void chkMartes_CheckedChanged(object sender, EventArgs e)
        {
            HabilitarCombos(cboEspecialidadMartes, cboDesdeMartes, cboHastaMartes, chkMartes.Checked);
        }

        private void chkMiercoles_CheckedChanged(object sender, EventArgs e)
        {
            HabilitarCombos(cboEspecialidadMiercoles, cboDesdeMiercoles, cboHastaMiercoles, chkMiercoles.Checked);
        }

        private void chkJueves_CheckedChanged(object sender, EventArgs e)
        {
            HabilitarCombos(cboEspecialidadJueves, cboDesdeJueves, cboHastaJueves, chkJueves.Checked);
        }

        private void chkViernes_CheckedChanged(object sender, EventArgs e)
        {
            HabilitarCombos(cboEspecialidadViernes, cboDesdeViernes, cboHastaViernes, chkViernes.Checked);
        }

        private void chkSabado_CheckedChanged(object sender, EventArgs e)
        {
            HabilitarCombos(cboEspecialidadSabado, cboDesdeSabado, cboHastaSabado, chkSabado.Checked);
        }


        private void HabilitarCombos(ComboBox cboEspecialidad, ComboBox cboDesde, ComboBox cboHasta, bool habilitar)
        {
            cboEspecialidad.Enabled = habilitar;
            cboDesde.Enabled = habilitar;
            cboHasta.Enabled = habilitar;
        }

        private void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (!Datos_Validos()) { return; }

            string errores = "";

            // Registro los días
            errores += RegistrarDia(chkLunes, cboEspecialidadLunes, cboDesdeLunes, cboHastaLunes, 1);
            errores += RegistrarDia(chkMartes, cboEspecialidadMartes, cboDesdeMartes, cboHastaMartes, 2);
            errores += RegistrarDia(chkMiercoles, cboEspecialidadMiercoles, cboDesdeMiercoles, cboHastaMiercoles, 3);
            errores += RegistrarDia(chkJueves, cboEspecialidadJueves, cboDesdeJueves, cboHastaJueves, 4);
            errores += RegistrarDia(chkViernes, cboEspecialidadViernes, cboDesdeViernes, cboHastaViernes, 5);
            errores += RegistrarDia(chkSabado, cboEspecialidadSabado, cboDesdeSabado, cboHastaSabado, 6);

            if (errores == "")
            {
                MessageBox.Show("Agenda registrada correctamente!");
            }
            else {
                MessageBox.Show("Agenda registrada con errores:" + errores);
            }
        }

        private bool Datos_Validos()
        {
            // Si selecciona algún día, tiene q tener seleccionado una especialidad y un rango valido
            if (!ValidarDia(chkLunes, cboEspecialidadLunes, cboDesdeLunes, cboHastaLunes, "Lunes")) { return false; }
            if (!ValidarDia(chkMartes, cboEspecialidadMartes, cboDesdeMartes, cboHastaMartes, "Martes")) { return false; }
            if (!ValidarDia(chkMiercoles, cboEspecialidadMiercoles, cboDesdeMiercoles, cboHastaMiercoles, "Miercoles")) { return false; }
            if (!ValidarDia(chkJueves, cboEspecialidadJueves, cboDesdeJueves, cboHastaJueves, "Jueves")) { return false; }
            if (!ValidarDia(chkViernes, cboEspecialidadViernes, cboDesdeViernes, cboHastaViernes, "Viernes")) { return false; }
            if (!ValidarDia(chkSabado, cboEspecialidadSabado, cboDesdeSabado, cboHastaSabado, "Sabado")) { return false; }

            // Tiene que estar tildado por lo menos 1 día
            if (!chkLunes.Checked && !chkMartes.Checked && !chkMiercoles.Checked && !chkJueves.Checked &&
                !chkViernes.Checked && !chkSabado.Checked)
            {

                MessageBox.Show("Debe seleccionar al menos un día!");
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

        private bool ValidarDia(CheckBox chkDia, ComboBox cboEspecialidad, ComboBox cboDesde, ComboBox cboHasta, String dia)
        {
            if (!chkDia.Checked) { return true; } // No atiende ese día

            if (cboEspecialidad.SelectedIndex == -1)
            {
                MessageBox.Show("Falta seleccionar la especialidad del día " + dia);
                return false;
            }

            if (cboDesde.SelectedIndex == -1)
            {
                MessageBox.Show("Falta seleccionar la hora de inicio del día " + dia);
                return false;
            }

            if (cboHasta.SelectedIndex == -1)
            {
                MessageBox.Show("Falta seleccionar la hora de fín del día " + dia);
                return false;
            }

            Hora desde = (Hora)cboDesde.SelectedItem;
            Hora hasta = (Hora)cboHasta.SelectedItem;
            if (!hasta.GreaterThan(desde))
            {
                MessageBox.Show("Rango horario inválido para el día " + dia);
                return false;
            }


            return true;

        }

        private string RegistrarDia(CheckBox chkDia, ComboBox cboEspecialidad, ComboBox cboDesde, ComboBox cboHasta, Int32 dia)
        {
            if (!chkDia.Checked) { return ""; } // No atiende ese día

            using (ProfesionalDAO dao = new ProfesionalDAO())
            {
                Especialidad especialidad = (Especialidad)cboEspecialidad.SelectedItem;
                Hora desde = (Hora)cboDesde.SelectedItem;
                Hora hasta = (Hora)cboHasta.SelectedItem;
                DateTime desdeFecha = dtpDesde.Value.Date;
                DateTime hastaFecha = dtpHasta.Value.Date;

                try
                {
                    dao.registrarAgendaDia(profesional.codigo, especialidad.EspecialidadId, dia,
                        desde.hora, desde.minutos, hasta.hora, hasta.minutos,
                        desdeFecha, hastaFecha);
                }
                catch (Exception ex) {
                    return "\nError en día " + dia.ToString() + ": " + ex.Message;
                }
            }

            return "";

        }

        private class Hora
        {

            public Int32 hora { get; set; }
            public Int32 minutos { get; set; }

            public Hora(Int32 hora, Int32 minutos)
            {
                this.hora = hora;
                this.minutos = minutos;
            }

            public override string ToString()
            {
                return String.Format("{0:00}", hora) + ":" + String.Format("{0:00}", minutos);
            }

            public bool GreaterThan(Hora other)
            {
                return (this.hora > other.hora) || (this.hora == other.hora && this.minutos > other.minutos);
            }
        }
    }
}
