
package Controlador;

import Modelo.Localidad;
import Modelo.StockXSucursal;
import Modelo.Sucursal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StockxSucControlador {
    Connection con;
   /* private String cadena = "jdbc:sqlserver://localhost;databaseName=Farmaceutica";
    private String usuario = "sa";
    private String clave = "123456";*/
    
    GestorConexionBD gestor = new GestorConexionBD();

    public StockxSucControlador() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(StockxSucControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void abrirCon() {
        try {
            con = DriverManager.getConnection(gestor.getCadena(),gestor.getUsuario(),gestor.getClave());
            System.out.println("Conexion Abierta");
        } catch (SQLException ex) {
            Logger.getLogger(StockxSucControlador.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error en la Conexion!");
        }
    }

    public void cerrarCon() {
        try {
            if (!con.isClosed() && con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(StockxSucControlador.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al cerrar la Conexion!");
        }
    }
    
    public ArrayList<Sucursal> getSucursales() {
        ArrayList<Sucursal> lista = new ArrayList<>();
        try {
            abrirCon();
            String consultaSQL = "Select s.nroSucursal, s.idLocalidad as 'idLocalidad', l.nombre\n" +
                                "from Sucursal  s join Localidad l on s.idLocalidad = l.idLocalidad";
            PreparedStatement ps = con.prepareStatement(consultaSQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int nroSucur = rs.getInt("nroSucursal");
                int idLoc = rs.getInt("idLocalidad");
                String nomLoc = rs.getString("nombre");
                Localidad loc = new Localidad(idLoc,nomLoc );
                
                lista.add(new Sucursal(nroSucur, loc));
            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
            System.out.println("Error en método get Sucursales");
        }

        return lista;
    }
       
    public void insertarStockxSucur(StockXSucursal nvo) {
        try {
            abrirCon();

            PreparedStatement ps = con.prepareStatement("Insert into StockSumXSucur(nroSucursal, idSuministro, Stock)values(?,?,?)");
            ps.setInt(1, nvo.getSucu().getNroSucursal());
            ps.setInt(2, nvo.getSumi().getIdSuministro());
            ps.setInt(3, nvo.getStock());

            ps.executeUpdate();

            ps.close();
            cerrarCon();
        } catch (SQLException e) {
            System.out.println("Error en método insertarStockxSucur");
        }
    }
    
    public Sucursal getSucursalxId(int id) {
        Sucursal sucursal = null;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select nroSucursal, calle, altura, telefono, s.idLocalidad as 'idLocalidad', l.nombre\n" +
                                                        "from Sucursal s join Localidad l on s.idLocalidad = l.idLocalidad\n" +
                                                        "where nroSucursal = ? ");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int nroSuc = rs.getInt("nroSucursal");
                String calle = rs.getString("calle");
                int altura = rs.getInt("altura");
                int telefono = rs.getInt("telefono");
                int idLocalidad = rs.getInt("idLocalidad");
                String nombLoc = rs.getString("nombre");
                
                Localidad l = new Localidad(idLocalidad, nombLoc);
                
                sucursal = new Sucursal(nroSuc, calle, altura, telefono, l);
            }
            rs.close();
            ps.close();
            cerrarCon();

        } catch (SQLException ex) {
            System.out.println("Error en metodo get Sucursal x ID");

        }
        return sucursal;
    }
    
    public Localidad getLocalidadxId(int id) {
        Localidad localidad = null;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select * from Localidad where idLocalidad =?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int idLoc = rs.getInt("idLocalidad");
                String nom = rs.getString("nombre");

                
                localidad = new Localidad(idLoc, nom);

            }
            rs.close();
            ps.close();
            cerrarCon();

        } catch (SQLException ex) {
            System.out.println("Error en metodo get Localidad x ID");

        }
        return localidad;
    }
    
}
