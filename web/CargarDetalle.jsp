<%-- 
    Document   : AltaReceta
    Created on : 7 nov 2021, 15:04:01
    Author     : carp_  



--%>

<%@page import="Modelo.Suministro"%>
<%@page import="Controlador.SuministroControlador"%>
<%@page import="Modelo.FormaPago"%>
<%@page import="Modelo.ObraSocial"%>
<%@page import="Controlador.RecetaControlador"%>
<%@page import="Modelo.Sucursal"%>
<%@page import="Controlador.StockxSucControlador"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="estilos.css"/>
        <title>Alta de Receta</title>
    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
        <%@include file="BarrraNavegacion.html" %>
        <c:set var="su" value="${requestScope.comboSumin}"></c:set> 
        <c:set var="dr" value="${requestScope.detalles}"></c:set> 
        <c:set var="lo" value="${requestScope.idLocali}"></c:set> 
        <c:set var="ob" value="${requestScope.idObrSo}"></c:set> 
        <c:set var="fo" value="${requestScope.idFoPa}"></c:set> 
        <c:set var="to" value="${requestScope.total}"></c:set> 


            <section id="altaRe" class="container">
                <div class="row my-5">
                    <form id="form" action="CargarDetalle" method="POST">
                        <div class="container">
                            <h3 class="display-7 ">Cargar Suministros</h3>
                        </div>
                        <div class="row my-5">
                            <div class="col-sm-3 col-md-3 col-lg-3">
                                <div clas="form-group">
                                    <label>Suministro</label>
                                    <select name="cboSuministro" class="form-control text-light">
                                    <c:forEach items="${su}" var="sumi">
                                        <option value="${sumi.idSuministro}"> ${sumi.descSum}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div clas="form-group">
                                <label>Cantidad</label>
                                <input type="number"  name="txtCantidad" min="1" placeholder="Ingrese Cantidad" id="idCantidad" value=""  class="form-control text-light" />
                            </div>
                            <div hidden="true" clas="form-group">
                                <input type="text"  name="txtLocalidad"  id="idLoca" value="${lo}"  class="form-control text-light" />
                                <input type="text"  name="txtObraSocial"  id="idObra" value="${ob}"  class="form-control text-light" />
                                <input type="text"  name="txtFormaPago" id="idForma" value="${fo}"  class="form-control text-light" />
                           
                            </div>
                            <div clas="form-group">
                                <button type="button"  id="btnRegistrarDetalleReceta" class="btn btn-primary" onclick="validar()">Cargar</button>     
                            </div>
                        </div>

                        <div class="col-sm-9 col-md-9 col-lg-9">
                            <table id="tablaReceta" class="table table-hover table-dark">
                                <thead>
                                    <tr class="text-center">
                                        <th scope="col">Suministro</th>
                                        <th scope="col">Precio Unitario</th>
                                        <%--     
                                        <c:if test= "${fo == 1}">
                                            <th scope="col">Precio con Recargo pago TC</th>
                                        </c:if>
                                        <c:if test= "${fo == 2}">
                                            <th scope="col">Precio con Descuento pago Efectivo</th>
                                        </c:if>
                                        --%>
                                        <th scope="col">Cantidad</th>
                                        <th scope="col">Descuento Obra Social</th>
                                        <th scope="col">Subtotal</th>
                                        <th scope="col">Quitar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${dr}" var="detr">
                                        <tr class="text-center">
                                            <td> ${detr.suministro.descSum} </td>
                                            <td> $${detr.preUnitSum} </td>
                                            <%-- 
                                            <td> $${detr.precio} </td>
                                            --%>
                                            <td> ${detr.cantidad} </td>
                                            <td> $${detr.descOb()} </td>
                                            <td> $${detr.calcularSubTotal()} </td>
                                            <td><a href="BajaDetalle?idDetalle=${detr.idDetalleReceta}">Borrar</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody> 
                            </table> 
                            <div class="row">
                                <div class="col-sm-3 col-md-3 col-lg-3">
                                    <label>Total Receta $${to}</label>
                                </div>
                                <div class="col-sm-3 col-md-3 col-lg-3"></div>
                                <div class="col-sm-3 col-md-3 col-lg-3"></div>
                                <div class="col-sm-3 col-md-3 col-lg-3">
                                    <a href="ListadoReceta" class="btn btn-success">Confirmar Receta</a>
                                </div>
                            </div>

                            <div clas="form-group">

                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
        <script src='"https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"'></script>
        <script src='"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"'></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
                                    function validar() {
                                        const formulario = document.getElementById("form")
                                        const cant = document.getElementById("idCantidad").value

                                        if (cant == "" || cant == null || cant <=0) {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Oops...',
                                                text: 'Cantidad incorrecta!',
                                                footer: '<a href=""></a>'
                                            })
                                        } 
                                        else {

                                            Swal.fire({
                                                title: '¿Desea agregar el suministro?',
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
                                    };
        </script>
        </c:if>
        <c:if test= "${!sessionScope.autenticado}">
                <c:redirect url="/login.html"/>
            </c:if>
    </body>
</html>
