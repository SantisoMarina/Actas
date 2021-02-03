
//Función día actual
$(function () {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = yyyy + '-' + mm + '-' + dd;
    document.getElementById("fechaInf").setAttribute("max", today);
    $('#btnFechaInf').click(function () {
        $("#fechaInf").attr("value", today);
        $("#fechaInf").val(today);
        $("#horaInf").prop("disabled", false);
        $("#fechaInf_form").remove();
        var valorFechaInf = $("#fechaInf").val();
        var inputForm = "<input id='fechaInf_form' name='fechaInf_form' value='" + valorFechaInf + "'>";
        $('#formCargarActa').append(inputForm);
        
        $("#fechaVacia").remove();
    });
    return false;
});

//Función verificación de hora mayor a la actual
$("#horaInf").blur(function () {
    $("#horaVacia").remove();
    if ($(this).val().length === 0) {
        $("#horaInf").after('<label class="control-label" id="horaVacia" style="color:red> Campo obligatorio, debe llenarlo.</p>');
    }
    $("#errorHora").remove();
    var dia = $("#fechaInf").val();
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = yyyy + '-' + mm + '-' + dd;
    //hora actual
    var hora = this.value;
    var currentdate = new Date();
    var datetime = currentdate.getHours() + ":" + currentdate.getMinutes();

    if (dia == today) {
        if (Date.parse('01/01/2011 ' + hora + ':00') > Date.parse('01/01/2011 ' + datetime + ':00')) {
            $("#horaInf").after('<p class="control-label" id="errorHora" style="color:red">Hora mayor a la hora actual</p>');
            $('#horaInf').val('');
        }

    }
});

//deshabilitar hora hasta que no se ingresa fecha
$("#fechaInf").blur(function () {
    $("#horaInf").prop("disabled", false);

});

//Función navbar responsive
$(".a").click(function () {
    if ($("#btnCollapse").css('display') != 'none')
        $("#btnCollapse").click();
});




//Función máscara CUIT titular
$("#tipoDoc").on('change', function () {
    if (this.value > 0) {
        if (this.value == "3") {
            $("#personaID").prop("disabled", false);
            $("#personaID").mask("99-99999999-9", { placeholder: "XX-XXXXXXXX-X" });
        }
        else {
            $("#personaID").unmask();
        }
    }
});
//Función máscara CUIT infractor
$("#tipoDocInf").on('change', function () {
    if (this.value > 0) {
        if (this.value == "3") {
            $("#personaInfID").prop("disabled", false);
            $("#personaInfID").mask("99-99999999-9", { placeholder: "XX-XXXXXXXX-X" });
        }
        else {
            $("#personaInfID").unmask();
        }
    }
});

//funcion deshabilitar doc titular
$("#tipoDoc").on('change', function () {
    if (this.value > 0) {
        $("#personaID").prop("disabled", false);
    }
});
//funcion deshabilitar doc infractor
$("#tipoDocInf").on('change', function () {
    if (this.value > 0) {
        $("#personaInfID").prop("disabled", false);
    }
});


//Funcion agregar infraccion

$('#btnAgregarInfraccion').click(function () {
    var infraccion = $('#infraccionID').val();
    var codigo_infraccion = $('#codigoinfraccionID').val();
    var retuvo_licencia = $('#retuvoLicenciaID').val();
    var retuvo_vehiculo = $('#retuvoVehiculoID').val();
    if (infraccion != ' ' && codigo_infraccion != ' ') {
        var codigoRepetido = false;
        var parentDiv = [];
        $("#listadoInfracciones > div").each((index, elem) => {
            var infraccionCodigo = elem.id.split("_");
            parentDiv.push(infraccionCodigo[1]);
        });
        parentDiv.forEach(element => {
            if (element == codigo_infraccion) {
                codigoRepetido = true;
            }
        });
        if (!codigoRepetido) {
            var badge = "<div style='display:inline-block; border-radius: 20px;' class='badge badge-danger' id='badgeEliminarInfraccion_" + codigo_infraccion + "'>  <i class='material-icons pills'>delete_forever</i>" + infraccion + "</div>"
            var inputForm = "<input name='form_codigo_infraccion' type='text' class='form-control' id='form_codigo_infraccion' value='" + codigo_infraccion + "'>";
            var inputRetuvoLicencia = "<input name='form_retuvo_licencia' type='text' class='form-control' id='form_retuvo_licencia' value='" + retuvo_licencia + "'>";
            var inputRetuvoVehiculo = "<input name='form_retuvo_vehiculo' type='text' class='form-control' id='form_retuvo_vehiculo' value='" + retuvo_vehiculo + "'>";
            var divMedidaAccesoria = "<div id='infraccion_" + codigo_infraccion + "'>" + inputRetuvoLicencia + inputRetuvoVehiculo + inputForm + "</div>"

            $('#listadoInfracciones').append(badge);
            $('#formCargarActa_infracciones').append(divMedidaAccesoria);

            $('#infraccionID').val('');
            $('#codigoinfraccionID').val('');
            verificarMostrarRetuvoLV();
        }
    }
});
$("#listadoInfracciones").on("click", "div", function (event) {
    event.preventDefault();
    console.log("Eliminar infraccion");
    var idInfraccion = this.id;
    idInfraccion = idInfraccion.split('_');
    var infraccionForm = '#infraccion_' + idInfraccion[1];
    $(infraccionForm).remove();
    var infraccionBadgeId = "#" + this.id;
    $(infraccionBadgeId).remove();
    verificarMostrarRetuvoLV();
});

//funciones retuvieron Licencias autos
$('input:radio[name="retuvoLicencia"]').change(
    function () {
        if (this.checked) {
            console.log("Retuvo licencia: " + this.value);
            $('#retuvoLicencia_form').remove();
            var retuvoLicencia_form = "<input type='text' class='form-control' id='retuvoLicencia_form' value='" + this.value + "'>";
            $('#formCargarActa').append(retuvoLicencia_form);
        }
    });
