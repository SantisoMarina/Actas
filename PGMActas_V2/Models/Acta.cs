using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class Acta
    {
        public int numero_acta { get; set; }
        public Inspector inspector { get; set; }
        public string ip_carga { get; set; }
        public Operador operador { get; set; }
        public string fecha_carga { get; set; }
        public string hora_carga { get; set; }
        public string fecha_acta { get; set; }
        public string hora_acta { get; set; }
        public string observaciones { get; set; }
        public bool retuvo_licencia { get; set; }
        public bool retuvo_vehiculo { get; set; }
        public Automotor automotor { get; set; }
        public List<Persona> listaPersonasInfraccion { get; set; }
        public List<Infraccion> listaInfraccionesActa { get; set; }
        public int id_automotor_persona { get; set; }
        public int id_persona_infraccion_acta { get; set; }

        public Acta(int numero_acta, Inspector inspector, string ip_carga, Operador operador, 
            string fecha_acta, string hora_acta, string observaciones, bool retuvo_licencia, 
            bool retuvo_vehiculo, Automotor automotor, List<Persona> listaPersonasInfraccion, 
            List<Infraccion> listaInfraccionesActa)
        {
            this.numero_acta = numero_acta;
            this.inspector = inspector;
            this.ip_carga = ip_carga;
            this.operador = operador;
            this.fecha_acta = fecha_acta;
            this.hora_acta = hora_acta;
            this.observaciones = observaciones;
            this.retuvo_licencia = retuvo_licencia;
            this.retuvo_vehiculo = retuvo_vehiculo;
            this.automotor = automotor;
            this.listaPersonasInfraccion = listaPersonasInfraccion;
            this.listaInfraccionesActa = listaInfraccionesActa;
            fecha_carga = DateTime.UtcNow.ToString("MM-dd-yyyy"); 
            hora_carga = DateTime.UtcNow.ToString("HH:mm");
        }

        public Acta()
        {
        }
    }
}