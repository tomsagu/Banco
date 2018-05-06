<%-- 
    Document   : usuario_DatosPersonales
    Created on : 11-abr-2018, 19:33:51
    Author     : Tomas
--%>

<%@page import="banco.entity.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Personales</title>
    </head>
    <link rel="stylesheet" href="css/FancyTable.css">

    <%
        Usuario user = (Usuario) session.getAttribute("usuario");
    %>  

    <body>
        <ul1>
            <li><a href="Usuario_DatosPersonalesServlet" class="active">Datos Personales</a></li>
            <li><a href="Usuario_MovimientosServlet" class="notActive">Movimientos</a></li>
            <li><a href="Usuario_Transferencias.jsp" class="notActive">Transferencias</a></li>
        </ul1>
        
        <table id ="enunciado">
            <td> <h2>Hola <%=user.getNombre()%> <%=user.getApellidos()%></h2> </td>
            <td id = boton><a href="login.jsp">Salir</a></td>
        </table>

        <ul>
            <table id = "customers">
                <th>Datos Personales</th>
                <th></th>

                <tr>
                    <td><b>Nombre</b></td>
                    <td><%=user.getNombre()%></td>
                </tr>
                <tr>
                    <td><b>Apellidos</b></td>
                    <td><%=user.getApellidos()%></td>
                </tr>
                <tr>
                    <td><b>DNI</b></td>
                    <td><%=user.getDni()%></td>
                </tr>
                <tr>
                    <td><b>Teléfono</b></td>
                    <td><%=user.getTelefono()%></td>
                </tr>
                <tr>
                    <td><b>Email</b></td>
                    <td><%=user.getEmail()%></td>
                </tr>
                <tr>
                    <td><b>Número de cuenta corriente</b></td>
                    <td><%=user.getCuenta()%></td>
                </tr>
                <tr>
                    <td><b>Alta</b></td>
                    <td>
                        <%
                            if (user.getEstado() == 1) {
                        %>

                        <input type="checkbox" name="alta" value="true" disabled checked />
                        <%
                        } else {
                        %>
                        <input type="checkbox" name="alta" value="true" disabled />

                        <%
                            }
                        %>
                    </td>
                </tr>
            </table>
        </ul>
    </body>
</html>
