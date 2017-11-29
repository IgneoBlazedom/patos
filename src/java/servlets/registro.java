/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import clases.persona;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alumno
 */
public class registro extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException{
        HttpSession vali = request.getSession();
        vali.setAttribute("veces", "0");
        response.setContentType("text/html;charset=UTF-8");
        String nombre = request.getParameter("nombre");
        String appat = request.getParameter("appat");
        String apmat = request.getParameter("apmat");
        String rfc = request.getParameter("rfc");
        String usuario = request.getParameter("usuario");
        String contra = request.getParameter("contra");
        String contra2 = request.getParameter("contra2");
        String email = request.getParameter("email");
        String email2 = request.getParameter("email2");
        String rol = request.getParameter("rol");
        
        
        if(!contra.equals(contra2)&&!email.equals(email2)){
            vali.setAttribute("msj", "Las contraseñas y correos no coinciden");
        }
        else if (!contra.equals(contra2)) {
            vali.setAttribute("msj", "Las contraseñas no coinciden");
        }
        else if (!email.equals(email2)) {
            vali.setAttribute("msj", "Los correos no coinciden");
        }
        
        vali.setAttribute("nombre", nombre);
        vali.setAttribute("appat", appat);
        vali.setAttribute("apmat", apmat);
        vali.setAttribute("rfc", rfc);
        vali.setAttribute("usuario", usuario);   
        
        if(vali.getAttribute("msj")==null){
            persona p = new persona();
            p.setNombre(nombre);
            p.setApellPat(appat);
            p.setApellMat(apmat);
            p.setBoleta(rfc);
            p.setUsuario(usuario);
            p.setPsw(contra);
            p.setEmail(email);
            p.setRol(rol);
            p.setEstado("1");
            vali.setAttribute("veces", "1");
            String conf= (p.guardaTodo());
            if (!conf.equals("Registrado exitosamente")){
                vali.setAttribute("msj", conf);
            }
        }
        
        
       
//        
//        String conf= (p.guardaTodo());
//        if (!conf.equals("Registrado exitosamente")){
//            vali.setAttribute("msj", conf);
//        }
        
        String maalu = request.getParameter("regis");
        if (maalu.equals("maestro")) {
            vali.setAttribute("veces", "1");
            response.sendRedirect("registro.jsp");
        }
        else{
            vali.setAttribute("veces", "1");
            response.sendRedirect("registroal.jsp");
        }
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet registro</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<p> Nombre:"+p.getNombre()+"</p>");
//            out.println("<p> ApPat:"+p.getApellPat()+"</p>");
//            out.println("<p> ApMat:"+p.getApellMat()+"</p>");
//            out.println("<p> Boleta:"+p.getBoleta()+"</p>");
//            out.println("<p> User:"+p.getUsuario()+"</p>");
//            out.println("<p> Psw:"+p.getPsw()+"</p>");
//            out.println("<p> PSW2:"+contra2+"</p>");
//            out.println("<p> mail:"+p.getEmail()+"</p>");
//            out.println("<p> mail2:"+email2+"</p>");
//            out.println("<p> rol:"+p.getRol()+"</p>");
//            out.println("<p> Morro:"+maalu+"</p>");
////            out.println("<p> rol:"+conf+"</p>");
//            out.println("</body>");
//            out.println("</html>");
//        }//end printer
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
