using PGMActas_V2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PGMActas_V2.Controllers
{
    public class FormularioController : Controller
    {
        public HtmlString GuardarFormulario(DatosFormulario datosFormulario)
        {
            var response = new { success = true, Message = "Exito al realizar el guardado" };

            System.Web.Script.Serialization.JavaScriptSerializer jSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return new HtmlString(jSerializer.Serialize(response));
        }
    }
}