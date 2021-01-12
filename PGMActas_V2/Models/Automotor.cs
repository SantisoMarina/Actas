using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class Automotor
    {
        public int id_automotor { get; set; }
        public string numero_dominio { get; set; }
        public int id_tipo_vehiculo { get; set; }
        public string modelo { get; set; }
        public string color { get; set; }
    }
}