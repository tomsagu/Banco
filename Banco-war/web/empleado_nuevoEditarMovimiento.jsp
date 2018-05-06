<%-- 
    Document   : empleado_nuevoEditarMovimiento
    Created on : 11-abr-2018, 19:43:01
    Author     : JorgeL
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="banco.entity.Usuario"%>
<%@page import="banco.entity.Movimiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Movimiento movimiento;
    Usuario usuarioelegido, empleado;
    String unombre, uapellidos, idu;
    String tipodemovimiento, fecha, entidad, concepto, cantidad, empleadosupervisor, usuario, id, idempleado, fechaAMD;
    Date date;
    int years, months, days;
    movimiento = (Movimiento) request.getAttribute("movimiento");
    usuarioelegido = (Usuario) request.getAttribute("ue");
    empleado = (Usuario) session.getAttribute("usuario");
    if (movimiento != null) { // Editar usuario
        id = movimiento.getIdMovimiento().toString();
        tipodemovimiento = movimiento.getTipo();
        //fecha = movimiento.getFecha().toString();
        entidad = movimiento.getEntidad();
        concepto = movimiento.getConcepto();

        date = movimiento.getFecha();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        years = cal.get(Calendar.YEAR);
        months = cal.get(Calendar.MONTH);
        days = cal.get(Calendar.DAY_OF_MONTH);

        cantidad = movimiento.getCantidad().toString();
        usuario = movimiento.getUsuarioidUsuario().toString();
        empleadosupervisor = movimiento.getUsuarioidUsuario1().toString();
    } else { // Crear usuario
        id = "";
        tipodemovimiento = "";
        fecha = "";
        entidad = "";
        concepto = "";
        cantidad = "";
        usuario = "";
        empleadosupervisor = "";
        years = -1;
        days = -1;
        months = -1;
    }
    if (usuarioelegido != null) {
        unombre = usuarioelegido.getNombre();
        uapellidos = usuarioelegido.getApellidos();
        idu = usuarioelegido.getIdUsuario().toString();
    } else {
        unombre = "es null pringado";
        uapellidos = "";
        idu = "";
    }
    idempleado = empleado.getIdUsuario().toString();
%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/FancyTable.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar/Editar Movimiento</title>
    </head>
    <body>
        <ul>
        <h1>Insertar nuevo movimiento a <%= unombre%> <%= uapellidos%></h1>
        <form name="edit" action="Empleado_CrearActualizarMovimientoServlet" method="post">
            <input type="hidden" name="idmovimiento" value="<%= id%>" />
            <table id="customers" border="1">
                <tbody>
                    <tr>
                        <td><b>Concepto:</b></td>
                        <td><input type="text" name="concepto" max="50" maxlength="50" value="<%= concepto%>"/></td>		
                    </tr><tr>		
                        <td><b>Fecha(yyyy-MM-dd):</b></td>	
                        <%
                            if (years != -1) {

                        %>   

                        <td><input type="text" name="fecha" max="50" maxlength="50" value="<%= years%>-<%=months%>-<%=days%>"/></td>
                            <% } else {
                            %>
                        <td><input type="text" name="fecha" max="50" maxlength="50" value=""/></td>
                            <%}%>
                    </tr><tr>
                        <td><b>Cantidad:</b></td>
                        <td><input type="text" name="cantidad" max="50" maxlength="50" value="<%= cantidad%>"/></td>
                    </tr><tr>
                        <td><b>Tipo de Movimiento('ingreso','debito','transferencia'):</b></td>
                        <td>
                            <%
                                if (tipodemovimiento.equalsIgnoreCase("ingreso")) {
                            %>
                            <input type="radio" name="tipodemovimiento" value="ingreso" checked>Ingreso
                            <input type="radio" name="tipodemovimiento" value="debito" >Debito
                            <input type="radio" name="tipodemovimiento" value="transferencia" >Transferencia</td>
                            <%
                            } else if (tipodemovimiento.equalsIgnoreCase("debito")) {
                            %>
                <input type="radio" name="tipodemovimiento" value="ingreso">Ingreso
                <input type="radio" name="tipodemovimiento" value="debito" checked>Debito
                <input type="radio" name="tipodemovimiento" value="transferencia" >Transferencia</td>
                <%
                } else if (tipodemovimiento.equalsIgnoreCase("transferencia")) {
                %>
                <input type="radio" name="tipodemovimiento" value="ingreso">Ingreso
                <input type="radio" name="tipodemovimiento" value="debito">Debito
                <input type="radio" name="tipodemovimiento" value="transferencia" checked>Transferencia</td>
                <%
                } else {
                %>   
                <input type="radio" name="tipodemovimiento" value="ingreso">Ingreso
                <input type="radio" name="tipodemovimiento" value="debito">Debito
                <input type="radio" name="tipodemovimiento" value="transferencia">Transferencia</td>
                <% }%>
            </tr><tr>   
            <td><b>Entidad(en caso de transferencia escribir DNI):</b></td>
            <td><input type="text" name="entidad" max="50" maxlength="50" value="<%= entidad%>"/></td>
        </tr><tr>   
            <td><b>Usuario Receptor(id):</b></td>
            <td><input type="text" name="usuario" max="50" maxlength="50" value="<%= idu%>" disabled="disabled"/></td>
            <td hidden><input type="text" name="usuario" max="50" maxlength="50" value="<%= idu%>"/></td> 
        </tr><tr>  
            <td><b>Empleado Supervisor(id):</b></td>
            <td><input type="text" name="empleadosupervisor" max="50" maxlength="50" value="<%= idempleado%>" disabled="disabled"/></td>
            <td hidden><input type="text" name="empleadosupervisor" max="50" maxlength="50" value="<%= idempleado%>" /></td>
        </tr><tr>    
            <td><input type="submit" name="btnSave" value="Insertar Nuevo Movimiento"/></td>
            <td><a href="Empleado_MovimientosServlet?id=<%= idu%>">Cancelar</a></td>
        </tr>
        </tbody>
    </table>
</form>
        </ul>
</body>
</html>
