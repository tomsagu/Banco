<%-- 
    Document   : ErrorNullUsuario
    Created on : 03-may-2018, 18:23:47
    Author     : alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String error = (String)request.getAttribute("error");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
        <h2><%= error %></h2>
        <button onclick="goBack()">Atras</button>

<script>
function goBack() {
    window.history.back();
}
</script>
    </body>
</html>