$('input:radio[name="retuvoVehiculo"]').change(
    function () {
        if (this.checked) {
            console.log("Retuvo vehiculo: " + this.value);
            $('#retuvoVehiculo_form').remove();
            var retuvoVehiculo_form = "<input type='text' class='form-control' id='retuvoVehiculo_form' value='" + this.value + "'>";
            $('#formCargarActa').append(retuvoVehiculo_form);
        }
    });
function agregarTitularvacio() {
    var resultado = true;
    if (!$(personaID).val()) {
        resultado = false;
    }
    if (!$(nombrePersona).val()) {
        resultado = false;
    }
    if (!$(apellidoPersona).val()) {
        resultado = false;
    }
    var td = $('#tipoDoc').val();
    if (td < 1) {
        resultado = false;
    }
    return resultado;
}
//Funciones titulares
$('#agregarTitular').click(function () {
    if (agregarTitularvacio()) {


        console.log("Inicio agregar titular:")
        var tipoDocumento = $('#tipoDoc').val();
        var numeroDocumento = $('#personaID').val();
        var nombreTitular = $('#nombrePersona').val();
        var apellidoTitular = $('#apellidoPersona').val();
        var docAnterior = $('#personaDocumentoAnt').val();
        var idAnterior = $('#personaIDAnt').val();
        var personaID = $('#personaIDPosible').val();
        console.log("ID Anterior " + idAnterior);
        console.log("ID Actual " + personaID);

        if (docAnterior != numeroDocumento && docAnterior != 0 && idAnterior == personaID) {
            $('#personaIDPosible').val("0");
            personaID = $('#personaIDPosible').val();
        }

        $('#personaDocumentoAnt').val(numeroDocumento);
        $('#personaIDAnt').val(personaID);
        console.log("docAnterior " + docAnterior);
        console.log("docActual " + numeroDocumento);
        console.log("personaID " + personaID);



        var inputFormIdPersona = "<input name='form_id_persona' type='text' class='form-control' id='form_id_persona' value='" + personaID + "'>";
        var inputFormTipoDocumento = "<input name='form_tipo_documento' type='text' class='form-control' id='form_tipo_documento' value='" + tipoDocumento + "'>";
        var inputFormNumeroDocumento = "<input name='form_numero_documento' type='text' class='form-control' id='form_numero_documento' value='" + numeroDocumento + "'>";
        var inputFormNombre = "<input name='form_nombre' type='text' class='form-control' id='form_nombre' value='" + nombreTitular + "'>";
        var inputFormApellido = "<input name='form_apellido' type='text' class='form-control' id='form_apellido' value='" + apellidoTitular + "'>";
        var datosPersonaTitular = "<div id='datosPersonasTitular_" + personaID + "'>" + inputFormIdPersona + inputFormTipoDocumento + inputFormNumeroDocumento + inputFormNombre + inputFormApellido + "</div>";
        console.log("Verificando id persona");
        console.log(personaID);
        if (personaID == 0) {
            var lastChildren = $('#personasNoRegistradas').children().last();
            var index = 1;
            console.log(lastChildren);
            if (lastChildren.attr('id') != null) {
                console.log(lastChildren.attr('id'));
                var indiceHijo = lastChildren.attr('id').split('_');
                index = parseInt(indiceHijo[1], 10) + 1;

            }
            var codigoRepetido = false;
            var parentDiv = [];
            $("#titularesNoDeclarados > div").each((index, elem) => {
                console.log("Guardar hijos:");
                console.log(elem);
                var valor = elem.attributes[2].value;
                parentDiv.push(valor);
            });
            parentDiv.forEach(element => {
                if (element == numeroDocumento) {
                    codigoRepetido = true;
                }
            });
            if (!codigoRepetido) {
                datosPersonaTitular = "<div id='datosPersonasTitularNR_" + index + "' name='" + numeroDocumento + "'>" + inputFormIdPersona + inputFormTipoDocumento + inputFormNumeroDocumento + inputFormNombre + inputFormApellido + "</div>";
                $('#personasNoRegistradas').append(datosPersonaTitular);
                var badgePersona = "<div class='badge badge-light badgePersonaMenu mb-1' id='badgeEliminarPersonaNR_" + index + "' name='" + numeroDocumento + "'>" + nombreTitular + " " + apellidoTitular + "</div>";
                $('#titularesNoDeclarados').append(badgePersona);
            }

        }

        else {
            var codigoRepetido = false;
            var parentDiv = [];
            console.log("codigo persona no nulo")
            $("#titularesDeclarados > div").each((index, elem) => {
                console.log("elemento titulares declarados:")
                console.log(elem);
                var idBadgePersona = elem.id.split("_");
                parentDiv.push(idBadgePersona[1]);
            });
            parentDiv.forEach(element => {
                console.log("verificando...");
                console.log(element);
                console.log(personaID);
                if (element == personaID) {
                    codigoRepetido = true;
                }
            });
            console.log("Codigo repetido?")
            console.log(codigoRepetido);
            if (!codigoRepetido) {
                var badgePersona = "<div class='badge badge-light badgePersonaMenu mb-1' id='badgeEliminarPersona_" + personaID + "'>" + nombreTitular + " " + apellidoTitular + " <span class='material-icons pillPersona'>contact_support</span> </div>";
                $('#titularesDeclarados').append(badgePersona);
                $('#personasRegistradas').append(datosPersonaTitular);
            }

        }

        $("#listadoTitulares").css('display', 'block');

        $('#personaID').val('');
        $('#nombrePersona').val('');
        $('#apellidoPersona').val('');
        $('#tipoDoc').prop('selectedIndex', 0);
    }
    else {
        alert("Campos vacíos, ¡Revisar!");
    }
});


//función nro acta copia form invisible y campo vacio
$("#numeroActaID").blur(function () {
    $("#numeroActa_form").remove();
    var valorNumeroActa = $("#numeroActaID").val();
    var inputForm = "<input id='numeroActa_form' name='numeroActa_form' value='" + valorNumeroActa + "'>";
    $('#formCargarActa').append(inputForm);
});

