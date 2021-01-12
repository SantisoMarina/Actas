﻿using System;
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
        public int id_tipo_documento { get; set; }
        public int numero_documento { get; set; }
        public int id_pais { get; set; }
        public string direccion { get; set; }
        public int codigo_postal { get; set; }
    }
}