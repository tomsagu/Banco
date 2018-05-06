<%-- 
    Document   : login
    Created on : 12-abr-2018, 8:49:57
    Author     : Tomas
--%>
<html>
    <!-- Bootstrap CSS -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link rel="stylesheet" href="css/FancyTable.css">
    <link href="signin.css" rel="stylesheet">
    <meta name="viewport" content="height=device-height, content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <head>

        <%
            if (request.getParameterNames().hasMoreElements() && request.getParameter("error").equals("error")) {
        %>
        }
        <script language='javascript'>alert('Usuario o Contraseña incorrecta');</script>
        <%
            }
        %>



        <title>Inicio de Sesión</title>
        <meta charset="UTF-8">
    </head>
    <body class="bg-light">
        <div id="login"> 
            <form class="form-signin" method="post" action="LoginServlet" name="datos" accept-charset="UTF-8">
                <center> <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"></center>   

                <center> <h1>Inicio de Sesión</h1></center>   

                <input type="text" name="dni" class="form-control" placeholder="DNI" required autofocus>

                <br> <input type="password" name="password" class="form-control" placeholder="Contraseña" required>

                <br> <button class="btn btn-lg btn-primary btn-block" type="submit">Enviar</button>  

                <p class="mt-5 mb-3 text-muted text-center text-black"><b>&copy; 2018</b></p>  
        </div>
    </form>
</body>
</html>
