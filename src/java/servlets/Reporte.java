/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Controlador.ProfesionalControlador;
import Controlador.ReporteControlador;
import Dto.DtoReporteUno;
import Modelo.Profesional;
import Modelo.Receta;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author carp_
 */
@WebServlet(name = "Reporte", urlPatterns = {"/Reporte"})
public class Reporte extends HttpServlet {

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
        ProfesionalControlador proCon = new ProfesionalControlador();
        ArrayList<Profesional> arrayProfesional = proCon.getListadoProfesional();
        request.setAttribute("comboProfesional", arrayProfesional);
        
        int idProf = 0;
        try {
            idProf = Integer.parseInt(request.getParameter("cboProfesional"));
        } catch (Exception e) {
            System.out.println("Error en el try del servlet Reporte en el DOGET");
        }
        
        ReporteControlador repCon = new ReporteControlador();
        ArrayList<DtoReporteUno> listdtoRec = repCon.getRecetasXunProfesional(idProf);
        request.setAttribute("listRecetas", listdtoRec);
        
        Profesional p = proCon.getProfesionalxID(idProf);
        request.setAttribute("profXid", p);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/ReporteUno.jsp");
        rd.forward(request, response);
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
        int idProf = 0;
        try {
            idProf = Integer.parseInt(request.getParameter("cboProfesional"));
        } catch (Exception e) {
            System.out.println("Error en el try del servlet Reporte en el DOPOST");
        }
        
        ReporteControlador repCon = new ReporteControlador();
        ArrayList<DtoReporteUno> listdtoRec = repCon.getRecetasXunProfesional(idProf);
        request.setAttribute("listRecetas", listdtoRec);
        response.sendRedirect("/Farmaceutica/ReporteUno");
        
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
