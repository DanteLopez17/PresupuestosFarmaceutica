/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Controlador.SuministroControlador;
import Modelo.Clasificacion;
import Modelo.Suministro;
import Modelo.TipoSuministro;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ModificarSuministro", urlPatterns = {"/ModificarSuministro"})
public class ModificarSuministro extends HttpServlet {

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
        int idSum = Integer.parseInt(request.getParameter("idSuministro"));
        SuministroControlador sumCon = new SuministroControlador();
        Suministro s = sumCon.getSuministroxID(idSum);
        request.setAttribute("sumXid", s);

        ArrayList<Clasificacion> arrayClasif = sumCon.getClasificacion();
        request.setAttribute("comboClas", arrayClasif);

        ArrayList<TipoSuministro> arrayTipoSum = sumCon.getTipoSuministro();
        request.setAttribute("comboTipoSum", arrayTipoSum);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/ModificarSuministro.jsp");
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
// cboTipoSuministro  cboClasificacion
        int idSum = 0;
        int idClasif = 0;
        int idTipoSum = 0;
        String descSum = request.getParameter("txtDescripcion");
        float preUni = 0;

        try {
            idSum = Integer.parseInt(request.getParameter("txtIdSum"));
        } catch (Exception e) {
            System.out.println("Error al castear el idSuministro");
        }
        try {
            idClasif = Integer.parseInt(request.getParameter("cboClasificacion"));
        } catch (Exception e) {
            System.out.println("Error en el castear el idClasificacion");
        }
        try {
            idTipoSum = Integer.parseInt(request.getParameter("cboTipoSuministro"));
        } catch (Exception e) {
            System.out.println("Error en el castear IdTipoSuministro");
        }
        try {
            preUni = Float.parseFloat(request.getParameter("txtPrecioUnitario"));
        } catch (Exception e) {
            System.out.println("Error en castear preUni");
        }
        
        

        SuministroControlador sumCon = new SuministroControlador();

        Clasificacion cl = sumCon.getClasificacionxId(idClasif);
        TipoSuministro tpSum = sumCon.getTipoSumxId(idTipoSum);

        Suministro s = new Suministro(idSum, descSum, preUni, cl, tpSum);

        //Modificar Suministro
        
        sumCon.modificarSuministro(s);
        
        response.sendRedirect("/Farmaceutica/ListadoSuministros");
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
