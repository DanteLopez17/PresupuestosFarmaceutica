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
        <title>Detalle de Receta</title>
    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
        <%@include file="BarrraNavegacion.html" %>
        <c:set var="re" value="${requestScope.recexid}"></c:set>
        <c:set var="li" value="${requestScope.listaDetalles}"></c:set>
 
            <h4 class="display-5 text-center">Detalle de Receta</h4>
            <section class="container">
                <div class="row my-5">
                    <div class="col-sm-4 col-md-4 col-lg-4">
                        <div class="form-group text-light">
                            <label>Fecha</label>
                            <input type="date"  name="dtpFecha" id="fecha" value="${re.fecha}"  class="form-control text-light" readonly/>
                    </div>  
                    <div class="form-group text-light">
                        <label>Cliente</label>
                        <input type="text"  name="txtCliente" id="Cliente" value="${re.cliente.apellido} ${re.cliente.nombre}"  class="form-control text-light" readonly />
                    </div>
                    <div hidden>
                        <input type="hidden" name="txtIdReceta" value="${re.idReceta}" />
                    </div>
                </div>
                <div class="col-sm-4 col-md-4 col-lg-4">
                    <div class="form-group text-light">
                        <label>Sucursal</label>
                        <input type="text"  name="txtSucursal" id="sucursal" value="${re.sucursal.nroSucursal}"  class="form-control text-light" readonly/>
                    </div>
                    <div class="form-group text-light">  
                        <label>Profesional</label>
                        <input type="text"  name="txtProfesional" id="Profesional" value="${re.profesional.apellidoProf} ${re.profesional.nombreProf}"  class="form-control text-light" readonly/>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4 col-lg-4">
                    <div class="form-group text-light">
                        <label>Obra Social</label>
                        <input type="text"  name="txtObraSocial" id="obrasocial" value="${re.obrasocial.descripcionOS}"  class="form-control text-light" readonly/>
                    </div>
                    <div class="form-group text-light">
                        <label>Forma Pago</label>
                        <input type="text"  name="txtFormaPago" id="formapago" value="${re.formapago.descripcionFP}"  class="form-control text-light" readonly/>
                    </div>
                </div>
            </div>
            <div class="row my-5">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <table id="tabla" class="table table-hover table-dark">
                        <thead>
                            <tr class="text-center">
                                <th scope="col">Suministro</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Descuento Obra Social</th>
                                <th scope="col">SubTotal</th>
                            </tr>
                        </thead>
                        <tbody >
                            <c:forEach items="${li}" var="list">
                                <tr class="text-center">
                                    <td> ${list.suministro.descSum}</td>
                                    <td> ${list.precio}</td> 
                                    <td> ${list.cantidad}</td>
                                    <td> ${list.descuento}</td>
                                    <td> ${list.calcularSubTotal()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
                    
        </c:if>
        <c:if test= "${!sessionScope.autenticado}">
            <c:redirect url="/login.html"/>
        </c:if>
    </body>
</html>

