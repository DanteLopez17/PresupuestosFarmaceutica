/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Controlador.StockxSucControlador;
import Controlador.SuministroControlador;
import Modelo.Clasificacion;
import Modelo.StockXSucursal;
import Modelo.Sucursal;
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
@WebServlet(name = "AltaSuministro", urlPatterns = {"/AltaSuministro"})
public class AltaSuministro extends HttpServlet {

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
        SuministroControlador sumCon = new SuministroControlador();
            ArrayList<Clasificacion> arrayClasif = sumCon.getClasificacion();
            request.setAttribute("comboClas", arrayClasif);
             
            ArrayList<TipoSuministro> arrayTipoSum = sumCon.getTipoSuministro();
            request.setAttribute("comboTipoSum", arrayTipoSum);
            
            StockxSucControlador stxsuc = new StockxSucControlador();
            ArrayList<Sucursal> arraySucur = stxsuc.getSucursales();
            request.setAttribute("comboSucur", arraySucur);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/AltaSuministro.jsp");
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

        float preUni = 0;
        int idClasif = 0;
        int idTipoSum = 0;
        String desc = request.getParameter("txtDescripcion");
        try {
            preUni = Float.parseFloat(request.getParameter("txtPrecioUnit"));
            idClasif = Integer.parseInt(request.getParameter("cboClasificacion"));
            idTipoSum = Integer.parseInt(request.getParameter("cboTipo"));
        } catch (Exception e) {
            System.out.println("Error en la conversion AltaSuministro Servlet");
        }
        
        SuministroControlador sumCon = new SuministroControlador();
        Clasificacion cl = sumCon.getClasificacionxId(idClasif);
        TipoSuministro tSum = sumCon.getTipoSumxId(idTipoSum);

        Suministro s = new Suministro(desc, preUni, cl, tSum);
 
        sumCon.insertarSuministro(s);

        StockxSucControlador stXsuc = new StockxSucControlador();
        int idSumin = s.getIdSuministro();
        int cant = Integer.parseInt(request.getParameter("txtCantidad"));
        int nroSuc = Integer.parseInt(request.getParameter("cboSucursal"));

        Sucursal sucur = stXsuc.getSucursalxId(nroSuc);
        Suministro sumi = sumCon.getSuministroxID(idSumin);
        
        StockXSucursal stockXsucursal = new StockXSucursal(sucur, sumi, cant);
        stXsuc.insertarStockxSucur(stockXsucursal);

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
