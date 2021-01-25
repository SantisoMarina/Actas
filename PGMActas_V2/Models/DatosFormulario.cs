using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class DatosFormulario
    {
        public string id_automotor_form { get; set; }
        public string automotorID_form { get; set; }
        public string codigoPostalInf_form { get; set; }
        public string colorVehiculo_form { get; set; }
        public string direccionInf_form { get; set; }
        public string fechaInf_form { get; set; }
        public string horaInf_form { get; set; }
        public string inspector_form { get; set; }
        public string localidadInf_form { get; set; }
        public string marcaVehiculo_form { get; set; }
        public string modeloVehiculo_form { get; set; }
        public string numeroActa_form { get; set; }
        public string observacionesInf_form { get; set; }
        public string tipoVehiculo_form { get; set; }
        public string fechaCarga_form { get; set; }
        public string horaCarga_form { get; set; }
        public List<InfraccionForm> infracciones { get; set; }
        public List<List<PersonaForm>> infractores { get; set; }
        public List<List<PersonaForm>> titulares { get; set; }
    }
}