
package Controlador;

import Modelo.Clasificacion;
import Modelo.Suministro;
import Modelo.TipoSuministro;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SuministroControlador {
    Connection con;
   /* private String cadena = "jdbc:sqlserver://localhost;databaseName=Farmaceutica";
    private String usuario = "sa";
    private String clave = "123456";*/

    GestorConexionBD gestor = new GestorConexionBD();
    public SuministroControlador() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SuministroControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void abrirCon() {
        try {
            con = DriverManager.getConnection(gestor.getCadena(),gestor.getUsuario(),gestor.getClave());
            System.out.println("Conexion Abierta");
        } catch (SQLException ex) {
            Logger.getLogger(SuministroControlador.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error en la Conexion!");
        }
    }

    public void cerrarCon() {
        try {
            if (!con.isClosed() && con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(SuministroControlador.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al cerrar la Conexion!");
        }
    }
    
    public ArrayList<Clasificacion> getClasificacion() {
        ArrayList<Clasificacion> lista = new ArrayList<>();
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Clasificacion");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idClasificacion");
                String desc = rs.getString("descripcion");
                lista.add(new Clasificacion(id, desc));
            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
            System.out.println("Error en método get Clasificacion");
        }

        return lista;
    }
    public ArrayList<TipoSuministro> getTipoSuministro() {
        ArrayList<TipoSuministro> lista = new ArrayList<>();
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM TipoSum");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idTipoSum");
                String desc = rs.getString("descripcion");
                lista.add(new TipoSuministro(id, desc));
            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
            System.out.println("Error en método get Tipo de Suministro");
        }

        return lista;
    }
    
    public void insertarSuministro(Suministro nvo) {
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("insert into Suministro values(?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, nvo.getDescSum());
            ps.setFloat(2, nvo.getPrecSum());
            ps.setInt(3, nvo.getClasifSum().getIdClasifSum());
            ps.setInt(4, nvo.getTipoSum().getIdTipoSum());
            
            ps.executeUpdate();
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    nvo.setIdSuministro((int) generatedKeys.getLong(1));
                }
                else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }

            ps.close();
            cerrarCon();
        } catch (SQLException e) {

        }
    }
    
    public Clasificacion getClasificacionxId(int id) {
        Clasificacion cla = null;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("select * from Clasificacion where idClasificacion = ? ");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int idCla = rs.getInt("idClasificacion");
                String desc = rs.getString("descripcion");

                cla = new Clasificacion(idCla, desc);
            }
            rs.close();
            ps.close();
            cerrarCon();

        } catch (SQLException ex) {
            System.out.println("Error en metodo get especialidad x ID");

        }
        return cla;
    }
    public TipoSuministro getTipoSumxId(int id) {
        TipoSuministro tipSum = null;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("select * from TipoSum where idTipoSum = ? ");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int idTipSum = rs.getInt("idTipoSum");
                String desc = rs.getString("descripcion");

                tipSum = new TipoSuministro(idTipSum, desc);
            }
            rs.close();
            ps.close();
            cerrarCon();

        } catch (SQLException ex) {
            System.out.println("Error en metodo get especialidad x ID");

        }
        return tipSum;
    }
    
    public ArrayList<Suministro> getListadoSuministro() {
        ArrayList<Suministro> lista = new ArrayList<>();
        try {
            abrirCon();
            Clasificacion clasif = null;
            TipoSuministro tipSum = null;
            String consultaSQL = "Select s.idSuministro, s.descripcion,\n" +
                                "	 s.precioUnitario, s.idClasificacion as 'idClasificacion',\n" +
                                "	 s.idTipoSum as 'idTipoSum', c.descripcion as 'clasificacion',\n" +
                                "	 ts.descripcion as 'descTipoSum'\n" +
                                "from Suministro s join Clasificacion c on s.idClasificacion = c.idClasificacion\n" +
                                "				join TipoSum ts on s.idTipoSum = ts.idTipoSum";
            
            PreparedStatement ps = con.prepareStatement(consultaSQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {


                int idSum = rs.getInt("idSuministro");
                String desc = rs.getString("descripcion");
                float preUn = rs.getFloat("precioUnitario");
                int idCla = rs.getInt("idClasificacion");
                int idTipSum = rs.getInt("idTipoSum");
                String desClas = rs.getString("clasificacion");
                String descTiS = rs.getString("descTipoSum");

                clasif = new Clasificacion(idCla, desClas);
                tipSum = new TipoSuministro(idTipSum, descTiS);

                Suministro s = new Suministro(idSum, desc, preUn, clasif, tipSum);
                lista.add(s);

            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
            System.out.println("Error en método getListado de Profesionales");
        }

        return lista;
    }
    
    public Suministro getSuministroxID(int id)
    {
        Suministro suministro = null;
        try {
            abrirCon();
            Clasificacion clasificacion = null;
            TipoSuministro tipoSuministro = null;
            String consultaSql = "Select s.idSuministro, s.descripcion, s.precioUnitario,\n" +
                                "	s.idClasificacion as 'idClasificacion', c.descripcion as 'descClasificacion',\n" +
                                "	s.idTipoSum as 'idTipoSum', TS.descripcion as 'descTipoSum'\n" +
                                "from Suministro s join Clasificacion c on s.idClasificacion = c.idClasificacion\n" +
                                "				join TipoSum ts on s.idTipoSum = ts.idTipoSum\n" +
                                "where s.idSuministro = ?";
            PreparedStatement ps = con.prepareStatement(consultaSql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {

                int idSumi = rs.getInt("idSuministro");
                String descSumi = rs.getString("descripcion");
                float preUni = rs.getFloat("precioUnitario");
                int idClasif = rs.getInt("idClasificacion");
                String descClasif = rs.getString("descClasificacion");
                int idTipSum = rs.getInt("idTipoSum");
                String descTipSum = rs.getString("descTipoSum");
                
                clasificacion = new Clasificacion(idClasif, descClasif);
                tipoSuministro = new TipoSuministro(idTipSum, descTipSum);
                  
                suministro = new Suministro(idSumi, descSumi, preUni, clasificacion, tipoSuministro);
            }
            rs.close();
            ps.close();
            cerrarCon();
                    
        } catch (SQLException ex) {
            System.out.println("Error en el metodo Get Suministro por Id");
        }
         return suministro;
    }
    
    public void modificarSuministro(Suministro nvo) {  
        try {
            abrirCon();

            PreparedStatement ps;
            ps = con.prepareStatement("update Suministro set descripcion = ?, precioUnitario = ?, idClasificacion = ?, idTipoSum = ? where idSuministro = ?");

            ps.setString(1,nvo.getDescSum());

            ps.setFloat(2, nvo.getPrecSum());

            ps.setInt(3, nvo.getClasifSum().getIdClasifSum());

            ps.setInt(4, nvo.getTipoSum().getIdTipoSum());

            ps.setInt(5, nvo.getIdSuministro());
            ps.executeUpdate();

            ps.close();


        } catch (SQLException ex) {
            System.out.println("Error en método modificar Suministro");
        }    
    }
    
    public void eliminarSuministro(int id){
        try {
            abrirCon();
            PreparedStatement ps;
            ps = con.prepareStatement("Delete Suministro where idSuministro = ?");
            ps.setInt(1,id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("Error en el eliminarSuministro");
        }
        finally{
        cerrarCon();
        }
        
        System.out.println("PROFE EL ELIMINAR SUMINISTRO NO FUNCIONA POR LA RESTRICCION DE CLAVE FORANEA");
    }
    
    public float getPrecioSuministroxID(int id)
    {
        float precio = 0;
        try {
            abrirCon();
            String consultaSql = "Select precioUnitario from Suministro where idSuministro = ?";
            PreparedStatement ps = con.prepareStatement(consultaSql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {

                 precio = rs.getFloat("precioUnitario");
                 
            }
            rs.close();
            ps.close();
            cerrarCon();
                    
        } catch (SQLException ex) {
            System.out.println("Error en el metodo Get Precio de Suministro por Id");
        }
         return precio;
    }
}
