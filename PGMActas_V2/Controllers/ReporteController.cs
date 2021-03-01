using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.draw;
using PGMActas_V2.DataAccess;
using PGMActas_V2.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Image = iTextSharp.text.Image;


namespace PGMActas_V2.Controllers
{
    public class ReporteController : Controller
    {     
        // GET: Reporte
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult PDF(int numero_acta)
        {

            //comienzo pdf
            MemoryStream ms = new MemoryStream();

            Document document = new Document(iTextSharp.text.PageSize.A4, 5F, 5f, 70f, 5f);
            PdfWriter pdfWriter = PdfWriter.GetInstance(document, ms);
            pdfWriter.PageEvent = new HeaderFooter();

            PdfPCell celdaVacia = new PdfPCell(new Phrase(""));
            celdaVacia.Border = 0;

            //abrir doc
            document.Open();


            //declaracion de fuentes
            //--
            Font titulo = new Font(Font.FontFamily.COURIER, 12, Font.BOLD, BaseColor.BLACK);
            Font fontNormal = new Font(Font.FontFamily.HELVETICA, 10, Font.NORMAL, BaseColor.BLACK);
            Font fontBold = new Font(Font.FontFamily.HELVETICA, 10, Font.BOLD, BaseColor.BLACK);
            Font fontChicaNormal = new Font(Font.FontFamily.HELVETICA, 8, Font.NORMAL, BaseColor.BLACK);
            Font fontChicaBold = new Font(Font.FontFamily.HELVETICA, 8, Font.BOLD, BaseColor.BLACK);

            //linea separadora
            LineSeparator underline = new LineSeparator(1f, 100f, BaseColor.BLACK, Element.ALIGN_CENTER, -2);
            DottedLineSeparator cutline = new DottedLineSeparator();



            
            //encabezado      
            //logo muni
            PdfPCell celdaImagen = new PdfPCell();
            Image logo = Image.GetInstance(@"C:\Users\Marina\Documents\Marina\PGM\Actas\logoPDF.png");
            logo.ScaleAbsolute(60, 60);
            celdaImagen = new PdfPCell((logo));
            celdaImagen.Border = 0;
            celdaImagen.Colspan = 1;
            //nombre muni
            PdfPCell celdaNombreMunicipalidad = new PdfPCell();
            String nombreTribunal = "Tribunal Municipalidad en Prueba";
            celdaNombreMunicipalidad = new PdfPCell(new Phrase(nombreTribunal.ToUpper(), titulo));
            celdaNombreMunicipalidad.Border = 0;
            celdaNombreMunicipalidad.Colspan = 3;
            //celdaNombreMunicipalidad.Colspan = 2;
            //emision + fecha
            String fechaEmision = DateTime.Now.ToString("dd/MM/yyyy");
            PdfPCell celdaFechaEmision = new PdfPCell();
            celdaFechaEmision.Colspan = 2;
            var fraseFechaEmision = new Phrase();
            fraseFechaEmision.Add(new Chunk("Emisión: ", fontNormal));
            fraseFechaEmision.Add(new Chunk(fechaEmision, fontBold));
            celdaFechaEmision.AddElement(fraseFechaEmision);
            celdaFechaEmision.Border = 0;
            /*
            //encabezado datos muni + fecha emision
            PdfPTable tablaEncabezado = new PdfPTable(6);
            celdaImagen.HorizontalAlignment = Element.ALIGN_LEFT;
            celdaNombreMunicipalidad.HorizontalAlignment = Element.ALIGN_LEFT;
            celdaFechaEmision.HorizontalAlignment = Element.ALIGN_RIGHT;
            celdaFechaEmision.PaddingLeft = 100f;
            tablaEncabezado.AddCell(celdaImagen);
            tablaEncabezado.AddCell(celdaNombreMunicipalidad);
            tablaEncabezado.AddCell(celdaFechaEmision);
            tablaEncabezado.WidthPercentage = 100;
            document.Add(tablaEncabezado);
            document.Add(underline);
            */

            //Datos del infractor
            var datosInfractor = PersonaDA.obtenerPersonaInfractor(numero_acta); 

            //celda nombre del infractor
            PdfPCell celdaNombreInfractor = new PdfPCell();
            var fraseNombreInfactor = new Phrase();
            fraseNombreInfactor.Add(new Chunk("Destinatario: ", fontNormal));
            fraseNombreInfactor.Add(new Chunk(datosInfractor[0], fontBold));
            celdaNombreInfractor.AddElement(fraseNombreInfactor);
            celdaNombreInfractor.Border = 0;
            //celda domicilio del infractor
            PdfPCell celdaDomicilioInfractor = new PdfPCell();
            var fraseDomicilioInfactor = new Phrase();
            fraseDomicilioInfactor.Add(new Chunk("Domicilio: ", fontNormal));
            fraseDomicilioInfactor.Add(new Chunk(datosInfractor[1], fontBold));
            celdaDomicilioInfractor.AddElement(fraseDomicilioInfactor);
            celdaDomicilioInfractor.Border = 0;
            //apartado datos del infractor
            PdfPTable tablaDatosInfractor = new PdfPTable(1);
            celdaNombreInfractor.HorizontalAlignment = Element.ALIGN_LEFT;
            celdaDomicilioInfractor.HorizontalAlignment = Element.ALIGN_LEFT;
            
            tablaDatosInfractor.WidthPercentage = 95;
            tablaDatosInfractor.AddCell(celdaNombreInfractor);
            tablaDatosInfractor.AddCell(celdaDomicilioInfractor);
            tablaDatosInfractor.WidthPercentage = 100;
            document.Add(underline);
            document.Add(tablaDatosInfractor);
            document.Add(underline);

            //Datos del automotor
            var datosAutomotor = AutomotorDA.obtenerAutomotor(numero_acta); 


            //celda nombre del infractor
            PdfPCell celdaDatosAutomotor = new PdfPCell();
            var fraseDatosAutomotor = new Phrase();
            fraseDatosAutomotor.Add(new Chunk("Identificación. ", fontNormal));
            fraseDatosAutomotor.Add(new Chunk("Dominio: " + datosAutomotor[0] + " | Marca: " + datosAutomotor[1] +
                " | Modelo: " + datosAutomotor[2] + " | Tipo: " + datosAutomotor[3] + " | Color: " + datosAutomotor[4]
                , fontBold));
            celdaDatosAutomotor.AddElement(fraseDatosAutomotor);
            celdaDatosAutomotor.Border = 0;
            //apartado datos del automotor
            PdfPTable tablaDatosAutomotor = new PdfPTable(1);
            celdaDatosAutomotor.HorizontalAlignment = Element.ALIGN_LEFT;
            tablaDatosAutomotor.WidthPercentage = 95;
            tablaDatosAutomotor.AddCell(celdaDatosAutomotor);
            tablaDatosAutomotor.WidthPercentage = 100;
            document.Add(tablaDatosAutomotor);
            document.Add(underline);

            //Datos del acta
            var datosActa = ActaDA.obtenerActa(numero_acta);

            string dateString = datosActa[1];
            DateTime parsedDateTime;
            string formattedDate = "";
            if (DateTime.TryParseExact(dateString, "yyyy-MM-dd",
                                CultureInfo.InvariantCulture,
                                DateTimeStyles.None,
                                out parsedDateTime))
            {
                formattedDate = parsedDateTime.ToString("dd/MM/yyyy");
            }
            else
            {
                Console.WriteLine("Parsing failed");
            }

            //celda nombre del infractor
            PdfPCell celdaDatosActa = new PdfPCell();
            var fraseDatosActa = new Phrase();
            fraseDatosActa.Add(new Chunk("N° Acta: ", fontNormal));
            fraseDatosActa.Add(new Chunk(datosActa[0], fontBold));
            fraseDatosActa.Add(new Chunk("       Fecha: ", fontNormal));
            fraseDatosActa.Add(new Chunk(formattedDate, fontBold));
            fraseDatosActa.Add(new Chunk("       Lugar: ", fontNormal));
            fraseDatosActa.Add(new Chunk(datosActa[2], fontBold));
            celdaDatosActa.AddElement(fraseDatosActa);
            var fraseDatosActa2 = new Phrase();
            fraseDatosActa2.Add(new Chunk("Inspector: ", fontNormal));
            fraseDatosActa2.Add(new Chunk(datosActa[3], fontBold));
            fraseDatosActa2.Add(new Chunk("       Jurisdicción: ", fontNormal));
            fraseDatosActa2.Add(new Chunk("Municipalidad en Prueba", fontBold));
            celdaDatosActa.AddElement(fraseDatosActa2);
            celdaDatosActa.Border = 0;
            //apartado datos del automotor
            PdfPTable tablaDatosActa = new PdfPTable(1);
            celdaDatosActa.HorizontalAlignment = Element.ALIGN_LEFT;
            tablaDatosActa.WidthPercentage = 95;
            tablaDatosActa.AddCell(celdaDatosActa);
            tablaDatosActa.WidthPercentage = 100;
            document.Add(tablaDatosActa);
            document.Add(underline);


            //apartado infracciones cabecera
            var datosOrdenanza = InfraccionDA.obtenerOrdenanza(numero_acta);

            PdfPTable tablaDatosInfraccionCabecera = new PdfPTable(4);
            tablaDatosInfraccionCabecera.SpacingBefore = 10;

            PdfPCell cab1 = new PdfPCell(new Phrase("INFRACCIÓN A LA DISPOSICIÓN LEGAL ORDENANZA NRO: "+datosOrdenanza[0] +" - "+ datosOrdenanza[1], fontBold));
            cab1.Colspan = 3;
            cab1.HasBorder(4);
            cab1.BorderColor = new BaseColor(0, 0, 0);
            cab1.BorderWidth = 1;
            //cab1.HorizontalAlignment = Element.ALIGN_CENTER;
            tablaDatosInfraccionCabecera.AddCell(cab1);

            PdfPCell cab2 = new PdfPCell(new Phrase("IMPORTE", fontBold));
            cab2.HasBorder(4);
            cab2.BorderColor = new BaseColor(0, 0, 0);
            cab2.BorderWidth = 1;
            cab2.HorizontalAlignment = Element.ALIGN_CENTER;
            tablaDatosInfraccionCabecera.AddCell(cab2);

            tablaDatosInfraccionCabecera.WidthPercentage = 100;
            document.Add(tablaDatosInfraccionCabecera);

            //apartado infracciones datos
            PdfPTable tablaDatosInfraccion = new PdfPTable(4);
            //tablaDatosInfraccion.SpacingAfter = 50;
            List<Infraccion> listaInfraccionPorActa = InfraccionDA.obtenerListaInfraccionesPorActa(numero_acta);
            //monto total
            double montoTotal = 0;
            //
            foreach (var item in listaInfraccionPorActa)
            {
                //
                montoTotal = montoTotal + double.Parse(item.monto_unitario.ToString());
                //
                PdfPCell celda = new PdfPCell(new Paragraph(item.nomenclatura.ToString() + " - " + item.descripcion, fontChicaNormal));
                celda.Colspan = 3;
                celda.BorderColorBottom = new CMYKColor(0, 0, 0, 0);
                celda.BorderColorTop = new CMYKColor(0, 0, 0, 0);
                celda.BorderWidthTop = 0;
                celda.BorderWidthRight = 1;
                celda.BorderWidthLeft = 1;
                celda.BorderWidthBottom = 0;
                celda.HasBorder(4);
                celda.BorderWidth = 1;
                tablaDatosInfraccion.AddCell(celda);

                PdfPCell celda2 = new PdfPCell(new Paragraph(item.monto_unitario.ToString(), fontChicaNormal));
                celda2.HasBorder(4);
                celda2.BorderColorBottom = new CMYKColor(0, 0, 0, 0);
                celda2.BorderColorTop = new CMYKColor(0, 0, 0, 0);
                celda2.BorderWidthTop = 0;
                celda2.BorderWidthRight = 1;
                celda2.BorderWidthLeft = 1;
                celda2.BorderWidthBottom = 0;
                celda2.BorderWidth = 1;
                celda2.HorizontalAlignment = Element.ALIGN_CENTER;
                tablaDatosInfraccion.AddCell(celda2);

            }
            PdfPCell celdaVacia5 = new PdfPCell(new Paragraph("\n \n \n"));
            celdaVacia5.Colspan = 3;
            celdaVacia5.HasBorder(4);
            celdaVacia5.BorderColorTop = new CMYKColor(0, 0, 0, 0);
            celdaVacia5.BorderWidthTop = 0;
            celdaVacia5.BorderWidthRight = 1;
            celdaVacia5.BorderWidthLeft = 1;
            celdaVacia5.BorderWidthBottom = 1;
            tablaDatosInfraccion.AddCell(celdaVacia5);

            PdfPCell celdaVacia6 = new PdfPCell(new Paragraph("\n \n \n"));
            celdaVacia6.HasBorder(4);
            celdaVacia6.BorderColorTop = new CMYKColor(0, 0, 0, 0);
            celdaVacia6.BorderWidthTop = 0;
            celdaVacia6.BorderWidthRight = 1;
            celdaVacia6.BorderWidthLeft = 1;
            celdaVacia6.BorderWidthBottom = 1;
            tablaDatosInfraccion.AddCell(celdaVacia6);

            tablaDatosInfraccion.WidthPercentage = 100;
            document.Add(tablaDatosInfraccion);

            //apartado concepto + total
            PdfPTable tablaConceptoTotal = new PdfPTable(4);

            PdfPCell concepto = new PdfPCell(new Phrase("Concepto", fontBold));
            concepto.Colspan = 3;
            concepto.HasBorder(4);
            concepto.BorderColor = new BaseColor(0, 0, 0);
            concepto.BorderWidth = 1;
            tablaConceptoTotal.AddCell(concepto);

            PdfPCell total = new PdfPCell(new Phrase("TOTAL", fontBold));
            total.HasBorder(4);
            total.BorderColor = new BaseColor(0, 0, 0);
            total.BorderWidth = 1;
            total.HorizontalAlignment = Element.ALIGN_CENTER;
            tablaConceptoTotal.AddCell(total);

            PdfPCell conceptoDato = new PdfPCell(new Paragraph("MULTA", fontNormal));
            conceptoDato.Colspan = 3;
            conceptoDato.HasBorder(4);
            conceptoDato.BorderColorBottom = new CMYKColor(0, 0, 0, 0);
            conceptoDato.BorderColorTop = new CMYKColor(0, 0, 0, 0);
            conceptoDato.BorderWidthTop = 0;
            conceptoDato.BorderWidthRight = 1;
            conceptoDato.BorderWidthLeft = 1;
            conceptoDato.BorderWidthBottom = 0;
            tablaConceptoTotal.AddCell(conceptoDato);

            PdfPCell totalDato = new PdfPCell(new Phrase(montoTotal.ToString(), fontNormal));
            totalDato.HasBorder(4);
            totalDato.BorderColorBottom = new CMYKColor(0, 0, 0, 0);
            totalDato.BorderColorTop = new CMYKColor(0, 0, 0, 0);
            totalDato.BorderWidthTop = 0;
            totalDato.BorderWidthRight = 1;
            totalDato.BorderWidthLeft = 1;
            totalDato.BorderWidthBottom = 0;
            totalDato.HorizontalAlignment = Element.ALIGN_CENTER;
            tablaConceptoTotal.AddCell(totalDato);

            tablaConceptoTotal.AddCell(celdaVacia5);
            tablaConceptoTotal.AddCell(celdaVacia5);

            tablaConceptoTotal.WidthPercentage = 100;
            document.Add(tablaConceptoTotal);

            //apartado total a pagar
            PdfPTable tablaTotalPagar = new PdfPTable(4);
            PdfPCell totalPagar = new PdfPCell(new Phrase("TOTAL A PAGAR", fontBold));
            totalPagar.Colspan = 3;
            totalPagar.HasBorder(4);
            totalPagar.BorderColor = new BaseColor(0, 0, 0);
            totalPagar.BorderWidth = 1;
            tablaTotalPagar.AddCell(totalPagar);

            tablaTotalPagar.AddCell(totalDato);

            tablaTotalPagar.WidthPercentage = 100;
            document.Add(tablaTotalPagar);

            //apartado fecha
            PdfPTable tablaFecha = new PdfPTable(4);
            tablaFecha.SpacingAfter = 10;
            PdfPCell fecha = new PdfPCell(new Phrase("FECHA", fontBold));
            fecha.Colspan = 3;
            fecha.HasBorder(4);
            fecha.BorderColor = new BaseColor(0, 0, 0);
            fecha.BorderWidth = 1;
            tablaFecha.AddCell(fecha);

            PdfPCell fechaDato = new PdfPCell(new Phrase(fechaEmision, fontNormal));

            fechaDato.HasBorder(4);
            fechaDato.BorderColor = new BaseColor(0, 0, 0);
            fechaDato.BorderWidth = 1;
            fechaDato.HorizontalAlignment = Element.ALIGN_CENTER;
            tablaFecha.AddCell(fechaDato);

            tablaFecha.WidthPercentage = 100;
            document.Add(tablaFecha);
            document.Add(cutline);

            //apartado codigo de barra
            PdfPTable tablaCodigoBarra = new PdfPTable(5);
            tablaCodigoBarra.SpacingBefore = 15;
            tablaCodigoBarra.SpacingAfter = 10;

            PdfPCell celdaNombreTribunal = new PdfPCell(new Phrase(nombreTribunal.ToUpper(), fontChicaBold));
            celdaNombreTribunal.Colspan = 5;
            celdaNombreTribunal.BorderColorBottom = new CMYKColor(0, 0, 0, 0);
            celdaNombreTribunal.BorderWidthTop = 1;
            celdaNombreTribunal.BorderWidthBottom = 0;
            celdaNombreTribunal.BorderWidthRight = 1;
            celdaNombreTribunal.BorderWidthLeft = 1;
            celdaNombreTribunal.HorizontalAlignment = Element.ALIGN_LEFT;
            tablaCodigoBarra.AddCell(celdaNombreTribunal);

            logo.ScaleAbsolute(30, 30);
            PdfPCell celdaImagenChica = new PdfPCell();
            celdaImagenChica = new PdfPCell((logo));
            celdaImagenChica.BorderColorTop = new CMYKColor(0, 0, 0, 0);
            celdaImagenChica.BorderColorBottom = new CMYKColor(0, 0, 0, 0);
            celdaImagenChica.BorderColorRight = new CMYKColor(0, 0, 0, 0);
            celdaImagenChica.BorderWidthTop = 0;
            celdaImagenChica.BorderWidthBottom = 0;
            celdaImagenChica.BorderWidthRight = 0;
            celdaImagenChica.BorderWidthLeft = 1;
            celdaImagenChica.HorizontalAlignment = Element.ALIGN_LEFT;
            celdaImagenChica.PaddingLeft = 5f;
            tablaCodigoBarra.AddCell(celdaImagenChica);

            PdfPCell celdaNroActa = new PdfPCell();
            celdaNroActa.Colspan = 3;
            var fraseNroActa = new Phrase();
            fraseNroActa.Add(new Chunk("N° Acta: ", fontChicaNormal));
            fraseNroActa.Add(new Chunk(datosActa[0], fontChicaBold));
            celdaNroActa.AddElement(fraseNroActa);
            celdaNroActa.Border = Rectangle.NO_BORDER;
            celdaNroActa.HorizontalAlignment = Element.ALIGN_RIGHT;
            tablaCodigoBarra.AddCell(celdaNroActa);

            PdfPCell celdaEmision = new PdfPCell();
            var fraseEmision = new Phrase();
            fraseEmision.Add(new Chunk("Emisión: ", fontChicaNormal));
            fraseEmision.Add(new Chunk(fechaEmision, fontChicaBold));
            celdaEmision.AddElement(fraseEmision);
            celdaEmision.BorderColorTop = new CMYKColor(0, 0, 0, 0);
            celdaEmision.BorderColorBottom = new CMYKColor(0, 0, 0, 0);
            celdaEmision.BorderColorLeft = new CMYKColor(0, 0, 0, 0);
            celdaEmision.BorderWidthTop = 0;
            celdaEmision.BorderWidthBottom = 0;
            celdaEmision.BorderWidthRight = 1;
            celdaEmision.BorderWidthLeft = 0;
            celdaEmision.HorizontalAlignment = Element.ALIGN_RIGHT;
            tablaCodigoBarra.AddCell(celdaEmision);

            PdfPCell celdaVacia1 = new PdfPCell();
            celdaVacia1.BorderColorTop = new CMYKColor(0, 0, 0, 0);
            celdaVacia1.BorderColorBottom = new CMYKColor(0, 0, 0, 0);
            celdaVacia1.BorderColorRight = new CMYKColor(0, 0, 0, 0);
            celdaVacia1.BorderWidthTop = 0;
            celdaVacia1.BorderWidthBottom = 0;
            celdaVacia1.BorderWidthRight = 0;
            celdaVacia1.BorderWidthLeft = 1;
            tablaCodigoBarra.AddCell(celdaVacia1);

            PdfPCell vencimiento = new PdfPCell(new Phrase("VENCIMIENTO", fontNormal));
            vencimiento.HasBorder(4);
            vencimiento.BorderColor = new BaseColor(0, 0, 0);
            vencimiento.BorderWidth = 1;
            vencimiento.HorizontalAlignment = Element.ALIGN_CENTER;
            tablaCodigoBarra.AddCell(vencimiento);

            PdfPCell totalDato2 = new PdfPCell(new Phrase(montoTotal.ToString(), fontNormal));
            totalDato2.HasBorder(4);
            totalDato2.BorderColor = new BaseColor(0, 0, 0);
            totalDato2.BorderWidth = 1;
            totalDato2.HorizontalAlignment = Element.ALIGN_CENTER;
            tablaCodigoBarra.AddCell(totalDato2);

            tablaCodigoBarra.AddCell(fechaDato);

            PdfPCell celdaVacia2 = new PdfPCell();
            celdaVacia2.BorderColorTop = new CMYKColor(0, 0, 0, 0);
            celdaVacia2.BorderColorBottom = new CMYKColor(0, 0, 0, 0);
            celdaVacia2.BorderColorLeft = new CMYKColor(0, 0, 0, 0);
            celdaVacia2.BorderWidthTop = 0;
            celdaVacia2.BorderWidthBottom = 0;
            celdaVacia2.BorderWidthRight = 1;
            celdaVacia2.BorderWidthLeft = 0;
            tablaCodigoBarra.AddCell(celdaVacia2);


            //tablaCodigoBarra.AddCell(celdaVacia1);
            string strCodigo = datosActa[0].ToString() + " "+ fechaEmision + " " + montoTotal.ToString();

            iTextSharp.text.pdf.PdfContentByte cb = new iTextSharp.text.pdf.PdfContentByte(pdfWriter);
            Barcode128 codigoBarra = new Barcode128();
            codigoBarra.CodeType = Barcode.CODE128;
            codigoBarra.ChecksumText = true;
            codigoBarra.GenerateChecksum = true;
            codigoBarra.Code = strCodigo;
            codigoBarra.AltText = datosActa[0].ToString();
            Image img = codigoBarra.CreateImageWithBarcode(cb, null, null);
            img.ScalePercent(120, 120);
            PdfPCell celdaCodigoBarra = new PdfPCell();


            celdaCodigoBarra.AddElement(img);
            celdaCodigoBarra.Border = 0;
            celdaCodigoBarra.HorizontalAlignment = Element.ALIGN_CENTER;
            celdaCodigoBarra.PaddingTop = 15f;
            celdaCodigoBarra.PaddingLeft = 115f;
            celdaCodigoBarra.BorderColorTop = new CMYKColor(0, 0, 0, 0);
            celdaCodigoBarra.BorderColorBottom = new CMYKColor(0, 0, 0, 0);
            celdaCodigoBarra.BorderColorRight = new CMYKColor(0, 0, 0, 0);
            celdaCodigoBarra.BorderWidthTop = 0;
            celdaCodigoBarra.BorderWidthBottom = 0;
            celdaCodigoBarra.BorderWidthRight = 0;
            celdaCodigoBarra.BorderWidthLeft = 1;
            celdaCodigoBarra.Colspan = 2;


            tablaCodigoBarra.AddCell(celdaCodigoBarra);










            tablaCodigoBarra.AddCell(celdaVacia);
            tablaCodigoBarra.AddCell(celdaVacia);

            tablaCodigoBarra.AddCell(celdaVacia2);


            PdfPCell celdaVacia3 = new PdfPCell();
            celdaVacia3.Colspan = 4;
            celdaVacia3.BorderColorTop = new CMYKColor(0, 0, 0, 0);
            celdaVacia3.BorderColorRight = new CMYKColor(0, 0, 0, 0);
            celdaVacia3.BorderWidthTop = 0;
            celdaVacia3.BorderWidthBottom = 1;
            celdaVacia3.BorderWidthRight = 0;
            celdaVacia3.BorderWidthLeft = 1;
            tablaCodigoBarra.AddCell(celdaVacia3);

            PdfPCell talonMunicipalidad = new PdfPCell(new Phrase("Talón para la Municipalidad", fontChicaNormal));
            talonMunicipalidad.HasBorder(4);
            talonMunicipalidad.BorderColorTop = new CMYKColor(0, 0, 0, 0);
            talonMunicipalidad.BorderColorLeft = new CMYKColor(0, 0, 0, 0);
            talonMunicipalidad.BorderWidthTop = 0;
            talonMunicipalidad.BorderWidthBottom = 1;
            talonMunicipalidad.BorderWidthRight = 1;
            talonMunicipalidad.BorderWidthLeft = 0;
            talonMunicipalidad.HorizontalAlignment = Element.ALIGN_LEFT;
            tablaCodigoBarra.AddCell(talonMunicipalidad);


            tablaCodigoBarra.WidthPercentage = 100;
            tablaCodigoBarra.KeepRowsTogether(0);
            document.Add(tablaCodigoBarra);
            document.Add(cutline);

            //tabla codigo de barra + codigo qr
            PdfPTable tablaCodigoBarraQR = new PdfPTable(5);
            tablaCodigoBarraQR.SpacingBefore = 15;
            tablaCodigoBarraQR.SpacingAfter = 10;

            tablaCodigoBarraQR.AddCell(celdaNombreTribunal);
            tablaCodigoBarraQR.AddCell(celdaImagenChica);
            tablaCodigoBarraQR.AddCell(celdaNroActa);
            tablaCodigoBarraQR.AddCell(celdaEmision);
            tablaCodigoBarraQR.AddCell(celdaVacia1);
            tablaCodigoBarraQR.AddCell(vencimiento);
            tablaCodigoBarraQR.AddCell(totalDato2);
            tablaCodigoBarraQR.AddCell(fechaDato);
            tablaCodigoBarraQR.AddCell(celdaVacia2);
            //tablaCodigoBarraQR.AddCell(celdaVacia1);
            //aca va el codigo de barra
            celdaCodigoBarra.PaddingTop = 15f;
            celdaCodigoBarra.PaddingBottom = 5f;
            tablaCodigoBarraQR.AddCell(celdaCodigoBarra);
            //
            //aca va el codigo qr
            tablaCodigoBarraQR.AddCell(celdaVacia);
            PdfPCell celdacodigoQR = new PdfPCell();
            iTextSharp.text.Image pic = null;
            string datosQR = "Nro de Acta: " + datosActa[0].ToString() + "\nFecha de Vencimiento: " + fechaEmision + "\nMonto: $" + montoTotal.ToString() + 
                "\nNro de Dominio: " + datosAutomotor[0]+ 
                "\nInfractor: " + datosInfractor[0]+ ", " + datosInfractor[2] + " " + datosInfractor[3];
            BarcodeQRCode qr = new BarcodeQRCode(datosQR, 175, 175, null);
            pic = qr.GetImage();
            pic.ScaleAbsolute(80, 80);
            celdacodigoQR = new PdfPCell((pic));
            celdacodigoQR.Border = 0;
            celdacodigoQR.HorizontalAlignment = Element.ALIGN_CENTER;
            celdacodigoQR.PaddingTop = 8f;
            celdacodigoQR.PaddingBottom = 5f;
            tablaCodigoBarraQR.AddCell(celdacodigoQR);

            //
       
            tablaCodigoBarraQR.AddCell(celdaVacia2);
        


            PdfPCell celdaVacia4 = new PdfPCell();
            celdaVacia4.Colspan = 5;
            celdaVacia4.BorderColorTop = new CMYKColor(0, 0, 0, 0);
            celdaVacia4.BorderWidthTop = 0;
            celdaVacia4.BorderWidthBottom = 1;
            celdaVacia4.BorderWidthRight = 1;
            celdaVacia4.BorderWidthLeft = 1;
            tablaCodigoBarraQR.AddCell(celdaVacia4);

            tablaCodigoBarraQR.WidthPercentage = 100;
            tablaCodigoBarraQR.KeepRowsTogether(0);
            document.Add(tablaCodigoBarraQR);
            document.Add(cutline);

            //cierre pdf
            document.Close();
            byte[] bytesStrem = ms.ToArray();
            ms = new MemoryStream();
            ms.Write(bytesStrem, 0, bytesStrem.Length);
            ms.Position = 0;
            return new FileStreamResult(ms, "aplication/pdf");



        }

