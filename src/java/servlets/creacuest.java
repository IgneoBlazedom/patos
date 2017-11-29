/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import clases.Cuestionarios;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hot Cakes
 */
public class creacuest extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        if (request.getCharacterEncoding() == null) {
                request.setCharacterEncoding("UTF-8");
            }
        response.setContentType("text/html;charset=UTF-8");
        HttpSession cuestionario = request.getSession();
        HttpSession xses = request.getSession();
        
        int idProf = Integer.parseInt(request.getParameter("idProf"));
        String nombre = request.getParameter("nombrecuest");
        String pregunta = request.getParameter("pregunta");
        String min = request.getParameter("min");
        String seg = request.getParameter("seg");
        String respuesta1 = request.getParameter("respuesta1");
        String respuesta2 = request.getParameter("respuesta2");
        String respuesta3 = request.getParameter("respuesta3");
        String respuesta4 = request.getParameter("respuesta4");
        String correcta = request.getParameter("correcto");
        String siguard = request.getParameter("siguard");        
        if (min.length()<1) {
            for (int i = 0; i < 1; i++) {
                min=("0"+min);
            }
        }
        if (seg.length()<1) {
            for (int i = 0; i < 1; i++) {
                seg=("0"+seg);
            }
        }
        String tiempo = ("00:"+min+":"+seg);
        xses.setAttribute("id", Integer.toString(idProf));
        cuestionario.setAttribute("nombre", nombre);
        
        Cuestionarios Cuest = new Cuestionarios();
        Cuest.setNombre(nombre);
        Cuest.setIdProfesor(idProf);
        Cuest.setPregunta(pregunta);
        Cuest.setTiempo(tiempo);
        
        if (correcta.equals("A")) {
            Cuest.setRespCorrecta(respuesta1);
            Cuest.setRespInc1(respuesta2);
            Cuest.setRespInc2(respuesta3);
            Cuest.setRespInc3(respuesta4);
        }
        else if (correcta.equals("B")) {
            Cuest.setRespCorrecta(respuesta2);
            Cuest.setRespInc1(respuesta1);
            Cuest.setRespInc2(respuesta3);
            Cuest.setRespInc3(respuesta4);
        }
        else if (correcta.equals("C")) {
            Cuest.setRespCorrecta(respuesta3);
            Cuest.setRespInc1(respuesta1);
            Cuest.setRespInc2(respuesta2);
            Cuest.setRespInc3(respuesta4);
        }
        else if (correcta.equals("D")) {
            Cuest.setRespCorrecta(respuesta4);
            Cuest.setRespInc1(respuesta1);
            Cuest.setRespInc2(respuesta2);
            Cuest.setRespInc3(respuesta3);
        }
        
        String conf = Cuest.guardaPreg();     
        
        if (!conf.equals("Guardado con éxito")) {
            cuestionario.setAttribute("msj", conf);
        }       
        
        if (siguard.equals("otra")) {
            response.sendRedirect("crearcuestionario.jsp");
        }
        else{
            response.sendRedirect("inicio.jsp");
        }
//        try (PrintWriter out = response.getWriter()) {
//             
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet creacuest</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<p> prof: "+Cuest.getIdProfesor()+"</p>");
//            out.println("<p> nombre: "+Cuest.getNombre()+"</p>");
//            out.println("<p> pregunta: "+Cuest.getPregunta()+"</p>");
//            out.println("<p> tiempo: "+Cuest.getTiempo()+"</p>");
//            out.println("<p> correcta: "+Cuest.getRespCorrecta()+"</p>");
//            out.println("<p> rsp2: "+Cuest.getRespInc1()+"</p>");
//            out.println("<p> rsp3: "+Cuest.getRespInc2()+"</p>");
//            out.println("<p> rsp4: "+Cuest.getRespInc3()+"</p>");
//            out.println("<p> siguiente o guardar: "+siguard+"</p>");
//            out.println("<p> siguiente o guardar: "+conf+"</p>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
