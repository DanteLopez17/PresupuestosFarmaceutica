<%-- 
    Document   : AltaSuministro
    Created on : 5 nov 2021, 1:41:21
    Author     : carp_
--%>

<%@page import="Modelo.Sucursal"%>
<%@page import="Controlador.StockxSucControlador"%>
<%@page import="Modelo.TipoSuministro"%>
<%@page import="Modelo.Clasificacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.SuministroControlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="estilos.css"/>
        <title>Alta de Suministro</title>
    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
        <%@include file="BarrraNavegacion.html" %>
        <c:set var="clas" value="${requestScope.comboClas}"></c:set>
        <c:set var="tipS" value="${requestScope.comboTipoSum}"></c:set>
        <c:set var="sucs" value="${requestScope.comboSucur}"></c:set>

            <section class="container">
                <div class="row my-5">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <form id="form" class="formulario" action="AltaSuministro" method="POST">
                            <h3 class="display-5 text-center">Alta de Suministro</h3>
                            <input type="hidden" name="txtIdClasificacion" value="" />
                            <input type="hidden" name="txtIdTipoSum" value="" />
                            <div clas="form-group">
                                <label>Descripcion</label>
                                <input type="text"  name="txtDescripcion" placeholder="Nombre" id="idNombre" value=""  class="form-control text-light" />
                            </div>
                            <div clas="form-group">
                                <label>Precio</label>
                                <input type="number" min="1" name="txtPrecioUnit" placeholder="Precio" id="idPrecio" value=""  class="form-control text-light" />
                            </div>
                            <div clas="form-group">
                                <label>Cantidad</label>
                                <input type="number" min="1"  name="txtCantidad" placeholder="Cantidad" id="idCantidad" value=""  class="form-control text-light" />
                            </div>
                            <div clas="form-group">
                                <label>Clasificacion</label>
                                <select id="idclas" name="cboClasificacion" class="form-control text-light">
                                <c:forEach items="${clas}" var="clasi">
                                    <option value="${clasi.idClasifSum}"> ${clasi.descripcionClasif}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div clas="form-group">
                            <label>Tipo</label>
                            <select id="idTip" name="cboTipo" class="form-control text-light">
                                <c:forEach items="${tipS}" var="tipSum">
                                    <option value="${tipSum.idTipoSum}"> ${tipSum.descripcionSum}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div clas="form-group">
                            <label>Sucursal</label>
                            <select id="idSuc" name="cboSucursal" class="form-control text-light">
                                <c:forEach items="${sucs}" var="sucur">
                                    <option value="${sucur.nroSucursal}">${sucur.loc.nombreLoc} - ${sucur.nroSucursal}</option>
                                </c:forEach>
                            </select>
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
                                    const pre = document.getElementById("idPrecio").value
                                    const cant = document.getElementById("idCantidad").value
                                    const idcla = document.getElementById("idclas").value
                                    const idtip = document.getElementById("idTip").value
                                    const idsuc = document.getElementById("idSuc").value

                                    if (nom == "" || nom == null) {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Oops...',
                                            text: 'Verifique el nombre del suministro!',
                                            footer: '<a href=""></a>'
                                        })
                                    }  else if (pre == "" || pre == null || pre <= 0) {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Oops...',
                                            text: 'Verifique precio ingresado!',
                                            footer: '<a href=""></a>'
                                        })
                                    } else if (cant == "" || cant == null || cant <= 0) {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Oops...',
                                            text: 'Verifique cantidad ingresada!',
                                            footer: '<a href=""></a>'
                                        })
                                    } else if (idcla == "" || idcla == null) {


                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Oops...',
                                            text: 'Seleccione clasificacion!',
                                            footer: '<a href=""></a>'
                                        })

                                    } else if (idtip == "" || idtip == null) {


                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Oops...',
                                            text: 'Seleccione tipo!',
                                            footer: '<a href=""></a>'
                                        })

                                    } else if (idsuc == "" || idsuc == null) {


                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Oops...',
                                            text: 'Seleccione sucursal!',
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
