/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Controlador.RecetaControlador;
import Controlador.SuministroControlador;
import Modelo.Cobertura;
import Modelo.Descuento;
import Modelo.DetalleReceta;
import Modelo.FormaPago;
import Modelo.Receta;
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
@WebServlet(name = "CargarDetalle", urlPatterns = {"/CargarDetalle"})
public class CargarDetalle extends HttpServlet {

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
        int idRec = (int) request.getSession().getAttribute("idReceSess");
        
        ArrayList<DetalleReceta> arrayDetalles = recCon.getDetallesReceta(idRec);
        request.setAttribute("detalles", arrayDetalles);
        
        SuministroControlador sumCon = new SuministroControlador();
        ArrayList<Suministro> arraySumin = sumCon.getListadoSuministro();
        request.setAttribute("comboSumin", arraySumin);
        
        int idLocal = (int) request.getSession().getAttribute("idLocSession");
        request.setAttribute("idLocali", idLocal);
        int idObrSo = (int) request.getSession().getAttribute("idObraSSession");
        request.setAttribute("idObrSo", idObrSo);
        int idForPa = (int) request.getSession().getAttribute("idFormPaSession");
        request.setAttribute("idFoPa", idForPa);
        
        double total = recCon.mostrarTotalReceta(idRec);
        request.setAttribute("total", total);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/CargarDetalle.jsp");
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
        cboSuministro
        txtCantidad
        */
        
        int idSumin = 0;
        float prec = 0;
        int cant = 0;
        int idLocal = 0;
        int idObra = 0;
        int idDesc = 0;
     //   int idForm = 0;
        
        try {
            idSumin = Integer.parseInt(request.getParameter("cboSuministro"));
            cant = Integer.parseInt(request.getParameter("txtCantidad"));
            idLocal = Integer.parseInt(request.getParameter("txtLocalidad"));
            idObra = Integer.parseInt(request.getParameter("txtObraSocial"));
          //  idForm = Integer.parseInt(request.getParameter("txtFormaPago"));
            idDesc = Integer.parseInt(request.getParameter("txtIdDescuen"));
        } catch (Exception e) {
            System.out.println("ERROR EN EL POST CARGAAR DETALLE");
        }
        
        SuministroControlador sumCon = new SuministroControlador();
        Suministro sum = sumCon.getSuministroxID(idSumin);
        prec = sumCon.getPrecioSuministroxID(idSumin);
        
        int idRec = (int) request.getSession().getAttribute("idReceSess");
        
        RecetaControlador recCon = new RecetaControlador();
        Receta receta = recCon.getRectaXId(idRec);
        
        DetalleReceta dr = new DetalleReceta(receta, cant, prec, sum);
        
       // Descuento descu = recCon.getDescuentosXId(idDesc);

        Cobertura descuento = recCon.tieneDescuento(idLocal, idObra, idSumin);
        float descOS = 0;
        if(descuento != null){
            int tieneDesc = descuento.getDescuento();
            System.out.println("VALOR DE TIENE DESCUENTO EN EL POST - " + tieneDesc);
      
            if(tieneDesc == 1)
            {
              descOS  = prec * cant * descuento.getDescu().getValorDesc();
            //  descOS  = (double) Math.round(((prec * cant * descu.getValorDesc())*100.0)/100.0);
                System.out.println("ENTRO AL IF == 1 DESCUENTO OS - " + descOS );
            }
            else
            {
                descOS = 0;
                System.out.println("ENTRO AL else DESCUENTO OS - " + descOS );
            }
        }

        
        DetalleReceta detRece = new DetalleReceta(receta, cant, prec, sum, descOS);
        int existe = recCon.existe(idRec, idSumin);
                
        if(existe == 0)
        {
            recCon.insertarDetalles(detRece);
            response.sendRedirect("/Farmaceutica/CargarDetalle");
        }
        else
        {
            response.sendRedirect("/Farmaceutica/CargarDetalle");
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
