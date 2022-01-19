<%-- 
    Document   : ListadoReceta
    Created on : 9 nov 2021, 10:24:31
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
        <title>Listado De recetas</title>
    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
        <%@include file="BarrraNavegacion.html" %>
        <c:set var="lc" value="${requestScope.listaRecetas}"></c:set> 
            <section class="container">
                <div class="row my-5">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <h3 class="display-4 ">Listado de Recetas</h3>
                        <table id="tabla" class="table table-hover table-dark">
                            <thead>
                                <tr class="text-center">
                                    <th scope="col">Nro Receta</th>
                                    <th scope="col">Fecha</th>
                                    <th scope="col">Cliente</th>
                                    <th scope="col">Profesioanl</th>
                                    <th scope="col">Obra Social</th>
                                    <th scope="col">Forma de Pago</th>
                                    <th scope="col">Ver Detalle</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${lc}" var="list">
                                <tr class="text-center">
                                    <td>${list.idReceta}</td>
                                    <td>${list.fecha}</td>
                                    <td>${list.cliente.apellido}, ${list.cliente.nombre}</td>
                                    <td>${list.profesional.apellidoProf}, ${list.profesional.nombreProf}</td>
                                    <td>${list.obrasocial.descripcionOS}</td>
                                    <td>${list.formapago.descripcionFP}</td>
                                    <td><a href="DetalleReceta?idReceta=${list.idReceta}">Ver</a></td>
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
