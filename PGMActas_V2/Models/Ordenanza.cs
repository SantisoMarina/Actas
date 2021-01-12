using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class Ordenanza
    {
        private string estadoN = "";
        public int codigo_ordenanza { get; set; }
        public string nomenclatura { get; set; }
        public string descripcion { get; set; }
        public bool estado { get; set; }
        public string calificacion { get; set; }

    }
}