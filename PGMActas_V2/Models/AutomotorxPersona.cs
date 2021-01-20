using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class AutomotorxPersona
    {
        public int id_automotor_persona { get; set; }
        public int id_automotor { get; set; }
        public int id_persona { get; set; }
        public int id_responsabilidad_legal { get; set; }
    }
}