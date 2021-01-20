using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class PersonaInfraccionxActa
    {
        public int id_persona_infraccion_acta { get; set; }
        public int id_persona { get; set; }
        public int numero_acta { get; set; }
        public int id_responsabilidad_legal { get; set; }
    }
}