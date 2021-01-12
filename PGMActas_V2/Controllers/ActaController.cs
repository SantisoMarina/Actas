using PGMActas_V2.DataAccess;
using PGMActas_V2.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PGMActas_V2.Models;

namespace PGMActas_V2.Controllers
{
    public class ActaController : Controller
    {

        [HttpGet]
        public ActionResult CargarActa()
        {
            return View();
        }

        // GET: Acta
        /* public ActionResult CargarActa()
         {


             return View();
         }
        */
        [HttpGet]
        public PartialViewResult PaisesResultado()
        {

            List<Pais> listaPais = PaisAD.obtenerListaPaises();
            return PartialView("_PaisesResultado", listaPais);
        }
        [HttpPost]
        public PartialViewResult PaisesResultado(string orden = "", string ordenamiento = "", string searchString = "") {

            List<Pais> listaPais = PaisAD.obtenerListaPaises();
            if (!String.IsNullOrEmpty(searchString))
            {
                listaPais = listaPais.Where(s => s.pais.Contains(searchString)
                  || s.pais.Contains(searchString)).ToList();
            }

            switch (orden)
            {
                case "id_pais":
                    if (String.IsNullOrEmpty(ordenamiento) || ordenamiento.Equals("idPaisDes"))
                    {
                        ViewBag.ordenamiento = "idPaisAsc";
                        listaPais = listaPais.OrderBy(s => s.id_pais).ToList();
                    }
                    else if (ordenamiento.Equals("idPaisAsc"))
                    {
                        ViewBag.ordenamiento = "idPaisDes";
                        listaPais = listaPais.OrderByDescending(s => s.id_pais).ToList();
                    }
                    break;
                case "pais":
                    if (String.IsNullOrEmpty(ordenamiento) || ordenamiento.Equals("paisDes"))
                    {
                        ViewBag.ordenamiento = "paisAsc";
                        listaPais = listaPais.OrderBy(s => s.pais).ToList();
                    }
                    else if (ordenamiento.Equals("paisAsc"))
                    {
                        ViewBag.ordenamiento = "paisDes";
                        listaPais = listaPais.OrderByDescending(s => s.pais).ToList();
                    }
                    break;

                default:
                    listaPais = listaPais.OrderBy(s => s.id_pais).ToList();
                    break;
            }
            return PartialView("_PaisesResultado", listaPais);
        }
        public PartialViewResult Paises()
        {
           
            return PartialView("_Paises");
        }

        //Vista Parciales de Ordenanzas
        [HttpGet]
        public PartialViewResult Ordenanza()
        {

            return PartialView("_Ordenanza");
        }

        [HttpGet]
        public PartialViewResult OrdenanzasResultado()
        {

            List<Ordenanza> listaOrdenanzas = OrdenanzaAD.obtenerListaOrdenanzas();
            return PartialView("_OrdenanzasResultado", listaOrdenanzas);
        }

