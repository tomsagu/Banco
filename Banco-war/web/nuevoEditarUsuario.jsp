<%-- 
    Document   : empleado_InsertarUsuario.jsp
    Created on : 11-abr-2018, 21:21:09
    Author     : alex
--%>

<%@page import="banco.entity.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario usuario;
    String nombre, apellidos, dni, telefono, email, numerocuenta, id, contrasena, domicilio;
    Short alta;

    usuario = (Usuario) request.getAttribute("usuario");
    if (usuario != null) { // Editar usuario
        id = usuario.getIdUsuario().toString();
        nombre = usuario.getNombre();
        apellidos = usuario.getApellidos();
        dni = usuario.getDni();
        contrasena = usuario.getContrasena();
        telefono = usuario.getTelefono().toString();
        email = usuario.getEmail();
        domicilio = usuario.getDomicilio();
        numerocuenta = usuario.getCuenta().toString();
        alta = usuario.getEstado();
    } else { // Crear usuario
        id = "";
        nombre = "";
        apellidos = "";
        dni = "";
        contrasena = "";
        telefono = "";
        email = "";
        domicilio = "";
        numerocuenta = "";
        alta = 0;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/FancyTable.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar/Editar Usuario</title>
    </head>
    <body>
        <ul>
        <%
            if (usuario == null) {
        %>
        <h2>Inserte un nuevo usuario</h2>
        <%
        } else {
        %>
        <h2>Editando a <%= nombre%> <%= apellidos%></h2>
        <%
            }
        %>
        <form name="edit" action="Empleado_CrearActualizarUsuarioServlet" method="post">
            <input type="hidden" name="id" value="<%= id%>" />
            <table id="customers" border="1">
                <tr>
                    <td><b>Nombre:</b></td>
                    <td><input type="text" name="nombre" max="50" maxlength="50" value="<%= nombre%>"/></td>
                </tr><tr>
                    <td><b>Apellidos:</b></td>
                    <td><input type="text" name="apellidos" max="50" maxlength="50" value="<%= apellidos%>"/></td>
                </tr><tr>
                    <td><b>DNI:</b></td>
                    <td><input type="text" name="dni" max="50" maxlength="50" value="<%= dni%>"/></td>
                </tr><tr>
                    <td><b>Contraseña:</b></td>
                    <td><input type="text" name="contrasena" max="50" maxlength="50" value="<%= contrasena%>"/></td>
                </tr><tr>
                    <td><b>Telefono:</b></td>
                    <td><input type="text" name="telefono" value="<%= telefono%>"/></td>
                </tr><tr>
                    <td><b>Email:</b></td>
                    <td><input type="text" name="email" max="50" maxlength="50" value="<%= email%>"/></td>
                </tr><tr>
                    <td><b>Domicilio:</b></td>
                    <td><input type="text" name="domicilio" max="50" maxlength="50" value="<%= domicilio%>"/></td>
                </tr><tr>
                    <td><b>Numero de cuenta:</b></td>
                    <td><input type="text" name="numerocuenta" value="<%= numerocuenta%>"/></td>
                </tr><tr>
                    <td><b>Alta:</b></td>
                    <%
                        if (alta == 0) {
                    %>
                    <td><input type="checkbox" name="alta" value="1" /></td>
                        <%
                        } else {
                        %>
                    <td><input type="checkbox" name="alta" value="1" checked /></td>
                        <%
                            }
                        %>
                </tr><tr>
                    <%
                        if (usuario == null) {
                    %>
                    <td><input type="submit" name="btnSave" value="Insertar Nuevo Usuario"/></td>
                        <%
                        } else {
                        %>
                    <td><input type="submit" name="btnSave" value="Editar Usuario"/></td>
                        <%
                            }
                        %>
                    <td><a href="Empleado_UsuarioServlet">Cancelar</a></td>
                </tr>
            </table>
        </form>
        </ul>
    </body>
</html>
