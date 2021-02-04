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
                //  listaInfracciones = listaInfracciones.Where(s => s.nomenclatura.Contains(searchString)).ToList();
                listaInfracciones = listaInfracciones.Where(s => s.nomenclatura.IndexOf(searchString, StringComparison.OrdinalIgnoreCase) != -1 ||
                s.descripcion.IndexOf(searchString, StringComparison.OrdinalIgnoreCase) != -1 ||
                s.grupoInfracciones.grupo.IndexOf(searchString, StringComparison.OrdinalIgnoreCase) != -1 ||
                s.calificacion.IndexOf(searchString, StringComparison.OrdinalIgnoreCase) != -1

                ).ToList();
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
                listaInspectores = listaInspectores.Where(s => (s.persona.nombre.ToLower().Contains(searchString.ToLower()) || s.persona.apellido.ToLower().Contains(searchString.ToLower()) ||
                (s.persona.nombre.ToLower()+" " + s.persona.apellido.ToLower()).Contains(searchString.ToLower()) ||
                s.matricula.ToString().Contains(searchString)
                )).ToList();

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

                listaAutomotores = listaAutomotores.Where(s => s.numero_dominio.IndexOf(searchString, StringComparison.OrdinalIgnoreCase) != -1 ||
                s.tipoVehiculo.tipo_vehiculo.IndexOf(searchString, StringComparison.OrdinalIgnoreCase) != -1 ||
                s.marca.marca.IndexOf(searchString, StringComparison.OrdinalIgnoreCase) != -1 ||
                s.modelo.IndexOf(searchString, StringComparison.OrdinalIgnoreCase) != -1

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
                /*  int nroDoc;

                  bool success = Int32.TryParse(searchString, out nroDoc);
                  listaPersonas = listaPersonas.Where(s => s.numero_documento == nroDoc).ToList();
                */
                listaPersonas = listaPersonas.Where(s => s.numero_documento.ToString().Contains(searchString) ||
               s.nombre.ToLower().Contains(searchString.ToLower()) || s.apellido.ToLower().Contains(searchString.ToLower()) ||
                (s.nombre.ToLower() + " " + s.apellido.ToLower()).Contains(searchString.ToLower())
                ).ToList();
            }
            return PartialView("_PersonasResultado", listaPersonas);
        }

        //verificar numero acta repetido
        public HtmlString verificarNumeroActa(int numero_acta)
        {

            var success = ActaDA.obtenerNumeroActa(numero_acta);
            var mensaje = success ? "Acta "+ numero_acta +" ya existente, para consultarla ingrese <a href=''>aquí</a>":"Número de acta válido.";
            var response = new { success = success, Message = mensaje };
            System.Web.Script.Serialization.JavaScriptSerializer jSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return new HtmlString(jSerializer.Serialize(response));
        }

        //verificar numero acta rango inspector
        public HtmlString verificarNumeroActaRangoInspector(int id_inspector, int numero_acta)
        {
            var success = false;
            var rangoComienzo = InspectorDA.obtenerRangoComienzoInspector(id_inspector);
            var rangoFin = InspectorDA.obtenerRangoFinInspector(id_inspector);
            if ((numero_acta >= rangoComienzo) && (numero_acta<=rangoFin))
            {
                success = true;
            }

            var mensaje = success ? "Acta dentro del rango del inspector. ":"Acta "+ numero_acta+ " fuera del rango del inspector.";
            var response = new { success = success, Message = mensaje };
            System.Web.Script.Serialization.JavaScriptSerializer jSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return new HtmlString(jSerializer.Serialize(response));
        }


        //Partial view de las infracciones de una persona particular
        [HttpGet]
        public PartialViewResult InfraccionesPersonaParticular(int id_persona)
        {

            List<InfraccionesPersonaParticular> listaActasPersonaParticular = ActaDA.obtenerListaActasPersonaParticular(id_persona).OrderBy(o => o.responsabilidad_legal).ToList();

           
            if (listaActasPersonaParticular.Count()>0)
            {
                var persona = listaActasPersonaParticular.FirstOrDefault();
                ViewBag.Nombre = "Actas de " + persona.nombre + ' ' + persona.apellido;
            }
            else
            {
                ViewBag.Nombre = "La persona seleccionada no tiene actas.";
            }
           
  
            return PartialView("_InfraccionesPersonaParticular", listaActasPersonaParticular);
        }
    }
}
