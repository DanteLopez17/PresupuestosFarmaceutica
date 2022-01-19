<%-- 
    Document   : detalleCliente
    Created on : 3 nov 2021, 13:17:59
    Author     : carp_

       
--%>


<%@page import="Modelo.Cliente"%>
<%@page import="Controlador.ClienteControlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="estilos.css"/>
        <title>Modificar Cliente</title>
    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
        <%@include file="BarrraNavegacion.html" %>
        <c:set var="cli" value="${requestScope.cliXid}"></c:set>
        <c:if test= "${cli != null}">
            <section class="container">
                <div class="row my-5">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <form id="form" class="formulario" action="ModificarCliente" method="POST">
                            <h4 class="display-5 text-center">Modificar Cliente</h4>
                            <div class="form-group text-light">
                                <label>Nombre</label>
                                <input type="text"  name="txtNombre" id="idNombre" value="${cli.nombre}"  class="form-control text-light" />
                            </div>
                            <div class="form-group text-light">
                                <label>Apellido</label>
                                <input type="text"  name="txtApellido" id="idApellido" value="${cli.apellido}"  class="form-control text-light" />
                            </div>
                            <div class="form-group text-light">
                                <label>Tipo Documento</label>
                                <input type="text"  name="txtTipoDocumento" id="idTipoDocumento" value="${cli.tipoDocumento.descripcion}"  class="form-control text-light" readonly/>
                            </div>
                            <div class="form-group text-light">
                                <label>Numero de Documento</label>
                                <input type="number" min="1" name="txtNumDocu" id="numDo" value="${cli.numDocumento}"  class="form-control text-light" readonly/>
                            </div>
                            <div class="form-group text-light">
                                <label>Fecha de Nacimiento</label>
                                <input type="date"  name="txtFecNac" id="fecnac" value="${cli.fechaNacimiento}"  class="form-control text-light" />
                            </div>
                            <div hidden>
                                <input type="hidden" name="txtIdCliente" value="${cli.idCliente}" />
                                <input type="hidden" name="txtIdTipoDoc" value="${cli.tipoDocumento.idTipoDoc}" />
                            </div>
                            <div class="form-group">
                                <button type="button"  id="btnModificarCliente" class="btn btn-primary" onclick="validar()">Confirmar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </c:if>
        <c:if test="${cli == null}">
            <h2>El Cliente no existe</h2>
        </c:if>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
        <script src='"https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"'></script>
        <script src='"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"'></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
                                    function validar() {
                                        const formulario = document.getElementById("form")
                                        const nom = document.getElementById("idNombre").value
                                        const ape = document.getElementById("idApellido").value
                                        const numd = document.getElementById("numDo").value
                                        const fec = document.getElementById("fecnac").value

                                        if (nom == "" || nom == null) {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Oops...',
                                                text: 'Verifique el nombre!',
                                                footer: '<a href=""></a>'
                                            })
                                        } else if (ape == "" || ape == null) {


                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Oops...',
                                                text: 'Verifique el Apellido!',
                                                footer: '<a href=""></a>'
                                            })

                                        } else if (numd == "" || numd == null || numd <= 0) {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Oops...',
                                                text: 'Verifique numero de documento!',
                                                footer: '<a href=""></a>'
                                            })
                                        } else if (fec == "" || fec == null) {


                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Oops...',
                                                text: 'Verifique la fecha!',
                                                footer: '<a href=""></a>'
                                            })

                                        } else {

                                            Swal.fire({
                                                title: '¿Confirmar?',
                                                type: 'question',
                                                showCancelButton: true,
                                                confirmButtonText: 'Si',
                                                cancelButtonText: "No",
                                                confirmButtonColor: '#3085d6',
                                                cancelButtonColor: '#d33',
                                            }).then((result) => {
                                                if (result.value) {
                                                    formulario.submit();
                                                }
                                                return false;
                                            })
                                        }
                                    }
                                    ;
        </script>
        </c:if>
        <c:if test= "${!sessionScope.autenticado}">
            <c:redirect url="/login.html"/>
        </c:if>
    </body>
</html>
