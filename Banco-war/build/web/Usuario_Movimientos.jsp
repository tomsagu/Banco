<%-- 
    Document   : Usuario_Transferencia
    Created on : Apr 11, 2018, 7:00:17 PM
    Author     : Alex
--%>

<%@page import="java.util.List"%>
<%@page import="banco.entity.Usuario"%>
<%@page import="banco.entity.Movimiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Movimiento> listaMovimientos;
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    %>
<html>
    <head>
            <link rel="stylesheet" href="css/FancyTable.css">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <ul1>
        <li><a href="Usuario_DatosPersonalesServlet" class="notActive">Datos Personales</a></li>
        <li><a href="Usuario_MovimientosServlet" class="active">Movimientos</a></li>
        <li><a href="Usuario_Transferencias.jsp" class="notActive">Transferencias</a></li>
    </ul1>
        <title>Usuario Movimientos</title>
    <br>
        <table style="width:100%">
            <tr style="height: 5px">
                <td>Hola <%=usuario.getNombre()%> <%=usuario.getApellidos()%></td> 
                <td><b>Saldo </b> <%= usuario.getSaldo() %> </td><%-- Falta coger saldo de servlet--%>
                <td><a href="login.jsp">Salir</a></td>
            </tr>
        </table>
    <br>
    </head>
        <%
        listaMovimientos = (List)request.getAttribute("listaMovimientos");
    %>
    <body>
        <ul>
        <table  id="customers" border="1" style="width:100%">
            <thead>
                <tr>
                    <th><b>Fecha</b></th>
                    <th><b>Entidad</b></th>
                    <th><b>Concepto</b></th>
                    <th><b>Importe</b></th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Movimiento mov : listaMovimientos) {
                %>
                <tr>
                    <td><%= mov.getFecha()    %></td>
                    <td><%= mov.getEntidad()  %></td>
                    <td><%= mov.getConcepto() %></td>
                    <td><%= mov.getCantidad() %></td>
                </tr>
                <% 
                    }  %>
            </tbody>
        </table>
        </ul>
    </body>
</html>