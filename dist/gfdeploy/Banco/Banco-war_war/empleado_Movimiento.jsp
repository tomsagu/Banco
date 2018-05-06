<%-- 
    Document   : empleado_Movimiento
    Created on : 19-abr-2018, 20:00:18
    Author     : beaco
--%>

<%@page import="banco.entity.Usuario"%>
<%@page import="banco.entity.Movimiento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Movimiento> lista = (List) request.getAttribute("lista");
    Usuario usuario = (Usuario) request.getAttribute("usuarioElegido");
%> 
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/FancyTable.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Movimientos</title>
    </head>
    <body>
    <ul1>
        <li><a href="Empleado_UsuarioServlet" class="notActive">Usuarios</a></li>
    </ul1><br></br><ul>
    <h1>Lista de Movimientos de <%=usuario.getNombre()%>&nbsp<%=usuario.getApellidos()%></h1>
    <table id="customers"> 
        <th>Nombre</th>
        <th>Apellidos</th>
        <th>DNI</th>
        <th>Concepto</th>
        <th>Cantidad</th>
        <th>Tipo de Movimiento</th>
        <th>Entidad</th>
        <th>Empleado Supervisor</th>
        <th>Editar Movimiento</th>

        <%
            for (Movimiento movimiento : lista) {
        %>   
        <tr>
            <%if (usuario.getIdUsuario() == movimiento.getUsuarioidUsuario().getIdUsuario()) {
            %>
            <td>
                <%= movimiento.getUsuarioidUsuario().getNombre()%>
            </td>
            <td>
                <%= movimiento.getUsuarioidUsuario().getApellidos()%>
            </td>
            <td>
                <%= movimiento.getUsuarioidUsuario().getDni()%>
            </td>
            <td>
                <%= movimiento.getConcepto() %>
            </td>
            <td>
                <%= movimiento.getCantidad() %>
            </td>
            <td>
                <%= movimiento.getTipo()%>
            </td>
            <td>
                <%= movimiento.getEntidad()%>
            </td>
            <td>
                <%= movimiento.getUsuarioidUsuario1().getDni()%>


            <td><a class="button1" href="Empleado_EditarMovimientoServlet?iduser=<%= movimiento.getUsuarioidUsuario().getIdUsuario()%>&idmovimiento=<%= movimiento.getIdMovimiento()%>" >Editar</a></td>
            <%}
            %>
        </tr>
        <%
            }
        %>    
    </table>
        <a id ="font" class="button" href="Empleado_EditarMovimientoServlet?iduser=<%= usuario.getIdUsuario() %>">Insertar nuevo Movimento para el usuario con dni <%=usuario.getDni()%></a></ul>
</body>
</html>
