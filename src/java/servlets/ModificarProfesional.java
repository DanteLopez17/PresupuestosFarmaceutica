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
import java.io.PrintWriter;
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
@WebServlet(name = "ModificarProfesional", urlPatterns = {"/ModificarProfesional"})
public class ModificarProfesional extends HttpServlet {

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
        int idPro = Integer.parseInt(request.getParameter("idProfesional"));
        ProfesionalControlador proCon = new ProfesionalControlador();
        Profesional p = proCon.getProfesionalxID(idPro);
        request.setAttribute("proXid", p);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/ModificarProfesional.jsp");
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

        int idPro = 0;
        int idEspe = 0;
        int numMat = 0;
        int idTipoDoc = 0;
        int numDoc = 0;

        String nom = request.getParameter("txtNombre");
        String ape = request.getParameter("txtApellido");
        String fecNac = request.getParameter("txtFechaNacim");
        
        try {
            idPro = Integer.parseInt(request.getParameter("txtIdProfesional"));
        } catch (Exception e) {
            System.out.println("Error en el idProfesional");
        }
        try {
            idEspe = Integer.parseInt(request.getParameter("txtIdEspecialidad"));
        } catch (Exception e) {
            System.out.println("Error en el idEspecialidad");
        }
        try {
            numMat = Integer.parseInt(request.getParameter("txtNumMatri"));
        } catch (Exception e) {
            System.out.println("Error en Matricula");
        }
        try {
            idTipoDoc = Integer.parseInt(request.getParameter("txtIdTipoDoc"));
        } catch (Exception e) {
            System.out.println("Error en el idTipo DOc");
        }
        try {
            numDoc = Integer.parseInt(request.getParameter("txtNumDocu"));

        } catch (Exception e) {
            System.out.println("Error en el numDoc");
        }

        ClienteControlador cliCon = new ClienteControlador();
        ProfesionalControlador proCon = new ProfesionalControlador();

        tipoDoc tpDoc = cliCon.getTipoDocxId(idTipoDoc);
        Especialidad espec = proCon.getEspecialidadxId(idEspe);

        Profesional p = new Profesional(idPro, nom, ape, numMat, fecNac, numDoc, tpDoc, espec);

        //Modificar Profesional
        proCon.modificarProfesional(p);

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
