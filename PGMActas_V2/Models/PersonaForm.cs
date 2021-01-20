using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class PersonaForm
    {
        public string form_apellido { get; set; }
        public string form_id_persona { get; set; }
        public string form_nombre { get; set; }
        public string form_numero_documento { get; set; }
        public string form_tipo_documento { get; set; }
        public string form_localidad { get; set; }
        public string inputFormDomicilio { get; set; }
        public string inputFormCodigoPostal { get; set; }
        public string inputFormResponsabilidad { get; set; }
    }
}