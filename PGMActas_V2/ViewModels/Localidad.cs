using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.ViewModels
{
    public class Localidad
    {
        public int id_localidad { get; set; }
        public string localidad { get; set; }
        public int id_provincia { get; set; }
    }
}