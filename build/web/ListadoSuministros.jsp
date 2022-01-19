<%-- 
    Document   : ListadoSuministros
    Created on : 5 nov 2021, 2:45:56
    Author     : carp_
--%>

<%@page import="Modelo.Suministro"%>
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
        <title>Listado de Suministros</title>
    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
        <%@include file="BarrraNavegacion.html" %>
        <c:set var="s" value="${requestScope.suministros}"></c:set> 
            <section class="container">
                <div class="row my-5">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <h3 class="display-4 ">Listado de Suministros</h3>
                        <table id="tabla" class="table table-hover table-dark">
                            <thead>
                                <tr class="text-center">
                                    <th scope="col">Id</th>
                                    <th scope="col">Descripcion</th>
                                    <th scope="col">Precio</th>
                                    <th scope="col">Clasificación</th>
                                    <th scope="col">Tipo</th>
                                    <th scope="col">Ver Detalle</th>
                                    <th scope="col">Quitar</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${s}" var="sumi">
                                <tr class="text-center">
                                    <td>${sumi.idSuministro}</td>
                                    <td>${sumi.descSum}</td>
                                    <td>${sumi.precSum}</td>
                                    <td>${sumi.clasifSum.descripcionClasif}</td>
                                    <td>${sumi.tipoSum.descripcionSum}</td>
                                    <td><a href="ModificarSuministro?idSuministro=${sumi.idSuministro}">Modificar</a></td>
                                    <td><a href="BajaSuministro?idSuministro=${sumi.idSuministro}">Eliminar</a></td>
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
