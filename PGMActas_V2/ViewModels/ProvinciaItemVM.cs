using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PGMActas_V2.ViewModels
{
    public class ProvinciaItemVM
    {
        public int id_provincia { get; set; }
        public string provincia { get; set; }
        public PaisItemVM pais { get; set; }
    }
}