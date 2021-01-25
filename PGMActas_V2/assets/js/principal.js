
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
    });
    return false;
});

//Función verificación de hora mayor a la actual

$("#horaInf").blur(function () {

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
        if (hora > datetime) {
            $("#horaInf").after('<label class="control-label" id="errorHora">Hora mayor a la hora actual</label>');
            document.getElementById("divHora").classList.add("has-error");
        }

    }
});
//deshabilitar hora hasta que no se ingresa fecha
$("#fechaInf").blur(function () {
    $("#horaInf").prop("disabled", false);

});

//Función hora actual (ya no se usa)
/*$(function () {
    $('#btnHoraCarga').click(function () {
        var currentdate = new Date();
        var datetime = currentdate.getHours() + ":" + currentdate.getMinutes();
        $("#horaCarga").attr("value", datetime);
        $("#horaCarga").val(datetime);
    });
    return false;
});*/


//Función navbar responsive
$(".a").click(function () {
    if ($("#btnCollapse").css('display') != 'none')
        $("#btnCollapse").click();
});


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
    if (charCode > 32 && (charCode < 48 || charCode > 90) &&
        (charCode < 97 || charCode > 122)) {
        return false;
    }
    return true;
}


//Función máscara CUIT
$("#tipoDoc, #tipoDocInf").on('change', function () {
    if (this.value > 0) {
        $("#personaID, #personaInfID").prop("disabled", false);
        if (this.value == "3") {
            $("#personaID, #personaInfID").mask("99-99999999-9", { placeholder: "XX-XXXXXXXX-X" });

        }
        else {
            $("#personaID, #personaInfID").unmask();
        }
    }
});


//Funciones infracciones

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
        }
    }
});
$("#listadoInfracciones").on("click", "div", function (event) {
    event.preventDefault();
    console.log("Eliminar infraccion");
    var idInfraccion = this.id;
    idInfraccion = idInfraccion.split('_');
    var infraccionForm = '#form_codigo_infraccion_' + idInfraccion[1];
    $(infraccionForm).remove();
    var infraccionBadgeId = "#" + this.id;
    $(infraccionBadgeId).remove();
});

//Funciones titulares
$('#agregarTitular').click(function () {
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
            datosPersonaTitular = "<div id='datosPersonasTitular|[0]_" + index + "' name='"+numeroDocumento+"'>" + inputFormIdPersona + inputFormTipoDocumento + inputFormNumeroDocumento + inputFormNombre + inputFormApellido + "</div>";
            $('#personasNoRegistradas').append(datosPersonaTitular);
            var badgePersona = "<div class='badge badge-light' id='badgeEliminarPersona|[0]_" + index + "' name='" +numeroDocumento+"'>" + nombreTitular + " " + apellidoTitular + "</div>";
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
            var badgePersona = "<div class='badge badge-light' id='badgeEliminarPersona_" + personaID + "'>" + nombreTitular + " " + apellidoTitular + " <span class='material-icons pillPersona'>contact_support</span> </div>";
            $('#titularesDeclarados').append(badgePersona);
            $('#personasRegistradas').append(datosPersonaTitular);
        }

    }

    $("#listadoTitulares").css('display', 'block');
});


//función nro acta copia form invisible
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
            datosPersonaTitular = "<div id='datosPersonasTitular|[0]_" + index + "' name='" + numeroDocumento + "'>" + inputFormIdPersona + inputFormTipoDocumento + inputFormNumeroDocumento + inputFormNombre + inputFormApellido + inputFormLocalidad + inputFormDomicilio + inputFormCodigoPostal + inputFormResponsabilidad + "</div>";
            $('#personasInfNoRegistradas').append(datosPersonaTitular);
            var badgePersona = "<div class='badge badge-info' id='badgeEliminarPersona|[0]_" + index + "' name='" + numeroDocumento + "'>" + nombreInfractor + " " + apellidoInfractor + "</div>";
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
            var badgePersona = "<div class='badge badge-light' id='badgeEliminarPersona_" + personaID + "'>" + nombreInfractor + " " + apellidoInfractor + " <span class='material-icons pillPersona'>contact_support</span> </div>";
            $('#infractoresDeclarados').append(badgePersona);
            $('#personasInfRegistradas').append(datosPersonaTitular);
        }

    }

    $("#listadoInfractores").css('display', 'block');
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
    }
});

