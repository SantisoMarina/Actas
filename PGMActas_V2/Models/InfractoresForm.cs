using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class InterfacePersonaForm
    {
        public List<PersonaForm> registrados { get; set; }
        public List<PersonaForm> noRegistrados { get; set; }
    }
}