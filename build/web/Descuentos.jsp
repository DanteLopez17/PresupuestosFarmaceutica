<%-- 
    Document   : Descuentos
    Created on : 12 nov 2021, 12:11:50
    Author     : carp_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Descuentos</h1>
        
        <form action="Descuentos" method="POST">
            <table border="1">              
                <tbody>
                    <tr>
                        <td>Obra Social</td>
                        <td>
                            <select name="cboObraSocial">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Suministro</td>
                        <td>
                            <select name="cboSuministro">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Localidad</td>
                        <td>
                            <select name="cboLocalidad">
                                <option></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Tiene Descuento?</td>
                        <td>
                            <input type="checkbox" name="chkDescuento" value="ON" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Cargar" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