        [HttpPost]
        public PartialViewResult OrdenanzasResultado(string orden = "", string ordenamiento = "", string searchString = "")
        {

            List<Ordenanza> listaOrdenanzas = OrdenanzaAD.obtenerListaOrdenanzas();
            if (!String.IsNullOrEmpty(searchString))
            {
                var codigoOrd = Int32.Parse(searchString);
                listaOrdenanzas = listaOrdenanzas.Where(s => s.nomenclatura.Contains(searchString)
                  || s.descripcion.Contains(searchString) || s.codigo_ordenanza == codigoOrd).ToList();
            }

            switch (orden)
            {
                case "codigo_ordenanza":
                    if (String.IsNullOrEmpty(ordenamiento) || ordenamiento.Equals("codigo_ordenanzaDes"))
                    {
                        ViewBag.ordenamiento = "codigo_ordenanzaAsc";
                        listaOrdenanzas = listaOrdenanzas.OrderBy(s => s.codigo_ordenanza).ToList();
                    }
                    else if (ordenamiento.Equals("codigo_ordenanzaAsc"))
                    {
                        ViewBag.ordenamiento = "codigo_ordenanzaDes";
                        listaOrdenanzas = listaOrdenanzas.OrderByDescending(s => s.codigo_ordenanza).ToList();
                    }
                    break;
                case "descripcion":
                    if (String.IsNullOrEmpty(ordenamiento) || ordenamiento.Equals("descripcionDesc"))
                    {
                        ViewBag.ordenamiento = "descripcionAsc";
                        listaOrdenanzas = listaOrdenanzas.OrderBy(s => s.descripcion).ToList();
                    }
                    else if (ordenamiento.Equals("descripcionAsc"))
                    {
                        ViewBag.ordenamiento = "descripcionDesc";
                        listaOrdenanzas = listaOrdenanzas.OrderByDescending(s => s.descripcion).ToList();
                    }
                    break;
                case "nomenclatura":
                    if (String.IsNullOrEmpty(ordenamiento) || ordenamiento.Equals("nomenclaturaDesc"))
                    {
                        ViewBag.ordenamiento = "nomenclaturaAsc";
                        listaOrdenanzas = listaOrdenanzas.OrderBy(s => s.nomenclatura).ToList();
                    }
                    else if (ordenamiento.Equals("nomenclaturaAsc"))
                    {
                        ViewBag.ordenamiento = "nomenclaturaDesc";
                        listaOrdenanzas = listaOrdenanzas.OrderByDescending(s => s.nomenclatura).ToList();
                    }
                    break;
                case "estado":
                    if (String.IsNullOrEmpty(ordenamiento) || ordenamiento.Equals("estadoDesc"))
                    {
                        ViewBag.ordenamiento = "estadoAsc";
                        listaOrdenanzas = listaOrdenanzas.OrderBy(s => s.estado).ToList();
                    }
                    else if (ordenamiento.Equals("estadoAsc"))
                    {
                        ViewBag.ordenamiento = "estadoDesc";
                        listaOrdenanzas = listaOrdenanzas.OrderByDescending(s => s.estado).ToList();
                    }
                    break;
                case "calificacion":
                    if (String.IsNullOrEmpty(ordenamiento) || ordenamiento.Equals("calificacionDesc"))
                    {
                        ViewBag.ordenamiento = "calificacionAsc";
                        listaOrdenanzas = listaOrdenanzas.OrderBy(s => s.calificacion).ToList();
                    }
                    else if (ordenamiento.Equals("calificacionAsc"))
                    {
                        ViewBag.ordenamiento = "calificacionDesc";
                        listaOrdenanzas = listaOrdenanzas.OrderByDescending(s => s.calificacion).ToList();
                    }
                    break;

                default:
                    listaOrdenanzas = listaOrdenanzas.OrderBy(s => s.codigo_ordenanza).ToList();
                    break;
            }
            return PartialView("_OrdenanzasResultado", listaOrdenanzas);
        }

        //Vistas Parciales Inspectores

        [HttpGet]
        public PartialViewResult Inspector()
        {

            return PartialView("_Inspector");
        }

        [HttpGet]
        public PartialViewResult InspectoresResultado()
        {

            List<Inspector> listaInspectores = InspectorDA.obtenerListaInspectores();
            return PartialView("_InspectoresResultado", listaInspectores);
        }

        [HttpPost]
        public PartialViewResult InspectoresResultado(string searchString = "")
        {

            List<Inspector> listaInspectores = InspectorDA.obtenerListaInspectores();
            if (!String.IsNullOrEmpty(searchString))
            {
                var idInspector = Int32.Parse(searchString);
                listaInspectores = listaInspectores.Where(s => s.persona.apellido.Contains(searchString)
                  || s.persona.nombre.Contains(searchString) || s.id_inspector == idInspector).ToList();
            }
            return PartialView("_InspectoresResultado", listaInspectores);
        }
           
        
    }
}
