using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class Infraccion
    {
        public int codigo_infraccion { get; set; }
        public string nomenclatura { get; set; }
        public string descripcion { get; set; }
        public bool estado { get; set; }
        public string calificacion { get; set; }
        public Normativa normativa { get; set; }
        public Articulo articulo { get; set; }
        public GrupoInfraccion grupoInfracciones { get; set; }
        public bool habilitado_retuvo_licencia { get; set; }
        public bool habilitado_retuvo_vehiculo { get; set; }    

    }
}