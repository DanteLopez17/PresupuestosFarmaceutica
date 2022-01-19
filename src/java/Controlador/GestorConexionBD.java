package Controlador;

import Modelo.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GestorConexionBD {

    Connection con;
    private String cadena = "jdbc:sqlserver://localhost;databaseName=Farmaceutica";
    private String usuario = "sa";
    private String clave = "123456";

    public String getCadena() {
        return cadena;
    }

    public void setCadena(String cadena) {
        this.cadena = cadena;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public GestorConexionBD() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GestorConexionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void abrirCon() {
        try {
            con = DriverManager.getConnection(cadena, usuario, clave);
            System.out.println("Conexion Abierta");
        } catch (SQLException ex) {
            Logger.getLogger(GestorConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error en la Conexion!");
        }
    }

    public void cerrarCon() {
        try {
            if (!con.isClosed() && con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(GestorConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al cerrar la Conexion!");
        }
    }

    public Usuario getUsuarioXUserClave(String user, int clav) {
        Usuario usuario = null;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select * from usuarios where usuario = ? and clave = ?");
            ps.setString(1, user);
            ps.setInt(2, clav);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                String us = rs.getString("usuario");
                int cl = rs.getInt("clave");

                usuario = new Usuario(user, clav);
            }
            rs.close();
            ps.close();
            cerrarCon();

        } catch (Exception e) {
        }
        return usuario;
    }

}
