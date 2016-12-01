using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MercadoEnvio.Model;

namespace MercadoEnvio.Model
{
    public class Visi
    {
        public int id;
        public string nombre;
        public float comisionPorPubli;
        public float comisionPorProd;
        public float comisionPorEnvio;

        public Visi() 
        {
            this.id = 0;
            this.nombre = "";
        }
    }
}
