/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Controlador.ClienteControlador;
import Controlador.ProfesionalControlador;
import Controlador.RecetaControlador;
import Controlador.StockxSucControlador;
import Controlador.SuministroControlador;
import Modelo.Cliente;
import Modelo.DetalleReceta;
import Modelo.FormaPago;
import Modelo.ObraSocial;
import Modelo.Profesional;
import Modelo.Receta;
import Modelo.Sucursal;
import Modelo.Suministro;
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
@WebServlet(name = "AltaReceta", urlPatterns = {"/AltaReceta"})
public class AltaReceta extends HttpServlet {

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
        ArrayList<Cliente> arrayClientes = cliCon.getListadoClientes();
        request.setAttribute("comboClientes", arrayClientes);

        ProfesionalControlador proCon = new ProfesionalControlador();
        ArrayList<Profesional> arrayProfesional = proCon.getListadoProfesional();
        request.setAttribute("comboProfesional", arrayProfesional);

        StockxSucControlador stXsu = new StockxSucControlador();
        ArrayList<Sucursal> arrayStXSuc = stXsu.getSucursales();
        request.setAttribute("comboSucursal", arrayStXSuc);

        RecetaControlador recCon = new RecetaControlador();
        ArrayList<ObraSocial> arrayObrS = recCon.getObrasSociales();
        request.setAttribute("comboObraSocial", arrayObrS);

        ArrayList<FormaPago> arrayFormPago = recCon.getFormasDePago();
        request.setAttribute("comboFormaPago", arrayFormPago);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/AltaReceta.jsp");
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

        String fec = request.getParameter("txtFechaReceta");
        int idCli = 0, idPro = 0, idObrSo = 0, idForPa = 0, nroSuc = 0;

        try {
            idCli = Integer.parseInt(request.getParameter("cboCliente"));
            idPro = Integer.parseInt(request.getParameter("cboProfesional"));
            idObrSo = Integer.parseInt(request.getParameter("cboObraSocial"));
            idForPa = Integer.parseInt(request.getParameter("cboFormaPago"));
            nroSuc = Integer.parseInt(request.getParameter("cboSucursal"));

        } catch (Exception e) {
            System.out.println("Error al castear en CARGAR DETALLE");
        }

        ClienteControlador cliCon = new ClienteControlador();
        Cliente cliente = cliCon.getClientexId(idCli);
        
        ProfesionalControlador proCon = new ProfesionalControlador();
        Profesional profesional = proCon.getProfesionalxID(idPro);
        
        RecetaControlador recCon = new RecetaControlador();
        ObraSocial obrasocial = recCon.getObraSocialxId(idObrSo);
        FormaPago formapago = recCon.getFormaPagoxId(idForPa);
        
        StockxSucControlador sxs = new StockxSucControlador();
        Sucursal sucur = sxs.getSucursalxId(nroSuc);
        
        int idLocal = sucur.getLoc().getIdLocalidad();
        
        request.getSession().setAttribute("idLocSession", idLocal);
        request.getSession().setAttribute("idObraSSession", idObrSo);
        request.getSession().setAttribute("idFormPaSession", idForPa);
        
        
        
        Receta receta = new Receta(cliente, profesional, fec, obrasocial, formapago, sucur);
        recCon.insertarCabeceraReceta(receta);

        int idRec = receta.getIdReceta();

        request.getSession().setAttribute("idReceSess", idRec);

        response.sendRedirect("/Farmaceutica/CargarDetalle");

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
