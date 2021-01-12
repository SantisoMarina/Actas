using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class Inspector
    {
        public int id_inspector { get; set; }
        public bool habilitado { get; set; }
        public Persona persona { get; set; } = new Persona();
        public string matricula { get; set; }
        public int rango_comienzo_acta { get; set; }
        public int rango_fin_acta { get; set; }
    }
}