using PGMActas_V2.DataAccess;
using PGMActas_V2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PGMActas_V2.Controllers
{
    public class PersonaController : Controller
    {
        // GET: Persona
        public ActionResult Index()
        {
            return View();
        }

        public HtmlString ObtenerDetallesPersona(string numeroDocumento)
        {
            List<Persona> listaPersonas = PersonaDA.obtenerListaPersonas();
            var persona = listaPersonas.Where(x => x.numero_documento == numeroDocumento).FirstOrDefault();
            System.Web.Script.Serialization.JavaScriptSerializer jSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return new HtmlString(jSerializer.Serialize(persona));
        }

    }
}