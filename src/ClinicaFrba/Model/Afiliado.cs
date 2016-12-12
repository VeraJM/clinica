using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class Afiliado
    {
        public int codigo { get; set; }
        //numero integrante
        public int numero { get; set; }
        public DateTime FechaBaja { get; set; }
        public bool Habilitado { get; set; }
        public int cantidad_hijos { get; set; }
        public Plan plan { get; set; }
        public DetallePersona detalle { get; set; }
        public Usuario usuario { get; set; }
        public EstadoCivil estadoCivil { get; set; }
        public int familiaresPorAnotar { get; set; }
        public int grupoFamiliar { get; set; }

        public Afiliado()
        {
            Inicializar();
            numero = 1;
            familiaresPorAnotar = 0;
            grupoFamiliar = 0;
        }
        
        public Afiliado(int num, int aAnotar)
        {
            Inicializar();
            this.numero = num;
            familiaresPorAnotar = aAnotar;
        }
        public Afiliado(int num, int aAnotar,int familia)
        {
            Inicializar();
            this.numero = num;
            familiaresPorAnotar = aAnotar;
            grupoFamiliar = familia;
        }
        
        public void Inicializar()
        {
            FechaBaja = new DateTime();
            plan = new Plan();
            detalle = new DetallePersona();
            usuario = new Usuario();
            estadoCivil = new EstadoCivil();
        }

        public override string ToString()
        {
            return detalle.Nombre + " " + detalle.Apellido;
        }
    }
}
