/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Controlador.ClienteControlador;
import Modelo.Cliente;
import Modelo.tipoDoc;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "AltaCliente", urlPatterns = {"/AltaCliente"})
public class AltaCliente extends HttpServlet {

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
        request.setAttribute("combo", arrayTipDoc);
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/AltaCliente.jsp");
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
       // processRequest(request, response);
       
       Cliente cliente = (Cliente)request.getSession().getAttribute("nuevoCliente");
       ClienteControlador cliCon = new ClienteControlador();
       
       cliCon.insertarCliente(cliente);
       
       response.sendRedirect("/Farmaceutica/ListadoClientes.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int tipDoc =0;
//        int numDoc = 0;
//        String nom = request.getParameter("txtNombre");
//        String ape = request.getParameter("txtApellido");
//        try{
//         tipDoc = Integer.parseInt(request.getParameter("cboTipoDocu"));
//         numDoc = Integer.parseInt(request.getParameter("txtNumDocumento"));
//        }catch(Exception e){
//            System.out.println("Error al castear el combo Tipo Doc y el numero de doc");
//        }
//        String fecNac = request.getParameter("txtFecNacim");
//        
//        ClienteControlador cliCon = new ClienteControlador();
//        
//        tipoDoc tpDoc = cliCon.getTipoDocxId(tipDoc);
//        
//        Cliente c = new Cliente(nom, ape, fecNac, numDoc, tpDoc);
//        
//        
//        //Insertar Cliente
//        cliCon.insertarCliente(c);
//        
//        
//        response.sendRedirect("/Farmaceutica/ListadoClientes");
//        
//    }

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
