<%-- 
    Document   : ConfirmacionAltaCliente
    Created on : 9 dic 2021, 22:04:17
    Author     : carp_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean class="Modelo.tipoDoc" id="nuevotipoDoc">
    <jsp:setProperty name="nuevotipoDoc" property="idTipoDoc"/>
    <jsp:setProperty name="nuevotipoDoc" property="descripcion"/>
</jsp:useBean>

<jsp:useBean class="Modelo.Cliente" id="nuevoCliente" scope="session">
    <jsp:setProperty name="nuevoCliente" property="nombre"/>
    <jsp:setProperty name="nuevoCliente" property="apellido"/>
    <jsp:setProperty name="nuevoCliente" property="fechaNacimiento"/>
    <jsp:setProperty name="nuevoCliente" property="numDocumento"/>
    <jsp:setProperty name="nuevoCliente" property="tipoDocumento" value="${nuevotipoDoc}"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="estilos.css"/>
        <title>JSP Page</title>
    </head>
    <body class="cuerpo">
        <section class="container">
            <h1>Confirmación de alta cliente</h1>

            <h2>¿Esta seguro de agregar un nuevo cliente ${nuevoCliente.apellido}, ${nuevoCliente.nombre}?</h2>
            <a class="btn btn-primary" href="/Farmaceutica/AltaCliente">Confirmar</a>
        </section>


    </body>
</html>
