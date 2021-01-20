using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class Operador
    {
        public int id_operador { get; set; }
        public bool habilitado { get; set; }
        public Persona persona { get; set; } = new Persona();
        public string matricula { get; set; }
    }
}