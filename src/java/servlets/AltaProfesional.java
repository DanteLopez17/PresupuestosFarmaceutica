/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Controlador.ClienteControlador;
import Controlador.ProfesionalControlador;
import Modelo.Especialidad;
import Modelo.Profesional;
import Modelo.tipoDoc;
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
@WebServlet(name = "AltaProfesional", urlPatterns = {"/AltaProfesional"})
public class AltaProfesional extends HttpServlet {

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
        ClienteControlador cliCon = new ClienteControlador();
        ArrayList<tipoDoc> arrayTipDoc = cliCon.getTiposDoc();
        request.setAttribute("comboTD", arrayTipDoc);

        ProfesionalControlador proCon = new ProfesionalControlador();
        ArrayList<Especialidad> lista = proCon.getEspecialidad();
        request.setAttribute("comboE", lista);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/AltaProfesional.jsp");
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

        int numMatri = 0;
        int tipDoc = 0;
        int numDoc = 0;
        int espec = 0;
        String nom = request.getParameter("txtNombre");
        String ape = request.getParameter("txtApellido");
        try {
            numMatri = Integer.parseInt(request.getParameter("txtNumMatricula"));
            tipDoc = Integer.parseInt(request.getParameter("cboTipoDoc"));
            numDoc = Integer.parseInt(request.getParameter("txtNumDoc"));
            espec = Integer.parseInt(request.getParameter("cboEspecialidad"));
        } catch (Exception e) {
            System.out.println("Error al castear matricula, tipodoc, numdoc, espec");
        }
        String fecNac = request.getParameter("txtFecNac");
        ClienteControlador cliCon = new ClienteControlador();
        ProfesionalControlador profCon = new ProfesionalControlador();

        tipoDoc tpDoc = cliCon.getTipoDocxId(tipDoc);
        Especialidad es = profCon.getEspecialidadxId(espec);
        Profesional p = new Profesional(nom, ape, numMatri, fecNac, numDoc, tpDoc, es);

        //Insertar Profesional
        profCon.insertarProfesional(p);

        response.sendRedirect("/Farmaceutica/ListadoProfesionales");
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
