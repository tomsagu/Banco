<%--
    Document   : Usuario_Tansferencias
    Created on : Apr 12, 2018, 12:04:20 PM
    Author     : Alex
--%>
<%@page import="banco.entity.Usuario"%>
<%@page import="banco.entity.Movimiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
%>

<html>
    <head>
            <link rel="stylesheet" href="css/FancyTable.css">

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Transferencia</title>
    </head>
    <body>
    <ul1>
        <li><a href="Usuario_DatosPersonalesServlet" class="notActive">Datos Personales</a></li>
        <li><a href="Usuario_MovimientosServlet" class="notActive">Movimientos</a></li>
        <li><a href="Usuario_Transferencias.jsp" class="active">Transferencias</a></li>
    </ul1>
    <ul>
    <div class="row">
        <div class="col-sm-4">Hola <%=usuario.getNombre()%> <%=usuario.getApellidos()%></div>
        <div class="col-sm-4"></div>
        <div class="col-sm-4"></div>
        <div class="col-sm-4"><a href="login.jsp">Salir</a></div>
    </div>
    <div class="row">
        <h1><b>Transferencia Bancaria</b></h1>
    </div>

    <form class="form-horizontal" action="Usuario_TransferenciaServlet">
        <div class="form-group">
            <label class="control-label col-sm-2" for="text">Beneficiario (DNI):</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="Beneficiario" placeholder="Introduce Beneficiario">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="Concepto">Concepto:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="Concepto" placeholder="Introduce Concepto">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="Concepto">Importe:</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" name="Importe" placeholder="Introduce Importe">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Ingresar</button>
            </div>
        </div>
    </form>
    </ul>



</body>
</html>
