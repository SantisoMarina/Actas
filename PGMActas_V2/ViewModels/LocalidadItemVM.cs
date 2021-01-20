using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.ViewModels
{
    public class LocalidadItemVM
    {
        public int id_localidad { get; set; }
        public string localidad { get; set; }
        public ProvinciaItemVM provincia { get; set; }
    }
}