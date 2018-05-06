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

@WebServlet(name="Empleado_EditarServlet", urlPatterns = {"/Empleado_EditarServlet"})
public class Empleado_EditarServlet extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Usuario usuario;
        String id;
        
        id = request.getParameter("id");
        if (id != null) { // Caso de editar
            usuario = this.usuarioFacade.find(new Integer(id));
            request.setAttribute("usuario", usuario);
        }
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/nuevoEditarUsuario.jsp");
        dispatcher.forward(request, response);
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
