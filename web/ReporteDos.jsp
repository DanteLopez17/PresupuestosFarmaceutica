<%-- 
    Document   : ReporteDos
    Created on : 11 nov 2021, 19:41:32
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
        <title>Cantidad de Recetas por Profesional</title>
    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
        <%@include file="BarrraNavegacion.html" %>
        
        <c:set var="r" value="${requestScope.repoDos}"></c:set>      
            <section class="container">
                <div class="row my-5">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <h3 class="display-4">Cantidad de Recetas de cada Profesional</h3>
                        <table id="tabla" class="table table-hover table-dark">
                            <thead>
                                <tr class="text-center">
                                    <th scope="col">Profesional</th>
                                    <th scope="col">Cantidad de Recetas</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${r}" var="rep">
                                <tr class="text-center">
                                    <td> ${rep.profesional} </td>
                                    <td> ${rep.cantidadRecetas}</td>
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
