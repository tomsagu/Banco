/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banco.servlet;

import banco.ejb.MovimientoFacade;
import banco.ejb.UsuarioFacade;
import banco.entity.Movimiento;
import banco.entity.Usuario;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JorgeL
 */
@WebServlet(name = "Empleado_CrearActualizarMovimientoServlet", urlPatterns = {"/Empleado_CrearActualizarMovimientoServlet"})
public class Empleado_CrearActualizarMovimientoServlet extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;

    
    
    @EJB
    private MovimientoFacade movimientoFacade;

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
        Movimiento movimiento;

        String tipodemovimiento = request.getParameter("tipodemovimiento");
        String fecha = request.getParameter("fecha");
        String entidad = request.getParameter("entidad");
        String concepto = request.getParameter("concepto");
        String cantidad = request.getParameter("cantidad");
        String empleadosupervisor = request.getParameter("empleadosupervisor");
        String usuario = request.getParameter("usuario");
        String id = request.getParameter("idmovimiento");
        String error;
        
        if (("".equals(tipodemovimiento)) || "".equals(fecha) || "".equals(entidad) ||
            "".equals(concepto) || "".equals(cantidad) || "".equals(empleadosupervisor)  ||
            "".equals(usuario)) {
            
            error = "Movimiento con datos incorrectos o vacios";
            request.setAttribute("error", error);
            RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/ErrorUsuario.jsp");
            rd.forward(request, response);
        } else{
        
        
        if ("".equals(id)) { // Crear
            movimiento = new Movimiento();
        } else { // Editar
            movimiento = this.movimientoFacade.find(new Integer(id));
        }


        if (fecha != null) {
            String fechaAMD = fecha.substring(0, 9);
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
            Date date = null;
            try {
                date = format.parse(fechaAMD);
            } catch (ParseException ex) {
               // Logger.getLogger(Empleado_CrearMovimientoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (date != null) {
                movimiento.setFecha(date);
            }
        }

        if (entidad != null) {
            movimiento.setEntidad(entidad);
        }

        if (concepto != null) {
            movimiento.setConcepto(concepto);
        }

        if (cantidad != null) {
            movimiento.setCantidad(Double.parseDouble(cantidad));
        }

        if (empleadosupervisor != null) {
            Usuario e = this.usuarioFacade.find(new Integer(empleadosupervisor));
            movimiento.setUsuarioidUsuario1(e);
        }
        
        if (usuario != null) {
            Usuario u = this.usuarioFacade.find(new Integer(usuario));
            movimiento.setUsuarioidUsuario(u);
        }
        
         if (tipodemovimiento != null) {
               double dinero= Double.parseDouble(cantidad);
            movimiento.setTipo(tipodemovimiento);
            if(tipodemovimiento.equals("ingreso")){
                Usuario x = this.usuarioFacade.find(new Integer(usuario));
                x.setSaldo(x.getSaldo()+dinero);
                this.usuarioFacade.edit(x);
            }else if(tipodemovimiento.equals("debito")){
               Usuario x = this.usuarioFacade.find(new Integer(usuario));
                x.setSaldo(x.getSaldo()-dinero);
                this.usuarioFacade.edit(x); 
            }else{
                Usuario x = this.usuarioFacade.find(new Integer(usuario));
                x.setSaldo(x.getSaldo()-dinero);
                this.usuarioFacade.edit(x);
                Usuario y = this.usuarioFacade.findByDni(entidad);
                y.setSaldo(y.getSaldo()+dinero);
                this.usuarioFacade.edit(y);
            }
        }
        
        if ("".equals(id)) {
            this.movimientoFacade.create(movimiento);
        } else {
            this.movimientoFacade.edit(movimiento);
        }
        
        RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/Empleado_UsuarioServlet"); ////CAMBIARRRR!!! es solo de prueba
        rd.forward(request, response);
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
