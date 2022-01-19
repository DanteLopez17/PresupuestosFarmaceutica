<%-- 
    Document   : ListadoClientes
    Created on : 3 nov 2021, 9:50:45
    Author     : carp_
--%>

<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.tipoDoc"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.ClienteControlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:useBean id="gestor" class="Controlador.ClienteControlador" scope="page" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="estilos.css"/>
        <title>Listado de Clientes</title>
    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
            <%@include file="BarrraNavegacion.html" %>   
            <c:set var="c" value="${requestScope.clientes}"></c:set>      
                <section class="container">
                    <div class="row my-5">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <h3 class="display-4">Listado de Clientes</h3>
                            <table id="tabla" class="table table-hover table-dark">
                                <thead>
                                    <tr class="text-center">
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Apellido</th>
                                        <th scope="col">Tipo de Documento</th>
                                        <th scope="col">Numero de Documento</th>
                                        <th scope="col">Fecha de Nacimiento</th>
                                        <th scope="col">Ver Detalle</th>
                                        <th scope="col">Quitar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${gestor.listadoClientes}" var="cli">
                                    <tr class="text-center">
                                        <td> ${cli.nombre} </td>
                                        <td> ${cli.apellido}</td>
                                        <td> ${cli.tipoDocumento.descripcion} </td>
                                        <td> ${cli.numDocumento} </td>
                                        <td> ${cli.fechaNacimiento} </td>
                                        <td><a href="ModificarCliente?idCliente=${cli.idCliente}">Modificar</a></td>
                                        <td><a href="BajaCliente?idCliente=${cli.idCliente}">Eliminar</a></td>
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