//función fecha form invisible
$("#fechaInf").blur(function () {
    $("#fechaInf_form").remove();
    var valorFechaInf = $("#fechaInf").val();
    var inputForm = "<input id='fechaInf_form' name='fechaInf_form' value='" + valorFechaInf + "'>";
    $('#formCargarActa').append(inputForm);
});

//función hora form invisible
$("#horaInf").blur(function () {
    var dia = $("#fechaInf").val();
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = yyyy + '-' + mm + '-' + dd;
    //hora actual
    var hora = this.value;
    var currentdate = new Date();
    var datetime = currentdate.getHours() + ":" + currentdate.getMinutes();
    if (dia == today) {
        if (hora < datetime) {
            $("#horaInf_form").remove();
            var valorHoraInf = $("#horaInf").val();
            var inputForm = "<input id='horaInf_form' name='horaInf_form' value='" + valorHoraInf + "'>";
            $('#formCargarActa').append(inputForm);
        }
    }
    else {
        $("#horaInf_form").remove();
        var valorHoraInf = $("#horaInf").val();
        var inputForm = "<input id='horaInf_form' name='horaInf_form' value='" + valorHoraInf + "'>";
        $('#formCargarActa').append(inputForm);
    }

});

//función localidad form invisible
$("#localidadInfoID").blur(function () {
    $("#localidadInf_form").remove();
    var localidadInf = $("#localidadInfID").val();
    var inputForm = "<input id='localidadInf_form' name='localidadInf_form' value='" + localidadInf + "'>";
    $('#formCargarActa').append(inputForm);
});

//función direccion form invisible
$("#direccionInfID").blur(function () {
    $("#direccionInf_form").remove();
    var direccionInf = $("#direccionInfID").val();
    var inputForm = "<input id='direccionInf_form' name='direccionInf_form' value='" + direccionInf + "'>";
    $('#formCargarActa').append(inputForm);
});

//función codigo postal form invisible
$("#codigoPostalInfID").blur(function () {
    $("#codigoPostalInf_form").remove();
    var codigoPostalInf = $("#codigoPostalInfID").val();
    var inputForm = "<input id='codigoPostalInf_form' name='codigoPostalInf_form' value='" + codigoPostalInf + "'>";
    $('#formCargarActa').append(inputForm);
});

//función observaciones form invisible
$("#observacionesInfID").blur(function () {
    $("#observacionesInf_form").remove();
    var observacionesInf = $("#observacionesInfID").val();
    var inputForm = "<input id='observacionesInf_form' name='observacionesInf_form' value='" + observacionesInf + "'>";
    $('#formCargarActa').append(inputForm);
});

//función numero de dominio form invisible
$("#automotorID").blur(function () {
    $("#automotorID_form").remove();
    var automotor = $("#automotorID").val();
    var inputForm = "<input id='automotorID_form' name='automotorID_form' value='" + automotor + "'>";
    $('#formCargarActa').append(inputForm);
});

//función tipo de vehiculo form invisible
$("#tipoVehiculoID").blur(function () {
    $("#tipoVehiculo_form").remove();
    var tipoVehiculo = $("#tipoVehiculoID").val();
    var inputForm = "<input id='tipoVehiculo_form' name='tipoVehiculo_form' value='" + tipoVehiculo + "'>";
    $('#formCargarActa').append(inputForm);
});

//función marca form invisible
$("#marcaVehiculoID").blur(function () {
    $("#marcaVehiculo_form").remove();
    var marcaVehiculo = $("#marcaVehiculoID").val();
    var inputForm = "<input id='marcaVehiculo_form' name='marcaVehiculo_form' value='" + marcaVehiculo + "'>";
    $('#formCargarActa').append(inputForm);
});

//función modelo form invisible
$("#modeloVehiculoID").blur(function () {
    $("#modeloVehiculo_form").remove();
    var modeloVehiculo = $("#modeloVehiculoID").val();
    var inputForm = "<input id='modeloVehiculo_form' name='modeloVehiculo_form' value='" + modeloVehiculo + "'>";
    $('#formCargarActa').append(inputForm);
});

//función color form invisible
$("#colorVehiculoID").blur(function () {
    $("#colorVehiculo_form").remove();
    var colorVehiculo = $("#colorVehiculoID").val();
    var inputForm = "<input id='colorVehiculo_form' name='colorVehiculo_form' value='" + colorVehiculo + "'>";
    $('#formCargarActa').append(inputForm);
});

//función color form invisible
$("#colorVehiculoID").blur(function () {
    $("#colorVehiculo_form").remove();
    var colorVehiculo = $("#colorVehiculoID").val();
    var inputForm = "<input id='colorVehiculo_form' name='colorVehiculo_form' value='" + colorVehiculo + "'>";
    $('#formCargarActa').append(inputForm);
});



