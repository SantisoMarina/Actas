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
            //combo Marcas
            List<MarcaItemVM> listaMarcas = AutomotorDA.obtenerListaMarcas();
            ViewBag.items = listaMarcas;
            //combo Tipos Vehiculos
            List<TipoVehiculoItemVM> listaTiposVehiculos = AutomotorDA.obtenerListaTiposVehiculos();
            ViewBag.items2 = listaTiposVehiculos;
            //combo Tipos Documentos
            List<TipoDocumentoItemVM> listaTiposDocumentos = PersonaDA.obtenerTiposDocumentos();
            ViewBag.items3 = listaTiposDocumentos;
            //combo Paises
            List<PaisItemVM> listaPaises = PersonaDA.obtenerPaises();
            ViewBag.items4 = listaPaises;
            //combo Provincias
            List<ProvinciaItemVM> listaProvincias = PersonaDA.obtenerProvincias();
            ViewBag.items5 = listaProvincias;
            //combo Localidades
            List<LocalidadItemVM> listaLocalidades = PersonaDA.obtenerLocalidades();
            ViewBag.items6 = listaLocalidades;
            //combo Responsabilidad Legal
            List<ResponsabilidadLegalItemVM> listaResponsabilidadesLegales = PersonaDA.obtenerResponsabilidadesLegales();
            listaResponsabilidadesLegales.RemoveAt(0);//borro titular del combobox
            ViewBag.items7 = listaResponsabilidadesLegales;
            //
            return View();
        }

        //Vista Parciales de Infracciones
        [HttpGet]
        public PartialViewResult Infraccion()
        {

            return PartialView("_Infraccion");
        }

        [HttpGet]
        public PartialViewResult InfraccionesResultado()
        {

            List<Infraccion> listaInfracciones = InfraccionDA.obtenerListaInfracciones();
            return PartialView("_InfraccionesResultado", listaInfracciones);
        }

        [HttpPost]
        public PartialViewResult InfraccionesResultado(string searchString = "")
        {

            List<Infraccion> listaInfracciones = InfraccionDA.obtenerListaInfracciones();
            if (!String.IsNullOrEmpty(searchString))
            {
                var codigoInf = Int32.Parse(searchString);
                listaInfracciones = listaInfracciones.Where(s => s.nomenclatura.Contains(searchString)
                  || s.descripcion.Contains(searchString) || s.codigo_infraccion == codigoInf).ToList();
            }



            return PartialView("_InfraccionesResultado", listaInfracciones);
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
                listaInspectores = listaInspectores.Where(s => s.persona.nombre.Contains(searchString)).ToList();
            }
            return PartialView("_InspectoresResultado", listaInspectores);
        }

        //Vistas Parciales Automotores

        [HttpGet]
        public PartialViewResult Automotor()
        {

            return PartialView("_Automotor");
        }

        [HttpGet]
        public PartialViewResult AutomotoresResultado()
        {

            List<Automotor> listaAutomotores = AutomotorDA.obtenerListaAutomotores();
            return PartialView("_AutomotoresResultado", listaAutomotores);
        }

        [HttpPost]
        public PartialViewResult AutomotoresResultado(string searchString = "")
        {

            List<Automotor> listaAutomotores = AutomotorDA.obtenerListaAutomotores();
            if (!String.IsNullOrEmpty(searchString))
            {

                listaAutomotores = listaAutomotores.Where(s => s.numero_dominio.Contains(searchString)
                  ).ToList();
            }
            return PartialView("_AutomotoresResultado", listaAutomotores);
        }



        //Vistas Parciales Personas

        [HttpGet]
        public PartialViewResult Persona()
        {

            return PartialView("_Persona");
        }

        [HttpGet]
        public PartialViewResult PersonasResultado()
        {

            List<Persona> listaPersonas = PersonaDA.obtenerListaPersonas();
            return PartialView("_PersonasResultado", listaPersonas);
        }

        [HttpPost]
        public PartialViewResult PersonasResultado(string searchString = "")
        {

            List<Persona> listaPersonas = PersonaDA.obtenerListaPersonas();
            if (!String.IsNullOrEmpty(searchString))
            {
                int nroDoc;

                bool success = Int32.TryParse(searchString, out nroDoc);
                listaPersonas = listaPersonas.Where(s => s.numero_documento == nroDoc).ToList();
            }
            return PartialView("_PersonasResultado", listaPersonas);
        }
    }
}
