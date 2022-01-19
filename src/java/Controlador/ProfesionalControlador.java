package Controlador;

import Modelo.Especialidad;
import Modelo.Profesional;
import Modelo.tipoDoc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProfesionalControlador {

    Connection con;
   /* private String cadena = "jdbc:sqlserver://localhost;databaseName=Farmaceutica";
    private String usuario = "sa";
    private String clave = "123456";*/
    GestorConexionBD gestor = new GestorConexionBD();

    public ProfesionalControlador() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProfesionalControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void abrirCon() {
        try {
            con = DriverManager.getConnection(gestor.getCadena(),gestor.getUsuario(),gestor.getClave());
            System.out.println("Conexion Abierta");
        } catch (SQLException ex) {
            Logger.getLogger(ProfesionalControlador.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error en la Conexion!");
        }
    }

    public void cerrarCon() {
        try {
            if (!con.isClosed() && con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProfesionalControlador.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al cerrar la Conexion!");
        }
    }

    public ArrayList<Especialidad> getEspecialidad() {
        ArrayList<Especialidad> lista = new ArrayList<>();
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Especialidad");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idEspecialidad");
                String desc = rs.getString("descripcion");
                lista.add(new Especialidad(id, desc));
            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
            System.out.println("Error en método get Especialidad");
        }

        return lista;
    }

    public void insertarProfesional(Profesional nvo) {
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("insert into Profesional values(?,?,?,?,?,?,?)");
            ps.setString(1, nvo.getNombreProf());
            ps.setString(2, nvo.getApellidoProf());
            ps.setInt(3, nvo.getNroMatriculaProf());
            ps.setString(4, nvo.getFecNacProf());
            ps.setInt(5, nvo.getNumDocProf());
            ps.setInt(6, nvo.getTipDocProf().getIdTipoDoc());
            ps.setInt(7, nvo.getEspeProf().getIdEspecialidad());

            ps.executeUpdate();

            ps.close();
            cerrarCon();
        } catch (SQLException e) {
            System.out.println("Error en método insertarProfesional");
        }
    }

    public Especialidad getEspecialidadxId(int id) {
        Especialidad es = null;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("select * from Especialidad where idEspecialidad = ? ");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int idEsp = rs.getInt("idEspecialidad");
                String desc = rs.getString("descripcion");

                es = new Especialidad(idEsp, desc);
            }
            rs.close();
            ps.close();
            cerrarCon();

        } catch (SQLException ex) {
            System.out.println("Error en metodo get especialidad x ID");

        }
        return es;
    }

    public ArrayList<Profesional> getListadoProfesional() {
        ArrayList<Profesional> lista = new ArrayList<>();
        try {
            abrirCon();
            tipoDoc tipoDocumento = null;
            Especialidad especialdad = null;

            PreparedStatement ps = con.prepareStatement("Select * from Profesional");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {


                int idP = rs.getInt("idProfesional");
                String nom = rs.getString("nombre");
                String ape = rs.getString("apellido");
                int nroMat = rs.getInt("nroMatricula");
                String fecNac = rs.getString("fechaNac");
                int numeroDoc = rs.getInt("numDoc");
                int idTip = rs.getInt("idTipoDoc");
                int idEspe = rs.getInt("idEspecialidad");

                PreparedStatement ps2 = con.prepareStatement("Select * from TiposDoc where idTipoDoc = ?");
                ps2.setInt(1, idTip);
                ResultSet rs2 = ps2.executeQuery();
                if (rs2.next()) {
                    int idTipoDoc = rs2.getInt("idTipoDoc");
                    String descrip = rs2.getString("descripcion");

                    tipoDocumento = new tipoDoc(idTipoDoc, descrip);
                    rs2.close();
                    ps2.close();
                }

                PreparedStatement ps3 = con.prepareStatement("Select * from Especialidad where idEspecialidad = ?");
                ps3.setInt(1, idEspe);
                ResultSet rs3 = ps3.executeQuery();
                if (rs3.next()) {
                    int idEsp = rs3.getInt("idEspecialidad");
                    String descri = rs3.getString("descripcion");

                    especialdad = new Especialidad(idEsp, descri);

                    rs3.close();
                    ps3.close();
                }

                Profesional p = new Profesional(idP, nom, ape, nroMat, fecNac, numeroDoc, tipoDocumento, especialdad);
                lista.add(p);

            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
            System.out.println("Error en método getListado de Profesionales");
        }

        return lista;
    }
    
    //Hacer el get Profesional por ID para terminar el Modificar Profesional
    public Profesional getProfesionalxID(int id)
    {
        Profesional profesional = null;
        try {
            abrirCon();
            tipoDoc tipoDocumento = null;
            Especialidad especialidad = null;
            String consultaSql = "Select p.idProfesional, p.nombre,\n" +
                                "	p.apellido, p.nroMatricula,\n" +
                                "	p.fechaNac, p.numDoc,\n" +
                                "	td.idTipoDoc as 'idTipoDoc', td.descripcion as 'tipoDocu',\n" +
                                "	e.idEspecialidad as 'idEspecialidad', e.descripcion as 'especialidad'\n" +
                                "from Profesional p join TiposDoc td on p.idTipoDoc = td.idTipoDoc\n" +
                                "					join Especialidad e on p.idEspecialidad = e.idEspecialidad\n" +
                                "where idProfesional = ?";
            PreparedStatement ps = con.prepareStatement(consultaSql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {

                int idTipDoc = rs.getInt("idTipoDoc");
                String descDoc = rs.getString("tipoDocu");
                tipoDocumento = new tipoDoc(idTipDoc, descDoc);
                
                int idEspec = rs.getInt("idEspecialidad");
                String espec = rs.getString("especialidad");
                especialidad = new Especialidad(idEspec,espec);
                
                
                int idPro = rs.getInt("idProfesional");
                String nom = rs.getString("nombre");
                String ape = rs.getString("apellido");
                int numMatr = rs.getInt("nroMatricula");
                String fecNac = rs.getString("fechaNac");
                int numDoc = rs.getInt("numDoc");
                  
                profesional = new Profesional(idPro, nom, ape, numMatr, fecNac, numDoc,tipoDocumento, especialidad);
            }
            rs.close();
            ps.close();
            cerrarCon();
                    
        } catch (SQLException ex) {
            System.out.println("Error en el metodo Get PROFESIONAL por Id");
        }
         return profesional;
    }
    
    public void modificarProfesional(Profesional nvo) {  
        try {
            abrirCon();

            PreparedStatement ps;
            ps = con.prepareStatement("Update Profesional\n" +
                                        "set nombre = ?,\n" +
                                        "	apellido = ?,\n" +
                                        "	nroMatricula = ?,\n" +
                                        "	fechaNac = ?,\n" +
                                        "	numDoc = ?,\n" +
                                        "	idTipoDoc = ?,\n" +
                                        "	idEspecialidad = ?\n" +
                                        "where idProfesional = ?");

            ps.setString(1,nvo.getNombreProf());
            ps.setString(2, nvo.getApellidoProf());
            ps.setInt(3, nvo.getNroMatriculaProf());
            ps.setString(4, nvo.getFecNacProf());
            ps.setInt(5, nvo.getNumDocProf());
            ps.setInt(6, nvo.getTipDocProf().getIdTipoDoc());
            ps.setInt(7, nvo.getEspeProf().getIdEspecialidad());
            ps.setInt(8,nvo.getIdProf());

            ps.executeUpdate();

            ps.close();


        } catch (SQLException ex) {
            System.out.println("Error en método modificar Profesional");
        }    
    }
    
    public void eliminarProfesional(int id){
        try {
            abrirCon();

            PreparedStatement ps;
            ps = con.prepareStatement("Delete Profesional where idProfesional = ?  ");
            ps.setInt(1,id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("Error en el eliminarProfesional");
        }
        finally{
        cerrarCon();
        }
    }
}
