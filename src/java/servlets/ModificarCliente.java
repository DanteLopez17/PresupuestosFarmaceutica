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
@WebServlet(name = "ModificarCliente", urlPatterns = {"/ModificarCliente"})
public class ModificarCliente extends HttpServlet {

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
        int idCli = Integer.parseInt(request.getParameter("idCliente"));
        ClienteControlador conCli = new ClienteControlador();
        Cliente c = conCli.getClientexId(idCli);
        request.setAttribute("cliXid", c);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/ModificarCliente.jsp");
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

        int idCli = 0;
        int idTipoDoc = 0;
        int numDoc = 0;

        String nom = request.getParameter("txtNombre");
        String ape = request.getParameter("txtApellido");
        try {
            idCli = Integer.parseInt(request.getParameter("txtIdCliente"));
            idTipoDoc = Integer.parseInt(request.getParameter("txtIdTipoDoc"));
            numDoc = Integer.parseInt(request.getParameter("txtNumDocu"));
        } catch (Exception e) {
            System.out.println("Error al castear el Tipo Doc y el numero de doc");
        }

        String fecNac = request.getParameter("txtFecNac");

        ClienteControlador cliCon = new ClienteControlador();

        tipoDoc tpDoc = cliCon.getTipoDocxId(idTipoDoc);

        Cliente c = new Cliente(idCli, nom, ape, fecNac, numDoc, tpDoc);

        //Modificar Cliente
        cliCon.modificarCliente(c);

        response.sendRedirect("/Farmaceutica/ListadoClientes");

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
