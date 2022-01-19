<%-- 
    Document   : AltaCliente
    Created on : 3 nov 2021, 9:15:35
    Author     : carp_

--%>

<%@page import="Modelo.tipoDoc"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.ClienteControlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="gestor" class="Controlador.ClienteControlador" scope="page" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="estilos.css"/>
        <title>Alta de Cliente</title>

    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
        <%@include file="BarrraNavegacion.html" %>

        <c:set var="t" value="${requestScope.combo}"></c:set>
            <section class="container">
                <div class="row my-5">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <form id="form" class="formulario" action="ConfirmacionAltaCliente.jsp" method="POST">
                            <h3 class="display-5 text-center">Registro de Cliente</h3>
                            <div clas="form-group">
                                <label>Nombre</label>
                                <input type="text"  name="nombre" placeholder="Ingrese nombre" id="idNombre" value=""  class="form-control text-light" />
                            </div>
                            <div clas="form-group">
                                <label>Apellido</label>
                                <input type="text" class="form-control text-light" id="idApellido" name="apellido" placeholder="Ingrese apellido" value="" />
                            </div>
                            <div clas="form-group">
                                <label>Tipo de Documento</label>
                                <select name="cboTipoDocu" class="form-control text-light">
                                <c:forEach items="${gestor.tiposDoc}" var="tip">
                                    <option value="${tip.idTipoDoc}"> ${tip.descripcion}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div clas="form-group">
                            <label>Numero de Documento</label>
                            <input type="number" min="1" class="form-control text-light" id="numDo" name="txtNumDocumento" placeholder="Ingrese numero de documento" value="" />
                        </div>
                        <div clas="form-group">
                            <label>Fecha de Nacimiento</label>
                            <input type="date" class="form-control text-light" id="fecnac" name="txtFecNacim" placeholder="Ingrese fecha de nacimiento" value="" />
                        </div>
                        <div clas="form-group">
                            <button type="button"  id="btnRegistrarCliente" class="btn btn-primary" onclick="validar()">Registrar</button>
                        </div>
                    </form> 
                </div>                       
            </div>
        </section>
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
