/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Controlador.RecetaControlador;
import Controlador.StockxSucControlador;
import Controlador.SuministroControlador;
import Modelo.Cobertura;
import Modelo.Descuento;
import Modelo.Localidad;
import Modelo.ObraSocial;
import Modelo.Suministro;
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
@WebServlet(name = "AltaCobertura", urlPatterns = {"/AltaCobertura"})
public class AltaCobertura extends HttpServlet {

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
        RecetaControlador recCon = new RecetaControlador();
        ArrayList<ObraSocial> arrayObrS = recCon.getObrasSociales();
        request.setAttribute("comboObraSocial", arrayObrS);

        SuministroControlador sumCon = new SuministroControlador();
        ArrayList<Suministro> arraySumin = sumCon.getListadoSuministro();
        request.setAttribute("comboSumin", arraySumin);

        ArrayList<Localidad> arrayLocalidad = recCon.getListadoLocalidades();
        request.setAttribute("comboLocal", arrayLocalidad);
        
        ArrayList<Descuento> arrayCobertura = recCon.getDescuentos();
        request.setAttribute("comboDescuentos", arrayCobertura);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/AltaCobertura.jsp");
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
        /*
        cboObraSocial  cboSuministro  cboLocalidad  chkTieneDescuento
         */
        
        int idDesc = 0;
        int idSum = 0;
        int idObr = 0;
        int idLocal = 0;
        int cober = 0;

        try {
            idSum = Integer.parseInt(request.getParameter("cboSuministro"));
            idObr = Integer.parseInt(request.getParameter("cboObraSocial"));
            idLocal = Integer.parseInt(request.getParameter("cboLocalidad"));
            idDesc = Integer.parseInt(request.getParameter("cboDescu"));
        } catch (Exception e) {
        }

        RecetaControlador recCon = new RecetaControlador();
        ObraSocial obrasocial = recCon.getObraSocialxId(idObr);
        SuministroControlador sumCon = new SuministroControlador();
        Suministro suministro = sumCon.getSuministroxID(idSum);
        StockxSucControlador sxs = new StockxSucControlador();
        Localidad localidad = sxs.getLocalidadxId(idLocal);
        
        Descuento descu = recCon.getDescuentosXId(idDesc);

        Cobertura estadoCobertura = recCon.tieneDescuento(idLocal, idObr, idSum);
        System.out.println("VALOR DE ESTADOCOBERTURA EN POST -  "  + estadoCobertura );
    
        if(idDesc == 2) {
            
            cober = 0;
        }
        else
        {
            cober = 1;
        }

        Cobertura cobertura = new Cobertura(obrasocial, suministro, localidad, cober, descu);
        request.getSession().setAttribute("idDes", idDesc);
        if (estadoCobertura != null) {
            System.out.println("ENTRO AL ESTADO COBERTURA DISTINTO DE  NULL ");
            recCon.editarCobertura(cobertura);
            response.sendRedirect("/Farmaceutica/ListadoCoberturas");
        } else {
            System.out.println("ENTRO AL ESTADO COBERTURA NULO");
            recCon.insertarCobertura(cobertura);
            response.sendRedirect("/Farmaceutica/ListadoCoberturas");
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