//Funciones titulares
$('#agregarInfractor').click(function () {
    if (agregarInfractorvacio()) {

        console.log("Inicio agregar Infractor:")
        var tipoDocumento = $('#tipoDocInf').val();
        var numeroDocumento = $('#personaInfID').val();
        var nombreInfractor = $('#nombreInfID').val();
        var apellidoInfractor = $('#apellidoInfID').val();
        var localidadInfractor = $('#localidadInfID').val();
        var domicilioInfractor = $('#domicilioInfID').val();
        var codigoPostalInfractor = $('#codigoPostalID').val();
        var responsabilidadInfractor = $('#comboResponsabilidadLegal').val();

        var docAnterior = $('#personaDocumentoAntInf').val();
        var idAnterior = $('#personaIDAntInf').val();
        var personaID = $('#personaIDPosibleInf').val();
        console.log("ID Anterior " + idAnterior);
        console.log("ID Actual " + personaID);

        if (docAnterior != numeroDocumento && docAnterior != 0 && idAnterior == personaID) {
            $('#personaIDPosibleInf').val("0");
            personaID = $('#personaIDPosibleInf').val();
        }

        $('#personaDocumentoAntInf').val(numeroDocumento);
        $('#personaIDAntInf').val(personaID);
        console.log("docAnterior " + docAnterior);
        console.log("docActual " + numeroDocumento);
        console.log("personaID " + personaID);


        var inputFormIdPersona = "<input name='form_id_persona' type='text' class='form-control' id='form_id_persona' value='" + personaID + "'>";
        var inputFormTipoDocumento = "<input name='form_tipo_documento' type='text' class='form-control' id='form_tipo_documento' value='" + tipoDocumento + "'>";
        var inputFormNumeroDocumento = "<input name='form_numero_documento' type='text' class='form-control' id='form_numero_documento' value='" + numeroDocumento + "'>";
        var inputFormNombre = "<input name='form_nombre' type='text' class='form-control' id='form_nombre' value='" + nombreInfractor + "'>";
        var inputFormApellido = "<input name='form_apellido' type='text' class='form-control' id='form_apellido' value='" + apellidoInfractor + "'>";
        var inputFormLocalidad = "<input name='form_localidad' type='text' class='form-control' id='form_localidad' value='" + localidadInfractor + "'>";
        var inputFormDomicilio = "<input name='form_domicilio' type='text' class='form-control' id='form_domicilio' value='" + domicilioInfractor + "'>";
        var inputFormCodigoPostal = "<input name='form_codigo_postal' type='text' class='form-control' id='form_codigo_postal' value='" + codigoPostalInfractor + "'>";
        var inputFormResponsabilidad = "<input name='form_responsabilidad' type='text' class='form-control' id='form_responsabilidad' value='" + responsabilidadInfractor + "'>";
        var datosPersonaTitular = "<div id='datosPersonasInfractor_" + personaID + "'>" + inputFormIdPersona + inputFormTipoDocumento + inputFormNumeroDocumento + inputFormNombre + inputFormApellido + inputFormLocalidad + inputFormDomicilio + inputFormCodigoPostal + inputFormResponsabilidad + "</div>";
        console.log("Verificando id persona");
        console.log(personaID);
        if (personaID == 0) {
            console.log("Persona Nueva");
            var lastChildren = $('#personasInfNoRegistradas').children().last();
            var index = 1;
            console.log(lastChildren);
            if (lastChildren.attr('id') != null) {
                console.log(lastChildren.attr('id'));
                var indiceHijo = lastChildren.attr('id').split('_');
                index = parseInt(indiceHijo[1], 10) + 1;

            }
            var codigoRepetido = false;
            var parentDiv = [];
            $("#infractoresNoDeclarados > div").each((index, elem) => {
                console.log("Guardar hijos:");
                console.log(elem);
                var valor = elem.attributes[2].value;
                parentDiv.push(valor);
            });
            parentDiv.forEach(element => {
                if (element == numeroDocumento) {
                    codigoRepetido = true;
                }
            });
            console.log("Persona repetida?")
            console.log(codigoRepetido);
            if (!codigoRepetido) {
                datosPersonaTitular = "<div id='datosPersonasInfractorNR_" + index + "' name='" + numeroDocumento + "'>" + inputFormIdPersona + inputFormTipoDocumento + inputFormNumeroDocumento + inputFormNombre + inputFormApellido + inputFormLocalidad + inputFormDomicilio + inputFormCodigoPostal + inputFormResponsabilidad + "</div>";
                $('#personasInfNoRegistradas').append(datosPersonaTitular);
                var badgePersona = "<div class='badge badge-light badgePersonaMenu mb-1' id='inf_badgeEliminarPersonaNR_" + index + "' name='" + numeroDocumento + "'>" + nombreInfractor + " " + apellidoInfractor + "</div>"; //ACA CAMBIE EL BADGE, ERA BADGE-INFO
                $('#infractoresNoDeclarados').append(badgePersona);
            }

        }

        else {
            var codigoRepetido = false;
            var parentDiv = [];
            console.log("codigo persona no nulo")
            $("#infractoresDeclarados > div").each((index, elem) => {
                console.log("elemento titulares declarados:")
                console.log(elem);
                var idBadgePersona = elem.id.split("_");
                parentDiv.push(idBadgePersona[1]);
            });
            parentDiv.forEach(element => {

                if (element == personaID) {
                    codigoRepetido = true;
                }
            });
            console.log("Codigo repetido?")
            console.log(codigoRepetido);
            if (!codigoRepetido) {
                var badgePersona = "<div class='badge badge-light badgePersonaMenu mb-1' id='badgeEliminarPersona_" + personaID + "'>" + nombreInfractor + " " + apellidoInfractor + " <span class='material-icons pillPersona'>contact_support</span> </div>";
                $('#infractoresDeclarados').append(badgePersona);
                $('#personasInfRegistradas').append(datosPersonaTitular);
            }
        }

        $("#listadoInfractores").css('display', 'block');

        $('#tipoDocInf').prop('selectedIndex', 0);
        $('#personaInfID').val('');
        $('#nombreInfID').val('');
        $('#apellidoInfID').val('');
        $('#paisInfID').prop('selectedIndex', 0);
        $('#provinciaInfID').prop('selectedIndex', 0);
        $('#localidadInfractorID').prop('selectedIndex', 0);
        $('#domicilioInfID').val('');
        $('#codigoPostalID').val('');
        $('#comboResponsabilidadLegal').prop('selectedIndex', 0);
    }
    else {
        alert("Campos vacíos, ¡Revisar!");
    }
});

maxCharacters = 250;
$('#count').text(maxCharacters);

$('textarea').bind('keyup keydown', function () {
    var count = $('#count');
    var characters = $(this).val().length;

    if (characters > maxCharacters) {
        count.addClass('over');
    } else {
        count.removeClass('over');
    }
    count.text(maxCharacters - characters);
});

