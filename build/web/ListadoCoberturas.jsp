<%-- 
    Document   : ListadoProfesionales
    Created on : 4 nov 2021, 1:36:07
    Author     : carp_
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
        <title>Suministro con Descuentos</title>
    </head>
    <body class="cuerpo">
         <c:if test= "${sessionScope.autenticado}">
        <%@include file="BarrraNavegacion.html" %>
        <c:set var="c" value="${requestScope.coberturas}"></c:set>  
            <section class="container">
                <div class="row my-5">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <h3 class="display-4 ">Suministros con Descuentos</h3>
                        <table id="tabla" class="table table-hover table-dark">
                            <thead>
                                <tr class="text-center">
                                    <th scope="col">Obra Social</th>
                                    <th scope="col">Suministro</th>
                                    <th scope="col">Localidad</th>
                                    <th scope="col">% Descuento</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${c}" var="cob">
                                <tr class="text-center">
                                    <td> ${cob.obrasocial.descripcionOS} </td>
                                    <td> ${cob.suministro.descSum} </td>
                                    <td> ${cob.localidad.nombreLoc} </td>
                                    <td> ${cob.descu.porcDesc}% </td>
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
