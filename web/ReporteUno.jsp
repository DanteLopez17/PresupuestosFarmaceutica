<%-- 
    Document   : ReporteUno
    Created on : 7 nov 2021, 19:34:20
    Author     : carp_
- Listado de recetas emitidas por un profesional específico.
--%>

<%@page import="Modelo.Profesional"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.ProfesionalControlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="estilos.css"/>
        <title>Recetas Realizadas</title>
    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
            <%@include file="BarrraNavegacion.html" %>
            <c:set var="p" value="${requestScope.comboProfesional}"></c:set>
            <c:set var="r" value="${requestScope.listRecetas}"></c:set>
            <c:set var="pro" value="${requestScope.profXid}"></c:set>

                <section class="container">
                    <h3 class="display-4">Recetas del Profesional:  ${pro.apellidoProf}, ${pro.nombreProf} </h3>, 
                <div class="row my-5">
                    <div class="col-sm-3 col-md-3 col-lg-3">
                        <form action="Reporte" method="GET">
                            <div clas="form-group">
                                <label>Profesional</label>
                                <select name="cboProfesional" class="form-control text-light">
                                    <c:forEach items="${p}" var="pro">
                                        <option value="${pro.idProf}"> ${pro.apellidoProf}, ${pro.nombreProf}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div clas="form-group">
                                <button type="submit" name="btnReporte"  id="btnReporteUno" class="btn btn-primary">Consultar</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-sm-8 col-md-8 col-lg-8">
                        <table id="tablaReceta" class="table table-hover table-dark">
                            <thead>
                                <tr class="text-center">
                                    <th scope="col">Receta</th>
                                    <th scope="col">Fecha</th>
                                    <th scope="col">Cliente</th>
                                    <th scope="col">Forma de Pago</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${r}" var="rec">
                                    <tr class="text-center">
                                        <td> ${rec.receta.idReceta} </td>
                                        <td> ${rec.fecha}</td>
                                        <td> ${rec.cliente.apellido}, ${rec.cliente.nombre} </td>
                                        <td> ${rec.formapago.descripcionFP} </td>
                                        <td> $${rec.total} </td>
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