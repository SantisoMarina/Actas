using Newtonsoft.Json;
using PGMActas_V2.DataAccess;
using PGMActas_V2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PGMActas_V2.Controllers
{
    public class AutomotorController : Controller
    {
        // GET: Automotor
        public ActionResult Index()
        {
            return View();
        }

        public HtmlString ObtenerDetallesAutomotor(int idAutomotor)
        {
            List<Automotor> listaAutomotores = AutomotorDA.obtenerListaAutomotores();
            var automotor = listaAutomotores.Where(x => x.id_automotor == idAutomotor).FirstOrDefault();
            System.Web.Script.Serialization.JavaScriptSerializer jSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return new HtmlString(jSerializer.Serialize(automotor));
        }

        //verificar numero de dominio repetido
        public HtmlString verificarNumeroDominio(string numeroDominio)
        {

            var success = AutomotorDA.obtenerNumeroDominio(numeroDominio);
            var mensaje = success ? "Número de dominio ya existente." : "Número de dominio válido.";
            var response = new { success = success, Message = mensaje };
            System.Web.Script.Serialization.JavaScriptSerializer jSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return new HtmlString(jSerializer.Serialize(response));


        }

    }
}