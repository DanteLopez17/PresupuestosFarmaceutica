<%-- 
    Document   : inicio
    Created on : 7 nov 2021, 2:49:10
    Author     : carp_
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" >

        <link rel="stylesheet" href="estilos.css"/>
        <title>Inicio</title>
    </head>
    <body class="cuerpo">
    <c:if test= "${sessionScope.autenticado}">
        <%@include file="BarrraNavegacion.html" %>
        <div class="mensaje">
            <div clss="row text-center" >
            <div class="col-12"><label> Bienvenido!!!  </label></div>
        </div>
        <div clss="row text-center">
            <div class="col-12"><label> ${sessionScope.usuario}  </label></div>
        </div>
        </div>
        
    </c:if>
            <c:if test= "${!sessionScope.autenticado}">
                <c:redirect url="/login.html"/>
            </c:if>
        
    </body>
</html>
