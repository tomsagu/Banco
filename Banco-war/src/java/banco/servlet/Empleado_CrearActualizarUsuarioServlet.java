package banco.servlet;

import banco.ejb.UsuarioFacade;
import banco.entity.Usuario;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author alex
 */

@WebServlet(name = "Empleado_CrearActualizarUsuarioServlet", urlPatterns = {"/Empleado_CrearActualizarUsuarioServlet"})
public class Empleado_CrearActualizarUsuarioServlet extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre, apellidos, dni, email, id, contrasena, domicilio, telefonoStr, numerocuentaStr;
        Integer telefono, numerocuenta;
        String error;
        Short alta;
        Short value = 0;
        Usuario usuario;
        
        nombre = request.getParameter("nombre");
        apellidos = request.getParameter("apellidos");
        dni = request.getParameter("dni");
        contrasena = request.getParameter("contrasena");
        telefonoStr = request.getParameter("telefono");
        email = request.getParameter("email");
        numerocuentaStr = request.getParameter("numerocuenta");
        domicilio = request.getParameter("domicilio");
        id = request.getParameter("id");
        
        Usuario user = this.usuarioFacade.findByDni(dni);
        
        if (("".equals(nombre)) || "".equals(apellidos) || "".equals(dni) ||
            "".equals(contrasena) || "".equals(telefonoStr) || "".equals(email)  ||
            "".equals(numerocuentaStr) || "".equals(domicilio)) {
            
            error = "Usuario con datos incorrectos o vacios";
            request.setAttribute("error", error);
            RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/ErrorUsuario.jsp");
            rd.forward(request, response);
        } else if (user != null && user.getIdUsuario() != Integer.parseInt(id)) {
            error = "Usuario con DNI repetido";
            request.setAttribute("error", error);
            RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/ErrorUsuario.jsp");
            rd.forward(request, response);
        } else {
            try {
                telefono = Integer.parseInt(telefonoStr);
                numerocuenta = Integer.parseInt(numerocuentaStr);
                
                if(request.getParameter("alta")!=null){
                    alta = Short.parseShort(request.getParameter("alta"));
                }else{
                    alta = 0;
                }

                if ("".equals(id)) { // Crear
                    usuario = new Usuario();
                    usuario.setSaldo(0.0);
                    usuario.setEmpleado(value);
                } else { // Editar
                    usuario = this.usuarioFacade.find(new Integer(id));
                }

                if(nombre!=null){
                    usuario.setNombre(nombre);
                }
                if(apellidos != null){
                    usuario.setApellidos(apellidos);
                }
                if(dni != null){
                    usuario.setDni(dni);
                }
                if(contrasena != null){
                    usuario.setContrasena(contrasena);
                }
                if(email != null){
                    usuario.setEmail(email);
                }
                if(telefono != null){
                    usuario.setTelefono(telefono);
                }
                if(numerocuenta != null){
                    usuario.setCuenta(numerocuenta);
                }

                usuario.setEstado(alta);

                if(domicilio != null){
                    usuario.setDomicilio(domicilio);
                }

                if ("".equals(id)) {                  
                    this.usuarioFacade.create(usuario);
                } else {
                    this.usuarioFacade.edit(usuario);
                }

                RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/Empleado_UsuarioServlet");
                rd.forward(request, response);
                
                }catch (NumberFormatException e) {
                    
                    error = "Usuario con datos incorrectos o vacios";
                    request.setAttribute("error", error);
                    RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/ErrorUsuario.jsp");
                    rd.forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
