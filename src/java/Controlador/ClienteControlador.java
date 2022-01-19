
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Modelo.Cliente;
import Modelo.tipoDoc;

public class ClienteControlador {
    Connection con;
  /*  private String cadena = "jdbc:sqlserver://localhost;databaseName=Farmaceutica";
    private String usuario = "sa";
    private String clave = "123456";*/
    GestorConexionBD gestor = new GestorConexionBD();
    
    public ClienteControlador() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void abrirCon()
    {
        try {
            con = DriverManager.getConnection(gestor.getCadena(),gestor.getUsuario(),gestor.getClave());
            System.out.println("Conexion Abierta");
        } catch (SQLException ex) {
            Logger.getLogger(ClienteControlador.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error en la Conexion!");
        }
    }
    
    public void cerrarCon()
    {
        try {
            if(!con.isClosed() && con !=null){
                con.close();
                }
            } catch (SQLException ex) {
            Logger.getLogger(ClienteControlador.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al cerrar la Conexion!");
        }
    }
    
    
    
    public ArrayList<tipoDoc> getTiposDoc()
    {
        ArrayList<tipoDoc> lista = new ArrayList<>();
        try
        {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM TiposDoc");            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                int id = rs.getInt("idTipoDoc");
                String desc = rs.getString("descripcion");
                
                tipoDoc ti = new tipoDoc();
                ti.setIdTipoDoc(id);
                ti.setDescripcion(desc);
                lista.add(ti);
            }   
            
            rs.close();
            ps.close();
            cerrarCon();
        }
        catch(Exception e)
        {
            System.out.println("Error en método getTipo Doc");
        }
        
        return lista;
    }
    
    public void insertarCliente(Cliente nvo)
    {
        try
        {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("insert into Cliente values(?,?,?,?,?)");
            ps.setString(1, nvo.getNombre());
            ps.setString(2, nvo.getApellido());
            ps.setString(3, nvo.getFechaNacimiento());
            ps.setInt(4, nvo.getNumDocumento());
            ps.setInt(5, nvo.getTipoDocumento().getIdTipoDoc());

            ps.executeUpdate();
            
            ps.close();
            cerrarCon();
        }
        catch(SQLException e)
        {
            System.out.println("Error en método insertarCliente");
        }
    }
    public void modificarCliente(Cliente nvo) {  
        try {
            abrirCon();

            PreparedStatement ps;
            ps = con.prepareStatement("Update Cliente set nombre = ?, apellido =?, fechaNac =?, numDoc =?, idTipoDoc =? where idCliente = ?  ");
            
            ps.setString(1,nvo.getNombre());
            ps.setString(2,nvo.getApellido());
            ps.setString(3,nvo.getFechaNacimiento());
            ps.setInt(4,nvo.getNumDocumento());
            ps.setInt(5,nvo.getTipoDocumento().getIdTipoDoc());
            ps.setInt(6,nvo.getIdCliente());
            ps.executeUpdate();
            ps.close();

        } catch (SQLException ex) {
            System.out.println("Error en método modificar Cliente");
        }
        
      finally{
        cerrarCon();
        }
    
    }
    
    public void eliminarCliente(int id){
        try {
            abrirCon();

            PreparedStatement ps;
            ps = con.prepareStatement("Delete Cliente where idCliente = ?  ");
            ps.setInt(1,id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("Error en el eliminarCliente");
        }
        finally{
        cerrarCon();
        }
    }
    
    public ArrayList<Cliente> getListadoClientes()
    {
        ArrayList<Cliente> lista = new ArrayList<>();
        try
        {
            abrirCon();
            tipoDoc tipoDocumento = null;
            PreparedStatement ps = con.prepareStatement("select * from Cliente");            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {

                int id = rs.getInt("idCliente");
                String nom = rs.getString("nombre");
                String ape = rs.getString("apellido");
                String fecNac = rs.getString("fechaNac");
                int numeroDoc = rs.getInt("numDoc");
                int idTip = rs.getInt("idTipoDoc");
                
                PreparedStatement ps2 = con.prepareStatement("Select * from TiposDoc where idTipoDoc = ?");
                ps2.setInt(1,idTip);
                ResultSet rs2 = ps2.executeQuery();
                if(rs2.next())
                {
                    int idTipoDoc = rs2.getInt("idTipoDoc");
                    String descrip = rs2.getString("descripcion");
                    
                    tipoDocumento = new tipoDoc(idTipoDoc, descrip);
                }
                                
                Cliente c = new Cliente(id, nom, ape, fecNac, numeroDoc, tipoDocumento);
                lista.add(c);
            }   

            rs.close();
            ps.close();
            cerrarCon();
        }
        catch(Exception e)
        {
            System.out.println("Error en método getListado de Clientes");
        }
        
        return lista;
    }
    
    public Cliente getClientexId(int id)
    {
        Cliente cliente = null;
        try {
            abrirCon();
            tipoDoc tipoDocumento = null;
            String consultaSql = "Select idCliente, nombre, apellido, fechaNac, numDoc, c.idTipoDoc, descripcion from Cliente c join TiposDoc td on c.idTipoDoc = td.idTipoDoc where idCliente = ?";
            PreparedStatement ps = con.prepareStatement(consultaSql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                int idCli = rs.getInt("idCliente");
                String nom = rs.getString("nombre");
                String ape = rs.getString("apellido");
                String fecNac = rs.getString("fechaNac");
                int numDoc = rs.getInt("numDoc");
                int tipDoc = rs.getInt("idTipoDoc");
                
                PreparedStatement ps2 = con.prepareCall("Select * from TiposDoc where idTipoDoc = ?");
                ps2.setInt(1,tipDoc);
                ResultSet rs2 = ps2.executeQuery();
                if(rs2.next())
                {
                    int idTipoDoc = rs2.getInt("idTipoDoc");
                    String descrip = rs2.getString("descripcion");
                    
                    tipoDocumento = new tipoDoc(idTipoDoc, descrip);
                }
                
                
                cliente = new Cliente(idCli, nom, ape, fecNac, numDoc, tipoDocumento );
            }
            rs.close();
            ps.close();
            cerrarCon();
                    
        } catch (SQLException ex) {
            System.out.println("Error en el metodo GetCliente por Id");
        }
         return cliente;
    }
    
    public tipoDoc getTipoDocxId(int id)
    {
        tipoDoc td = null;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("select * from TiposDoc where idTipoDoc = ? ");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                int idCli = rs.getInt("idTipoDoc");
                String desc = rs.getString("descripcion");
                
                td = new tipoDoc(idCli, desc);
            }
            rs.close();
            ps.close();
            cerrarCon();
                    
        } catch (SQLException ex) {
            System.out.println("Error en metodo getTipoDoc x ID");
            
        }
         return td;
    }
}
