<%-- 
    Document   : empleado_Usuario
    Created on : 11-abr-2018, 19:27:53
    Author     : beaco
--%>

<%@page import="java.util.List"%>
<%@page import="banco.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Usuario> lista = (List) request.getAttribute("lista");

    Usuario user = (Usuario) session.getAttribute("usuario");

%> 
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="css/FancyTable.css">
    <table id ="enunciado">
        <td> <h2>Hola <%=user.getNombre()%> <%=user.getApellidos()%></h2> </td>
        <td id = boton><a href="login.jsp">Salir</a></td>
    </table>
</head>
<body>
<ul1>
    <li><a href="Empleado_UsuarioServlet" class="active">Usuarios</a></li>
</ul1>
<ul id="enunciado">
    <h3>Lista Usuarios</h3>
</ul>
<ul>
    <table id = "customers"> 
        <th>Nombre</th>
        <th>Apellidos</th>
        <th>DNI</th>
        <th>Saldo</th>
        <th>Teléfono</th>
        <th>Email</th>
        <th>Número de Cuenta</th>
        <th>Alta</th>
        <th>Editar Usuario</th>
        <th>Movimientos</th>

        <%
            for (Usuario usuario : lista) {
                if (usuario.getEmpleado() == 0) {
        %>   
        <tr>
            <td>
                <%= usuario.getNombre()%>
            </td>
            <td>
                <%= usuario.getApellidos()%>
            </td>
            <td>
                <%= usuario.getDni()%>
            </td>
            <td>
                <%= usuario.getSaldo()%>
            </td>
            <td>
                <%= usuario.getTelefono()%>
            </td>
            <td>
                <%= usuario.getEmail()%>
            </td>
            <td>
                <%= usuario.getCuenta()%>
            </td>
            <%
                if (usuario.getEstado() == 1) {
            %>
            <td><input type="checkbox" name="alta" value="true" disabled checked /></td>
                <%
                } else {
                %>
            <td><input type="checkbox" name="alta" value="true" disabled /></td> 

            <%
                }
            %>

            <td align="center"><a class="button1" href="Empleado_EditarServlet?id=<%= usuario.getIdUsuario()%>" >Editar</a></td>
            <td align="center"><a class="button1" href="Empleado_MovimientosServlet?id=<%= usuario.getIdUsuario()%>" >Movimientos</a></td>
        </tr>
        <%       }
            }
        %>    
    </table>

    <br><a id ="font" class="button" href="Empleado_EditarServlet">Insertar nuevo Usuario</a>
</ul>
</body>
</html>

