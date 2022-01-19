/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Controlador.GestorConexionBD;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author carp_
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    

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
        response.sendRedirect("/Farmaceutica/login.html");
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
        GestorConexionBD gestor = new GestorConexionBD();
        
        
        String usua = request.getParameter("txtUsuario");
        int clave = Integer.parseInt(request.getParameter("txtClave"));
        Usuario usuario = gestor.getUsuarioXUserClave(usua, clave);
        
        if(usuario != null){
            request.getSession().setAttribute("autenticado", true);
            request.getSession().setAttribute("usuario", usuario.getUser());
            request.getSession().setAttribute("clave", usuario.getClave());
            response.sendRedirect("/Farmaceutica/inicio.jsp");
        }
        else
        {
            
            request.getSession().invalidate();
            response.sendRedirect("/Farmaceutica/login.html");
        }
        
        /*Autenticar
        if(usuario.equals("admin") && clave.equals("admin"))
        {
            request.getSession().setAttribute("autenticado", true);
            request.getSession().setAttribute("usuario", usuario);
            request.getSession().setAttribute("clave", clave);
        }
        
        
        else
        {
            request.getSession().invalidate();
        }*/
        
        
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
