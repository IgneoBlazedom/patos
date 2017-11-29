package servlets;

import clases.Cuestionarios;
import clases.persona;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hot Cakes
 */
public class NuevoCuestionario extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException{
        response.setContentType("text/html;charset=UTF-8");
        if (request.getCharacterEncoding() == null) {
                request.setCharacterEncoding("UTF-8");
            }
        Cuestionarios Cuest = new Cuestionarios();        
        HttpSession cuestionario = request.getSession();        
        String nombre = request.getParameter("nombrecuest");
        int idProfesor = Integer.parseInt(request.getParameter("idProf"));
                
        Cuest.setNombre(nombre);
        Cuest.setIdProfesor(idProfesor);
        
        String conf = (Cuest.guardaCuest());
        HttpSession xses = request.getSession();
        xses.setAttribute("id", Integer.toString(idProfesor));
        cuestionario.setAttribute("nombre", nombre);
        
        if (!conf.equals("Se guardó el cuestionario")) {
            cuestionario.setAttribute("msj", conf);
            response.sendRedirect("nuevoCuestionario.jsp");                       
        }
        else {
            response.sendRedirect("crearcuestionario.jsp");
        }
        
//        response.sendRedirect("crearcuestionario.jsp");
//        try (PrintWriter out = response.getWriter()) {
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet registro</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<p> Nombre:"+Cuest.getNombre()+"</p>"); 
//            out.println("<p> Profe :"+Cuest.getIdProfesor()+"</p>"); 
//            out.println("<p> Profe :"+conf+"</p>"); 
//            out.println("</body>");
//            out.println("</html>");
//        }
//        
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
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