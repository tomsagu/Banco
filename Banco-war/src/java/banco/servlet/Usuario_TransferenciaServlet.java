/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banco.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import javax.ejb.EJB;
import banco.entity.Movimiento;
import banco.ejb.MovimientoFacade;
import banco.ejb.UsuarioFacade;
import banco.entity.Usuario;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author Alex
 */
@WebServlet(name = "Usuario_TransferenciaServlet", urlPatterns = {"/Usuario_TransferenciaServlet"})
public class Usuario_TransferenciaServlet extends HttpServlet {
            
        @EJB
        private MovimientoFacade movimientoFacade;
        
        @EJB
        private UsuarioFacade usuarioFacade;
        
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        Usuario usuario; 
        usuario = (Usuario)session.getAttribute("usuario"); // cogemos al usuario
        
        String beneficiario, concepto, error;
        double importe;
        
        importe = Double.parseDouble(request.getParameter("Importe"));
        beneficiario = request.getParameter("Beneficiario");
        concepto = request.getParameter("Concepto");
        
        
        Usuario ben = this.usuarioFacade.findByDni(beneficiario);
        
        
        if(beneficiario.equals(usuario.getDni())) { // si lo manda a si mismo
            if(importe > usuario.getSaldo()){
                //saltar error
                
                RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/ErrorUsuario.jsp");
                rd.forward(request, response);
            } else {
            RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/Usuario_Transferencias.jsp");
            rd.forward(request, response);
            }
        } else {
            
            if(importe > usuario.getSaldo()){ // no puede enviar mas dinero de lo que tiene
                
                RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/Usuario_Transferencias.jsp");
                rd.forward(request, response);  
                
            } else {
                
            // añadir importe al beneficiario
            Movimiento nuevoMovimiento = new Movimiento();
            nuevoMovimiento.setCantidad(importe);
            nuevoMovimiento.setConcepto(concepto);
            nuevoMovimiento.setUsuarioidUsuario(usuario);
            nuevoMovimiento.setUsuarioidUsuario1(usuario);
            nuevoMovimiento.setFecha(new Date());
            nuevoMovimiento.setTipo("transferencia");
            nuevoMovimiento.setEntidad(beneficiario);
            //creamos nuevo movimiento
            this.movimientoFacade.create(nuevoMovimiento);
            ben.setSaldo((ben.getSaldo()) + importe);
            usuario.setSaldo((usuario.getSaldo()) - importe);
            this.usuarioFacade.edit(ben);
            this.usuarioFacade.edit(usuario);

            RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/Usuario_Transferencias.jsp");
            rd.forward(request, response); 
            }
        }
        }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
