<%-- 
    Document   : ModificarSuministro
    Created on : 5 nov 2021, 10:42:33
    Author     : carp_
--%>

<%@page import="Modelo.Suministro"%>
<%@page import="Controlador.SuministroControlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="estilos.css"/>
        <title>Modificar Suministro</title>
    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
            <%@include file="BarrraNavegacion.html" %>
            <c:set var="sum" value="${requestScope.sumXid}"></c:set>
            <c:set var="cl" value="${requestScope.comboClas}"></c:set>
            <c:set var="ti" value="${requestScope.comboTipoSum}"></c:set>

            <c:if test= "${sum != null}">
                <section class="container">
                    <div class="row my-5">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <form id="form" class="formulario" action="ModificarSuministro" method="POST">
                                <h4 class="display-5 text-center">Modificar Suministro</h4>
                                <div class="form-group text-light">
                                    <label>Descripcion</label>
                                    <input type="text"  name="txtDescripcion" id="idDescripcion" value="${sum.descSum}"  class="form-control text-light" />
                                </div>
                                <div hidden>
                                    <input type="hidden" name="txtIdSum" value="${sum.idSuministro}" />
                                </div>
                                <div class="form-group text-light">
                                    <label>Precio</label>
                                    <input type="number" min="1" name="txtPrecioUnitario" id="idPrecioUnitario" value="${sum.precSum}"  class="form-control text-light" />
                                </div>
                                <div class="form-group text-light">
                                    <label>Clasificacion</label>
                                    <select id="idCla" name="cboClasificacion" class="form-control text-light">
                                        <c:forEach items="${cl}" var="clas">
                                            <option value="${clas.idClasifSum}"> ${clas.descripcionClasif}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group text-light">
                                    <label>Tipo</label>
                                    <select id="idTip" name="cboTipoSuministro" class="form-control text-light">
                                        <c:forEach items="${ti}" var="tipo">
                                            <option value="${tipo.idTipoSum}"> ${tipo.descripcionSum}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <button type="button"  id="btnModificarSumi" class="btn btn-primary" onclick="validar()">Confirmar</button>
                                </div>
                            </form>  
                        </c:if>
                        <c:if test="${sum == null}">
                            <h2>El Suministro no existe</h2>
                        </c:if>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
                        <script src='"https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"'></script>
                        <script src='"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"'></script>
                        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

                        <script>
                                        function validar() {
                                            const formulario = document.getElementById("form")
                                            const desc = document.getElementById("idDescripcion").value
                                            const pre = document.getElementById("idPrecioUnitario").value
                                            const cla = document.getElementById("idCla").value
                                            const tip = document.getElementById("idTip").value

                                            if (desc == "" || desc == null) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Oops...',
                                                    text: 'Verifique el nombre!',
                                                    footer: '<a href=""></a>'
                                                })
                                            } else if (pre == "" || pre == null || pre <= 0) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Oops...',
                                                    text: 'Verifique precio!',
                                                    footer: '<a href=""></a>'
                                                })
                                            } else if (cla == "" || cla == null) {


                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Oops...',
                                                    text: 'Seleccione clasificacion!',
                                                    footer: '<a href=""></a>'
                                                })

                                            } else if (tip == "" || tip == null) {


                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Oops...',
                                                    text: 'Seleccione Tipo!',
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
