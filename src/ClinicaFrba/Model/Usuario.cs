using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.Model
{
    public class Usuario
    {
        public int UsuarioId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public int IntentosFallidos { get; set; }
        public bool Habilitado { get; set; }

        public Usuario()
        {
        }

        public Usuario(string username, string pass)
        {
            this.Username = username;
            this.Password = pass;
        }
    }
}