        class HeaderFooter : PdfPageEventHelper
        {
            public override void OnEndPage(PdfWriter pdfWriter, Document document)
            {

                Font titulo = new Font(Font.FontFamily.COURIER, 12, Font.BOLD, BaseColor.BLACK);
                Font fontNormal = new Font(Font.FontFamily.HELVETICA, 10, Font.NORMAL, BaseColor.BLACK);
                Font fontBold = new Font(Font.FontFamily.HELVETICA, 10, Font.BOLD, BaseColor.BLACK);
                Font fontChicaNormal = new Font(Font.FontFamily.HELVETICA, 8, Font.NORMAL, BaseColor.BLACK);
                Font fontChicaBold = new Font(Font.FontFamily.HELVETICA, 8, Font.BOLD, BaseColor.BLACK);

                //linea separadora
                LineSeparator underline = new LineSeparator(1f, 100f, BaseColor.BLACK, Element.ALIGN_CENTER, -2);

                PdfPCell celdaImagen = new PdfPCell();
                Image logo = Image.GetInstance(@"C:\Users\Marina\Documents\Marina\PGM\Actas\logoPDF.png");
                logo.ScaleAbsolute(60, 60);
                celdaImagen = new PdfPCell((logo));
                celdaImagen.Border = 0;
                celdaImagen.Colspan = 1;
                //nombre muni
                PdfPCell celdaNombreMunicipalidad = new PdfPCell();
                String nombreTribunal = "Tribunal Municipalidad en Prueba";
                celdaNombreMunicipalidad = new PdfPCell(new Phrase(nombreTribunal.ToUpper(), titulo));
                celdaNombreMunicipalidad.Border = 0;
                celdaNombreMunicipalidad.Colspan = 3;
                //celdaNombreMunicipalidad.Colspan = 2;
                //emision + fecha
                String fechaEmision = DateTime.Now.ToString("dd/MM/yyyy");
                PdfPCell celdaFechaEmision = new PdfPCell();
                celdaFechaEmision.Colspan = 2;
                var fraseFechaEmision = new Phrase();
                fraseFechaEmision.Add(new Chunk("Emisión: ", fontNormal));
                fraseFechaEmision.Add(new Chunk(fechaEmision, fontBold));
                celdaFechaEmision.AddElement(fraseFechaEmision);
                celdaFechaEmision.Border = 0;
                    celdaFechaEmision.PaddingBottom = 200;
                //encabezado datos muni + fecha emision
                PdfPTable tablaEncabezado = new PdfPTable(6);
                celdaImagen.HorizontalAlignment = Element.ALIGN_LEFT;
                celdaNombreMunicipalidad.HorizontalAlignment = Element.ALIGN_LEFT;
                celdaFechaEmision.HorizontalAlignment = Element.ALIGN_RIGHT;
                
                tablaEncabezado.AddCell(celdaImagen);
                tablaEncabezado.AddCell(celdaNombreMunicipalidad);
                tablaEncabezado.AddCell(celdaFechaEmision);
                tablaEncabezado.TotalWidth = 700;
                tablaEncabezado.WidthPercentage = 100;



                tablaEncabezado.SpacingAfter = 100;


                tablaEncabezado.WriteSelectedRows(0, -1, 0, (document.PageSize.Height-5), pdfWriter.DirectContent);

            }
        }


    }

  
}