//botón limpiar
$('#btnLimpiarForm').click(function () {
    var result = confirm("¿Desea limpiar el formulario de carga?");
    if (result) {
        $(':input[type=text][name!=localidadInf][name!=normativa]').val('').prop('checked', false)
            .prop('selected', false);
        $('select').val('');
        $("input[type=date]").val("");
        $("input[type=time]").val("");
        $('#observacionesInfID').val("");
        $('input[type="radio"]').prop('checked', false);

        $('#titularesRegistrados').empty();
        $('#titularesDeclarados').empty();
        $('#titularesNoDeclarados').empty();
        $('#personasRegistradas').empty();
        $('#personasNoRegistradas').empty();

        $('#infractoresDeclarados').empty();
        $('#infractoresNoDeclarados').empty();
        $('#personasInfRegistradas').empty();
        $('#personasInfNoRegistradas').empty();

        $('#formCargarActa_infracciones').empty();
        $('#listadoInfracciones').empty();

        $("#formCargarActa > input").each((index, elem) => {
            elem.remove();
        });

        $("#labelNumeroActa").remove();
        $("#labelNumeroActaRangoInspector").remove();

        $('#localidadInfID').val("1");
        window.location.reload(true);
    }
});
var badgeSeleccionado = "";
$("#titularesDeclarados").on('click', '.badgePersonaMenu', function (event) {
    event.stopPropagation();
    mostrarMenu(this.id,0);
});

$("#titularesNoDeclarados").on('click', '.badgePersonaMenu', function (event) {
    event.stopPropagation();
    mostrarMenu(this.id,0);
});
$("#titularesRegistrados").on('click', '.badgePersonaMenu', function (event) {
    event.stopPropagation();
    mostrarMenu(this.id,1);
});
function mostrarMenu(idPersona, eliminar) {
    if (eliminar == 0) {
        $('#elimTitular').show();
    } else {
        $('#elimTitular').hide();
    }
    $("div[id ^= 'badgeEliminarPersona']").removeClass('badge-seleccionado');
    $('#' + idPersona).toggleClass('badge-seleccionado');
    $('#menuPersona').show();
    $('#idPersonaMenuAbierta').val(idPersona);
}

$(window).click(function () {
    $("div[id ^= 'badgeEliminarPersona']").removeClass('badge-seleccionado');
    $("div[id ^= 'inf_badgeEliminarPersona']").removeClass('badge-seleccionado');
    $('#menuPersona').hide();
    $('#menuPersonaINF').hide();
});




$('#elimTitular').click(function () {
    var idBadgePersona = '#' + $('#idPersonaMenuAbierta').val();
    var selectorForm = getSelectorPersona(1);
    $(selectorForm).remove();
    $(idBadgePersona).remove();
    $('#menuPersona').hide();
});

$('#infractorTitular').click(function () {
    $("div[id ^= 'badgeEliminarPersona']").removeClass('badge-seleccionado');
    var idBadgePersona = '#' + $('#idPersonaMenuAbierta').val();
    var selectorForm = getSelectorPersona(1);
    var badge = $(idBadgePersona).clone().prop('id', idBadgePersona.replace('#', 'inf_'));
    var formData = $(selectorForm).clone().prop('id', selectorForm.replace('#', 'inf_'));;
    var selectorForm = selectorForm.replace('#','inf_');
    var existeBadge = false;
    var existeForm = false;
    $("#infractoresDeclarados > div").each((index, elem) => {
        var elemSel = '#' + elem.id;
        var idBadgePersonaINF = idBadgePersona.replace('#', '#inf_')
        if (elemSel == idBadgePersonaINF) {
            existeBadge = true;
        }
    });
    $("#personasInfRegistradas > div").each((index, elem) => {
        var elemSel = '#' + elem.id;
        var selectorFormINF = selectorForm.replace('#', '#inf_')
        if (elemSel == selectorFormINF) {
            existeForm = true;
        }
    });
    if (!existeBadge) {
        $('#infractoresDeclarados').append(badge);
        $('#listadoInfractores').show();
    }
    if (!existeForm) {
        $('#personasInfRegistradas').append(formData);
        $('#'+selectorForm).append('<input name="form_responsabilidad" type="text" class="form-control" id="form_responsabilidad" value="2">');
    }
});

$("div[id^='infractores']").on('click', '.badgePersonaMenu', function () {
    event.stopPropagation();
    $("div[id ^= 'inf_badgeEliminarPersona']").removeClass('badge-seleccionado');
    $("div[id ^= 'badgeEliminarPersona']").removeClass('badge-seleccionado');
    $('#' + this.id).toggleClass('badge-seleccionado');
    $('#menuPersonaINF').show();
    $('#idPersonaINFMenuAbierta').val(this.id);
});

$('#elimTitularINF').click(function () {
    var idBadgePersona = '#' + $('#idPersonaINFMenuAbierta').val();
    var selectorForm = getSelectorPersona(2);
    $(selectorForm).remove();
    $(idBadgePersona).remove();
    $('#menuPersonaINF').hide();
});

