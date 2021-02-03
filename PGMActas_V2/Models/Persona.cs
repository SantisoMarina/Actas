using PGMActas_V2.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class Persona
    {
        public int id_persona { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string numero_documento { get; set; }
        public string direccion { get; set; }
        public int codigo_postal { get; set; }
        public TipoDocumentoItemVM tipoDocumento { get; set; }
        public LocalidadItemVM localidad { get; set; }
        public int idResponsabilidadLegal { get; set; }
        public bool infractor { get; set; }
        public bool variasResp { get; set; } = false;
        public List<int> resposabilidadesLegales { get; set; }
    }
}