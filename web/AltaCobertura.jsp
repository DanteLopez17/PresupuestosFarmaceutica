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
        <title>Alta de Cobertura</title>
    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
            <%@include file="BarrraNavegacion.html" %>
            <c:set var="o" value="${requestScope.comboObraSocial}"></c:set>
            <c:set var="s" value="${requestScope.comboSumin}"></c:set>
            <c:set var="l" value="${requestScope.comboLocal}"></c:set>
            <c:set var="c" value="${requestScope.comboDescuentos}"></c:set>

                <section class="container">
                    <div class="row my-5">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <form class="formulario" action="AltaCobertura" method="POST">
                                <h3 class="display-5 text-center">Administrar Coberturas</h3>
                                <div clas="form-group">
                                    <label>Obra Social</label>
                                    <select name="cboObraSocial" class="form-control text-light">
                                    <c:forEach items="${o}" var="os">
                                        <option value="${os.idObraSocial}"> ${os.descripcionOS}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div clas="form-group">
                                <label>Suministro</label>
                                <select name="cboSuministro" class="form-control text-light">
                                    <c:forEach items="${s}" var="sumi">
                                        <option value="${sumi.idSuministro}"> ${sumi.descSum}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div clas="form-group">
                                <label>Localidad</label>
                                <select name="cboLocalidad" class="form-control text-light">
                                    <c:forEach items="${l}" var="loc">
                                        <option value="${loc.idLocalidad}"> ${loc.nombreLoc}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div clas="form-group">
                                <label> % Descuento</label>
                                <select name="cboDescu" class="form-control text-light">
                                <c:forEach items="${c}" var="desc">
                                    <option value="${desc.idDescuento}"> ${desc.porcDesc}% </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div clas="form-group">
                                <button type="submit"  id="btnRegistrarCliente" class="btn btn-primary">Registrar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </c:if>
        <c:if test= "${!sessionScope.autenticado}">
            <c:redirect url="/login.html"/>
        </c:if>
    </body>
</html>

