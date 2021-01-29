using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.ViewModels
{
    public class InfraccionesPersonaParticular
    {
        public int numero_acta { get; set; }
        public string fecha_acta { get; set; }
        public string direccion { get; set; }
        public string observaciones { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public int codigo_infraccion { get; set; }
        public string responsabilidad_legal { get; set; }
    }
}