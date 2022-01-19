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
        <title>Listado de Profesionales</title>
    </head>
    <body class="cuerpo">
        <c:if test= "${sessionScope.autenticado}">
        <%@include file="BarrraNavegacion.html" %>
        <c:set var="p" value="${requestScope.profesionales}"></c:set>  


            <section class="container">
                <div class="row my-5">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <h3 class="display-4 ">Listado de Profesionales</h3>
                        <table id="tabla" class="table table-hover table-dark">
                            <thead>
                                <tr class="text-center">
                                    <th scope="col">Id</th>
                                    <th scope="col">Nombre Completo</th>
                                    <th scope="col">Nro Matricula</th>
                                    <th scope="col">Fecha Nacimiento</th>
                                    <th scope="col">Tipo de Documento</th>
                                    <th scope="col">Numero de Documento</th>
                                    <th scope="col">Especialidad</th>
                                    <th scope="col">Editar</th>
                                    <th scope="col">Quitar</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${p}" var="prof">
                                <tr class="text-center">
                                    <td> ${prof.idProf} </td>
                                    <td> ${prof.apellidoProf}, ${prof.nombreProf} </td>
                                    <td> ${prof.nroMatriculaProf} </td>
                                    <td> ${prof.fecNacProf} </td>
                                    <td> ${prof.tipDocProf.descripcion} </td>
                                    <td> ${prof.numDocProf} </td>
                                    <td> ${prof.espeProf.descripcion} </td>
                                    <td><a href="ModificarProfesional?idProfesional=${prof.idProf}">Modificar</a></td>
                                    <td><a href="BajaProfesional?idProfesional=${prof.idProf}">Eliminar</a></td>
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