//funciones de validacion textbox vacios
$('#fechaInf').blur(function () {
    $('#fechaVacia').remove();
    if (!$(this).val()) {
        $("#btnFechaInf").after('<p class="control-label" id="fechaVacia" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
    }
});

$('#horaInf').blur(function () {
    $('#horaInfVacia').remove();
    if (!$(this).val()) {
        $("#horaInf").after('<p class="control-label" id="horaInfVacia" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
    }
});

$('#direccionInfID').blur(function () {
    $('#direccionInfVacia').remove();
    if (!$(this).val()) {
        $("#direccionInfID").after('<p class="control-label" id="direccionInfVacia" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
    }
});

$('#codigoPostalInfID').blur(function () {
    $('#codigoPostalInfVacia').remove();
    if (!$(this).val()) {
        $("#codigoPostalInfID").after('<p class="control-label" id="codigoPostalInfVacia" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
    }
});

$('#automotorID').blur(function () {
    $('#automotorVacio').remove();
    if (!$(this).val().trim()) {
        $("#automotorID").after('<p class="control-label" id="automotorVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
    }
});

$('#modeloVehiculoID').blur(function () {
    $('#modeloVehiculoVacio').remove();
    if (!$(this).val().trim()) {
        $("#modeloVehiculoID").after('<p class="control-label" id="modeloVehiculoVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
    }
});

$('#personaID').blur(function () {
    $('#personaIDVacio').remove();
    console.log(this.value);
    if (!$(this).val().trim() || this.value.includes("X")) {
        $("#personaID").after('<p class="control-label" id="personaIDVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
    }
    
});

$('#nombrePersona').blur(function () {
    $('#nombrePersonaVacio').remove();
    if (!$(this).val().trim()) {
        $("#nombrePersona").after('<p class="control-label" id="nombrePersonaVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
    }
});

$('#apellidoPersona').blur(function () {
    $('#apellidoPersonaVacio').remove();
    if (!$(this).val().trim()) {
        $("#apellidoPersona").after('<p class="control-label" id="apellidoPersonaVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
    }
});


$('#personaInfID').blur(function () {
    $('#personaInfIDVacio').remove();
    if (!$(this).val().trim()) {
        $("#personaInfID").after('<p class="control-label" id="personaInfIDVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
    }
});

$('#nombreInfID').blur(function () {
    $('#nombreInfVacio').remove();
    if (!$(this).val().trim()) {
        $("#nombreInfID").after('<p class="control-label" id="nombreInfVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
    }
});

$('#apellidoInfID').blur(function () {
    $('#apellidoInfVacio').remove();
    if (!$(this).val().trim()) {
        $("#apellidoInfID").after('<p class="control-label" id="apellidoInfVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
    }
});
$('#domicilioInfID').blur(function () {
    $('#domicilioInfVacio').remove();
    if (!$(this).val().trim()) {
        $("#domicilioInfID").after('<p class="control-label" id="domicilioInfVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
    }
});


//funciones de validacion de comboboxs
$('#tipoVehiculoID').click(function () {
    $('#tipoVehiculoVacio').remove();
    var value = $('#tipoVehiculoID').val();
    if (value < 1) {
        $("#tipoVehiculoID").after('<p class="control-label" id="tipoVehiculoVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
        return false;
    }
    else {
        return true;
    }
});

$('#marcaVehiculoID').click(function () {
    $('#marcaVehiculoVacio').remove();
    var value = $('#marcaVehiculoID').val();
    if (value < 1) {
        $("#marcaVehiculoID").after('<p class="control-label" id="marcaVehiculoVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
        return false;
    }
    else {
        return true;
    }
});

$('#tipoDoc').click(function () {
    $('#tipoDocVacio').remove();
    var value = $('#tipoDoc').val();
    if (value < 1) {
        $("#tipoDoc").after('<p class="control-label" id="tipoDocVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
        return false;
    }
    else {
        return true;
    }
});
$('#tipoDocInf').click(function () {
    $('#tipoDocInfVacio').remove();
    var value = $('#tipoDocInf').val();
    if (value < 1) {
        $("#tipoDocInf").after('<p class="control-label" id="tipoDocInfVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
        return false;
    }
    else {
        return true;
    }
});
$('#paisInfID').click(function () {
    $('#paisInfVacio').remove();
    var value = $('#paisInfID').val();
    if (value < 1) {
        $("#paisInfID").after('<p class="control-label" id="paisInfVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
        return false;
    }
    else {
        return true;
    }
});
$('#provinciaInfID').click(function () {
    $('#provinciaInfVacio').remove();
    var value = $('#provinciaInfID').val();
    if (value < 1) {
        $("#provinciaInfID").after('<p class="control-label" id="provinciaInfVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
        return false;
    }
    else {
        return true;
    }
});
$('#localidadInfractorID').click(function () {
    $('#localidadInfractorVacio').remove();
    var value = $('#localidadInfractorID').val();
    if (value < 1) {
        $("#localidadInfractorID").after('<p class="control-label" id="localidadInfractorVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
        return false;
    }
    else {
        return true;
    }
});

$('#comboResponsabilidadLegal').click(function () {
    $('#comboResponsabilidadLegalVacio').remove();
    var value = $('#comboResponsabilidadLegal').val();
    if (value < 1) {
        $("#comboResponsabilidadLegal").after('<p class="control-label" id="comboResponsabilidadLegalVacio" style="color:red">' + "Campo obligatorio, debe llenarlo." + '</label>');
        return false;
    }
    else {
        return true;
    }
});

function validarExistenciaInfractor() {
    var resultado = false;
    $('#personasInfRegistradas :input[id="form_responsabilidad"]').each((index, elem) => {
        if (elem.value == 2) {
            resultado = true;
        }
    });
    $('#personasInfNoRegistradas :input[id="form_responsabilidad"]').each((index, elem) => {
        if (elem.value == 2) {
            resultado = true;
        }
    });
    return resultado;
}


function getSelectorPersona(tipoTINF) {
    var selectorFormNew = 'datosPersonasTitularNR_';
    var selectorFormReg = 'datosPersonasTitular_';
    var idBadgePersona = '#' + $('#idPersonaMenuAbierta').val();
    if (tipoTINF == 2) {
        selectorFormNew = 'datosPersonasInfractorNR_';
        selectorFormReg = 'datosPersonasInfractor_';
        idBadgePersona = '#' + $('#idPersonaINFMenuAbierta').val();
    }
    var arrayIdPersona = idBadgePersona.split('NR');
    var idPersona = 0;
    if (arrayIdPersona.length > 1) {
        arrayIdPersona = arrayIdPersona[1].split('_');
        idPersona = arrayIdPersona[1];
        selectorFormNew += idPersona;
        return '#' + selectorFormNew;

    } else {
        arrayIdPersona = arrayIdPersona[0].split('_');
        idPersona = arrayIdPersona[1];
        selectorFormReg += idPersona;
        return '#' + selectorFormReg;
    }
}

function verificarMostrarRetuvoLV() {
    var infracciones = [];
    $("#formCargarActa_infracciones > div").each((index, elem) => {
        var listado_inputs = elem.querySelectorAll("input");
        var objInput = {};
        listado_inputs.forEach(elemento => {
            var key = elemento.id;

            objInput[key] = elemento.value;
        });
        infracciones.push(objInput);
    });
    var retuvoLicenciaPerm = infracciones.some(function (item) {
        return item.form_retuvo_licencia.trim() == "true"
    });
    var retuvoVehiculoPerm = infracciones.some(function (item) {
        return item.form_retuvo_vehiculo.trim() == "true";
    });
    console.log("infracciones");
    console.log(infracciones);
    console.log("retuvo licencia habilitado: " + retuvoLicenciaPerm);
    console.log("retuvo vehiculo habilitado: " + retuvoVehiculoPerm);
    if (retuvoLicenciaPerm) {
        $('#retuvoLicenciaPerm').show();
    } else {
        $('#retuvoLicenciaPerm').hide();
    }
    if (retuvoVehiculoPerm) {
        $('#retuvoVehiculoPerm').show();
    } else {
        $('#retuvoVehiculoPerm').hide();
    }
}


function agregarInfractorvacio() {
    var resultado = true;
    if (!$(personaInfID).val()) {
        resultado = false;
    }
    if (!$(nombreInfID).val()) {
        resultado = false;
    }
    if (!$(apellidoInfID).val()) {
        resultado = false;
    }
    if (!$(domicilioInfID).val()) {
        resultado = false;
    }
    var td = $('#tipoDocInf').val();
    if (td < 1) {
        resultado = false;
    }
    var rl = $('#comboResponsabilidadLegal').val();
    if (rl < 1) {
        resultado = false;
    }
    var pi = $('#paisInfID').val();
    if (pi < 1) {
        validaciones = false;
    }
    var pri = $('#provinciaInfID').val();
    if (pri < 1) {
        validaciones = false;
    }
    var lii = $('#localidadInfractorID').val();
    if (lii < 1) {
        validaciones = false;
    }
    return resultado;
}


//Función solo números
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode != 46 && charCode > 31
        && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
//Función solo letras y espacios
function lettersSpacesOnly(evt) {
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
        ((evt.which) ? evt.which : 0));
    if (charCode > 32 && (charCode < 65 || charCode > 90) &&
        (charCode < 97 || charCode > 122)) {
        return false;
    }
    return true;
}


//Función no alfanumericos
function noAlfanumericos(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode == 63 || charCode > 32 && (charCode < 48 || charCode > 90) &&
        (charCode < 97 || charCode > 122)) {
        return false;
    }
    return true;
}
//(charCode>193 && charCode<201 && (charCode>201 && charCode<205) &&  charCode > 252  )
//Función para campo observaciones
function validacionCampoObservaciones(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode > 32 && (charCode < 40 || (charCode > 41 && charCode < 44 && charCode > 46 && charCode < 58 && charCode > 59) || charCode > 90) &&
        (charCode < 97 || charCode > 122 && (charCode != 193 && charCode != 201 && charCode != 205 && charCode != 209 && charCode != 211 && charCode != 218
        && charCode!=225 && charCode!=233 && charCode!=237 && charCode!=241 && charCode!=243 && charCode!=250))) {
        return false;
    }
    return true;
}

function estaVacio() {
    var validaciones = true;

    if (!$(numeroActaID).val()) {
        validaciones = false;
    }
    if (!$(fechaInf).val()) {
        validaciones = false;
    }
    if (!$(horaInf).val()) {
        validaciones = false;
    }
    if (!$(horaInf).val()) {
        validaciones = false;
    }
    if (!$(direccionInfID).val()) {
        validaciones = false;
    }
    if (!$(codigoPostalInfID).val()) {
        validaciones = false;
    }
    if (!$(automotorID).val()) {
        validaciones = false;
    }
    if (!$(modeloVehiculoID).val()) {
        validaciones = false;
    }
    var tv = $('#tipoVehiculoID').val();
    if (tv < 1) {
        validaciones = false;
    }
    var mv = $('#marcaVehiculoID').val();
    if (mv < 1) {
        validaciones = false;
    }
    var listInf = $('#listadoInfracciones').children().length;
    if (listInf < 1) {
        validaciones = false;
    }
    var lisTitReg = $('#titularesRegistrados').children().length;
    var lisTitDec = $('#titularesDeclarados').children().length;
    var lisTitNoDec = $('#titularesNoDeclarados').children().length;
    if ((lisTitReg < 1) && (lisTitDec < 1) && (lisTitNoDec < 1)) {
        validaciones = false;
    }
    var lisInfrDer = $('#infractoresDeclarados').children().length;
    var lisInfrNoDer = $('#infractoresNoDeclarados').children().length;
    if ((lisInfrDer < 1) && (lisInfrNoDer < 1)) {
        validaciones = false;
    }


    return validaciones;
}

function registerTitulares(response) {

    var inputForm = "<input id='id_automotor_form' name='id_automotor_form' value='" + response.id_automotor + "'>";
    $('#formCargarActa').append(inputForm);
    //          $("#automotorID").attr("value", res[0]);
    $("#automotorID").val(response.numero_dominio);
    $("#automotorID").prop("disabled", true);
    $("#automotorID_form").remove();
    var automotor = $("#automotorID").val();
    var inputForm = "<input id='automotorID_form' name='automotorID_form' value='" + automotor + "'>";
    $('#formCargarActa').append(inputForm);

    $("#tipoVehiculoID").val(response.tipoVehiculo.id_tipo_vehiculo);
    $("#tipoVehiculoID").prop("disabled", true);
    $("#tipoVehiculo_form").remove();
    var tipoVehiculo = $("#tipoVehiculoID").val();
    var inputForm = "<input id='tipoVehiculo_form' name='tipoVehiculo_form' value='" + tipoVehiculo + "'>";
    $('#formCargarActa').append(inputForm);

    //     $("#marcaVehiculoID").attr("value", res[2]);
    $("#marcaVehiculoID").val(response.marca.id_marca);
    $("#marcaVehiculoID").prop("disabled", true);
    $("#marcaVehiculo_form").remove();
    var marcaVehiculo = $("#marcaVehiculoID").val();
    var inputForm = "<input id='marcaVehiculo_form' name='marcaVehiculo_form' value='" + marcaVehiculo + "'>";
    $('#formCargarActa').append(inputForm);

    // $("#modeloVehiculoID").attr("value", res[3]);
    $("#modeloVehiculoID").val(response.modelo);
    $("#modeloVehiculoID").prop("disabled", true);
    $("#modeloVehiculo_form").remove();
    var modeloVehiculo = $("#modeloVehiculoID").val();
    var inputForm = "<input id='modeloVehiculo_form' name='modeloVehiculo_form' value='" + modeloVehiculo + "'>";
    $('#formCargarActa').append(inputForm);
    //$("#colorVehiculoID").attr("value", res[4]);
    $("#colorVehiculoID").val(response.color);
    $("#colorVehiculoID").prop("disabled", true);
    $("#colorVehiculo_form").remove();
    var colorVehiculo = $("#colorVehiculoID").val();
    var inputForm = "<input id='colorVehiculo_form' name='colorVehiculo_form' value='" + colorVehiculo + "'>";
    $('#formCargarActa').append(inputForm);

    //Funcion mas de un titular
    $("#btnAutomotorLimpiar").css('display', 'block');
    if (response.listadoTitulares.length > 0) {
        response.listadoTitulares.forEach(element => {
            var parentDiv = [];
            $("#titularesRegistrados > div").each((index, elem) => {
                var idPersona = elem.id.split('_');
                parentDiv.push(idPersona[1]);
            });
            if (parentDiv.length > 0) {
                var codigoRepetido = false;
                parentDiv.forEach(id_persona => {
                    if (element.id_persona == id_persona) {
                        codigoRepetido = true;
                    }
                });
                if (!codigoRepetido) {
                    var badgePersona = "<div class='badge badge-light badgePersonaMenu mb-1' name='noEliminar' id='badgeEliminarPersona_" + element.id_persona + "'>" + element.nombre + " " + element.apellido + " <span class='material-icons pillPersona'>contact_support</span> </div>";
                    $('#titularesRegistrados').append(badgePersona);
                    var inputFormIdPersona = "<input name='form_id_persona' type='text' class='form-control' id='form_id_persona' value='" + element.id_persona + "'>";
                    var inputFormTipoDocumento = "<input name='form_tipo_documento' type='text' class='form-control' id='form_tipo_documento' value='" + element.tipoDocumento.id_tipo_documento + "'>";
                    var inputFormNumeroDocumento = "<input name='form_numero_documento' type='text' class='form-control' id='form_numero_documento' value='" + element.numero_documento + "'>";
                    var inputFormNombre = "<input name='form_nombre' type='text' class='form-control' id='form_nombre' value='" + element.nombre + "'>";
                    var inputFormApellido = "<input name='form_apellido' type='text' class='form-control' id='form_apellido' value='" + element.apellido + "'>";
                    var datosPersonaTitular = "<div id='datosPersonasTitular_" + element.id_persona + "'>" + inputFormIdPersona + inputFormTipoDocumento + inputFormNumeroDocumento + inputFormNombre + inputFormApellido + "</div>";
                    $('#personasRegistradas').append(datosPersonaTitular);
                    $('#infraccionID').val(' ');
                }
            }
            else {
                var badgePersona = "<div class='badge badge-light badgePersonaMenu mb-1' name='noEliminar' id='badgeEliminarPersona_" + element.id_persona + "'>" + element.nombre + " " + element.apellido + " <span class='material-icons pillPersona'>contact_support</span> </div>";
                $('#titularesRegistrados').append(badgePersona);
                var inputFormIdPersona = "<input name='form_id_persona' type='text' class='form-control' id='form_id_persona' value='" + element.id_persona + "'>";
                var inputFormTipoDocumento = "<input name='form_tipo_documento' type='text' class='form-control' id='form_tipo_documento' value='" + element.tipoDocumento.id_tipo_documento + "'>";
                var inputFormNumeroDocumento = "<input name='form_numero_documento' type='text' class='form-control' id='form_numero_documento' value='" + element.numero_documento + "'>";
                var inputFormNombre = "<input name='form_nombre' type='text' class='form-control' id='form_nombre' value='" + element.nombre + "'>";
                var inputFormApellido = "<input name='form_apellido' type='text' class='form-control' id='form_apellido' value='" + element.apellido + "'>";
                var datosPersonaTitular = "<div id='datosPersonasTitular_" + element.id_persona + "'>" + inputFormIdPersona + inputFormTipoDocumento + inputFormNumeroDocumento + inputFormNombre + inputFormApellido + "</div>";
                $('#personasRegistradas').append(datosPersonaTitular);
                $('#infraccionID').val(' ');
            }
        });
        $("#listadoTitulares").css('display', 'block');
    }
}

function limpiarTitulares() {
    $("#automotorID").val("");
    $("#automotorID").prop("disabled", false);
    $("#tipoVehiculoID").val("");
    $("#tipoVehiculoID").prop("disabled", false);
    $("#marcaVehiculoID").val("");
    $("#marcaVehiculoID").prop("disabled", false);
    $("#modeloVehiculoID").val("");
    $("#modeloVehiculoID").prop("disabled", false);
    $("#colorVehiculoID").val("");
    $("#colorVehiculoID").prop("disabled", false);
    $("#btnAutomotorLimpiar").css('display', 'none');


    $('#titularesRegistrados').empty();
    $('#titularesDeclarados').empty();
    $('#titularesNoDeclarados').empty();
    $('#personasRegistradas').empty();
    $('#personasNoRegistradas').empty();
}