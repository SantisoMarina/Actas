using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class Acta
    {
        public int numero_acta { get; set; }
        public int id_inspector { get; set; }
        public string ip_carga { get; set; }
        public int id_juez_falta { get; set; }
        public string fecha_carga { get; set; }
        public string hora_carga { get; set; }
        public string fecha_acta { get; set; }
        public string hora_acta { get; set; }
        public string observaciones { get; set; }
        public int codigo_ordenanza { get; set; }
        public bool retuvo_licencia { get; set; }
        public bool retuvo_vehiculo { get; set; }
        public int id_automotor { get; set; }
        public int id_automotor_persona { get; set; }
        public int id_persona_infraccion { get; set; }

    }
}