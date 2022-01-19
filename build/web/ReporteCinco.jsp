<%-- 
    Document   : ReporteCinco
    Created on : 13 nov 2021, 20:09:17
    Author     : carp_
--%>

<%-- 
    Document   : ReporteCuatro
    Created on : 12 nov 2021, 0:40:00
    Author     : carp_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="estilos.css"/>
        <title>Recetas por Sucursal</title>
    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
            <%@include file="BarrraNavegacion.html" %>

            <c:set var="r" value="${requestScope.repoCinco}"></c:set>     
                <section class="container">
                    <div class="row my-5">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <h3 class="display-4 ">Recetas por Sucursal</h3>
                            <table id="tabla" class="table table-hover table-dark">
                                <thead>
                                    <tr class="text-center">
                                        <th scope="col">Sucursal</th>
                                        <th scope="col">Cantidad de Recetas</th>
                                        <th scope="col">a Pagar por los Cliente</th>
                                        <th scope="col">a Pagar por las Obras Sociales</th>
                                    </tr>
                                </thead>
                                <tbody >
                                <c:forEach items="${r}" var="rep">
                                    <tr class="text-center">

                                        <td> ${rep.sucursal.loc.nombreLoc} - ${rep.sucursal.nroSucursal} </td>
                                        <td> ${rep.canti}</td>
                                        <td> $${rep.totCliente} </td> 
                                        <td> $${rep.totObrSoc}</td>
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

