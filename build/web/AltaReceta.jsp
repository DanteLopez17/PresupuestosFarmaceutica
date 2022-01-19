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
<%@page import="Modelo.Profesional"%>
<%@page import="Controlador.ProfesionalControlador"%>
<%@page import="Modelo.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.ClienteControlador"%>
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

        <c:set var="c" value="${requestScope.comboClientes}"></c:set>
        <c:set var="p" value="${requestScope.comboProfesional}"></c:set> 
        <c:set var="s" value="${requestScope.comboSucursal}"></c:set>
        <c:set var="os" value="${requestScope.comboObraSocial}"></c:set> 
        <c:set var="fp" value="${requestScope.comboFormaPago}"></c:set> 
        <c:set var="su" value="${requestScope.comboSumin}"></c:set> 
        <c:set var="dr" value="${requestScope.ListaDetalleReceta}"></c:set> 

            <section id="altaRe" class="container">
                <div class="row my-5">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <form action="AltaReceta" method="POST">
                            <h3 class="display-5 text-center">Datos de la Receta</h3>
                            <div class="row my-5">
                                <div class="col-sm-4 col-md-4 col-lg-4">
                                    <div clas="form-group">
                                        <label>Fecha</label>
                                        <input type="date" id="fechaSis" class="form-control text-light" name="txtFechaReceta" value="" />
                                    </div>
                                    <div>
                                        <div clas="form-group">
                                            <label>Cliente</label>
                                            <select name="cboCliente" class="form-control text-light">
                                            <c:forEach items="${c}" var="cli">
                                                <option value="${cli.idCliente}"> ${cli.apellido}, ${cli.nombre}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div>
                                    <div clas="form-group">
                                        <label>Profesional</label>
                                        <select name="cboProfesional" class="form-control text-light">
                                            <c:forEach items="${p}" var="pro">
                                                <option value="${pro.idProf}"> ${pro.apellidoProf}, ${pro.nombreProf}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <div clas="form-group">
                                    <label>Sucursal</label>
                                    <select name="cboSucursal" class="form-control text-light">
                                        <c:forEach items="${s}" var="suc">
                                            <option value="${suc.nroSucursal}"> ${suc.loc.nombreLoc} - Suc: ${suc.nroSucursal}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div clas="form-group">
                                    <label>Obra Social</label>
                                    <select name="cboObraSocial" class="form-control text-light">
                                        <c:forEach items="${os}" var="obs">
                                            <option value="${obs.idObraSocial}"> ${obs.descripcionOS}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div clas="form-group" hidden>
                                    <label>Forma de Pago</label>
                                    <select name="cboFormaPago" class="form-control text-light">
                                        <c:forEach items="${fp}" var="frp">
                                            <option value="${frp.idFormaPago}"> ${frp.descripcionFP}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <div clas="form-group">
                                    <button type="submit"  id="btnConfirmarTransaccion" class="btn btn-dark">Confirmar</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
$( document ).ready(function() {

    var now = new Date();

    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);

    var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
    $("#fechaSis").val(today);
});
</script>
</c:if>
<c:if test= "${!sessionScope.autenticado}">
                <c:redirect url="/login.html"/>
            </c:if>
    </body>
</html>
