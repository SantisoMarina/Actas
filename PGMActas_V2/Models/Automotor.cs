using PGMActas_V2.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.Models
{
    public class Automotor
    {
        public int id_automotor { get; set; }
        public string numero_dominio { get; set; }
        public int id_marca_tipo_vehiculo { get; set; }
        public string modelo { get; set; }
        public string color { get; set; }
        public MarcaItemVM marca { get; set; }
        public TipoVehiculoItemVM tipoVehiculo { get; set; }
        public List<Persona> listadoTitulares { get; set; }

        public Automotor(int id_automotor, string numero_dominio, int id_marca_tipo_vehiculo, string modelo, string color)
        {
            this.id_automotor = id_automotor;
            this.numero_dominio = numero_dominio;
            this.id_marca_tipo_vehiculo = id_marca_tipo_vehiculo;
            this.modelo = modelo;
            this.color = color;
        }

        public Automotor()
        {
        }
    }

}