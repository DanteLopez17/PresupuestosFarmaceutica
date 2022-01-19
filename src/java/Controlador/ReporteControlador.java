package Controlador;

import Dto.DtoReporteCinco;
import Dto.DtoReporteCuatro;
import Dto.DtoReporteDos;
import Dto.DtoReporteTres;
import Dto.DtoReporteUno;
import Modelo.Cliente;
import Modelo.FormaPago;
import Modelo.Localidad;
import Modelo.ObraSocial;
import Modelo.Profesional;
import Modelo.Receta;
import Modelo.Sucursal;
import Modelo.Suministro;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ReporteControlador {

    Connection con;
  /*  private String cadena = "jdbc:sqlserver://localhost;databaseName=Farmaceutica";
    private String usuario = "sa";
    private String clave = "123456";*/
GestorConexionBD gestor = new GestorConexionBD();
    public ReporteControlador() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReporteControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void abrirCon() {
        try {
            con = DriverManager.getConnection(gestor.getCadena(),gestor.getUsuario(),gestor.getClave());
            System.out.println("Conexion Abierta");
        } catch (SQLException ex) {
            Logger.getLogger(ReporteControlador.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error en la Conexion!");
        }
    }

    public void cerrarCon() {
        try {
            if (!con.isClosed() && con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReporteControlador.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al cerrar la Conexion!");
        }
    }
    
    public ArrayList<DtoReporteUno> getRecetasXunProfesional(int idProfesional){
        ArrayList<DtoReporteUno> lista = new ArrayList<>();
        try {
            abrirCon();
            String consultaSql= "Select dr.idReceta, r.idCliente, r.idProfesional, r.fecha, r.idObraSocial, r.idFormaPago,\n" +
                                "sum(precio * cantidad)  as 'total' from Receta r join DetalleReceta dr on r.idReceta = dr.idReceta\n" +
                                "where r.idProfesional = ?\n" +
                                "group by dr.idReceta, r.idCliente, r.idProfesional, r.fecha, r.idObraSocial, r.idFormaPago";

            PreparedStatement ps = con.prepareStatement(consultaSql);
            ps.setInt(1, idProfesional);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idReceta = rs.getInt("idReceta");
                int idCli = rs.getInt("idCliente");
                int idPro = rs.getInt("idProfesional");
                String fecha = rs.getString("fecha");  
                int idObr = rs.getInt("idObraSocial");  
                int idFor = rs.getInt("idFormaPago");
                double tota = rs.getDouble("total");
                
                DecimalFormat df = new DecimalFormat("#.00");
                String total = df.format(tota);
                ClienteControlador cliCon = new ClienteControlador();
                Cliente cliente = cliCon.getClientexId(idCli);
                ProfesionalControlador proCon = new ProfesionalControlador();
                Profesional profesional = proCon.getProfesionalxID(idPro);
                RecetaControlador recCon = new RecetaControlador();
                ObraSocial obrasocial = recCon.getObraSocialxId(idObr);
                FormaPago formapago = recCon.getFormaPagoxId(idFor);
                Receta receta = recCon.getRectaXId(idReceta);
                
                DtoReporteUno dtoReUn = new DtoReporteUno(receta, cliente, profesional, fecha, obrasocial, formapago, total);
                lista.add(dtoReUn);
            }
            rs.close();
            ps.close();
            cerrarCon();  
        } catch (Exception e) {
            System.out.println("Error en el metodo get Receta x un Profesional");
        }
        return lista;
    }
    
    public ArrayList<DtoReporteDos> getCantRecetProfesionales()
    {
        ArrayList<DtoReporteDos> lista = new ArrayList<>();
        try {
            abrirCon();
            String consultaSQL = "Select p.apellido + ', ' + p.nombre as 'Profesional',\n" +
                                "	count(distinct r.idReceta) as 'Cantidad'\n" +
                                "from Profesional p join Receta r on p.idProfesional = r.idProfesional\n" +
                                "group by p.apellido, p.nombre\n" +
                                "order by 2 desc";
            PreparedStatement ps = con.prepareStatement(consultaSQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String prof = rs.getString("Profesional");
                int cant = rs.getInt("Cantidad");

                DtoReporteDos dtoRd = new DtoReporteDos(prof, cant);
                lista.add(dtoRd);
            }
            rs.close();
            ps.close();
            cerrarCon();  
            
        } catch (Exception e) {
            System.out.println("Error en el metodo Cantidad de Recetas ordenado");
        }
        return lista;
    }
    
    public ArrayList<DtoReporteTres> getTotalAcumuladoClientes()
    {
        ArrayList<DtoReporteTres> lista = new ArrayList<>();
        try {
            abrirCon();
            String consultaSQL = "Select r.idCliente, sum((precio * cantidad) - descuento) total\n" +
                                "from DetalleReceta dr join Receta r on dr.idReceta = dr.idReceta\n" +
                                "group by r.idCliente\n" +
                                "order by total desc";
            PreparedStatement ps = con.prepareStatement(consultaSQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idCli = rs.getInt("idCliente");
                double tot = rs.getDouble("total");
                
                DecimalFormat df = new DecimalFormat("#.00");
                String num = df.format(tot);
                
                ClienteControlador cliCon = new ClienteControlador();
                Cliente cliente = cliCon.getClientexId(idCli);

                DtoReporteTres dtoRt = new DtoReporteTres(cliente, num);
                lista.add(dtoRt);
            }
            rs.close();
            ps.close();
            cerrarCon();  
            
        } catch (Exception e) {
            System.out.println("Error en el metodo Listado total Acumulado Clientes");
        }
        return lista;
    }
    
    public ArrayList<DtoReporteCuatro> getProductosSinStock(){
        ArrayList<DtoReporteCuatro> listado = new ArrayList<>();
        try {
            abrirCon();
            String consultaSql= "Select dr.idSuministro, st.nroSucursal,su.idLocalidad,  sum(dr.cantidad) as 'faltante'\n" +
                                "From DetalleReceta dr join Suministro s on dr.idSuministro = s.idSuministro\n" +
                                "     join StockSumXSucur st on s.idSuministro = st.idSuministro\n" +
                                "     join Sucursal su on su.nroSucursal = st.nroSucursal\n" +
                                "     group by dr.idSuministro, st.nroSucursal, su.idLocalidad\n" +
                                "having sum(dr.cantidad) > (Select sum(sxs.Stock) \n" +
                                "                            from StockSumXSucur sxs\n" +
                                "                           where sxs.idSuministro = dr.idSuministro)";
            PreparedStatement ps = con.prepareStatement(consultaSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idSum = rs.getInt("idSuministro");
                int nroSuc = rs.getInt("nroSucursal");
                int idLoc = rs.getInt("idLocalidad");
                int falt = rs.getInt("faltante");

                StockxSucControlador stoxsucCon = new StockxSucControlador();
                Localidad localidad = stoxsucCon.getLocalidadxId(idLoc);
                
                Sucursal sucursal = stoxsucCon.getSucursalxId(nroSuc);
                
                SuministroControlador sumCon = new SuministroControlador();
                Suministro sumin = sumCon.getSuministroxID(idSum);

                DtoReporteCuatro dtoRc = new DtoReporteCuatro(sumin, localidad, sucursal, falt);
                listado.add(dtoRc);
            }
            rs.close();
            ps.close();
            cerrarCon();  
        } catch (Exception e) {
            System.out.println("Error en el metodo PRODUCTOS SIN STOCK");
        }
        
        return listado;
        
    }
    
    public ArrayList<DtoReporteCinco> getRecetasPorSucursal()
    {
        ArrayList<DtoReporteCinco> lista = new ArrayList<>();
        
        try {
            abrirCon();
            String consulta = "Select count(r.idReceta) as 'cantidad', r.nroSucursal, sum(dr.cantidad * dr.precio ) - sum(dr.descuento) as 'totalCliente',\n" +
"	sum(descuento) as 'totalObraSocial' from Receta r join DetalleReceta dr on r.idReceta = dr.idReceta group by r.nroSucursal";
            PreparedStatement ps = con.prepareStatement(consulta);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int cant = rs.getInt("cantidad");
                int numSuc = rs.getInt("nroSucursal");
                double totCli = rs.getDouble("totalCliente");
                double totObS = rs.getDouble("totalObraSocial");
                StockxSucControlador stoxsucCon = new StockxSucControlador();
                
                Sucursal sucursal = stoxsucCon.getSucursalxId(numSuc);
                
                DecimalFormat df = new DecimalFormat("#.00");
                String totalCli = df.format(totCli);
                String totalObs = df.format(totObS);
                
                
                DtoReporteCinco dtoRc = new DtoReporteCinco(sucursal, cant, totalCli, totalObs);

                lista.add(dtoRc);
            }
            rs.close();
            ps.close();
            cerrarCon();  
            
        } catch (Exception e) {
        }
        
        return lista;
        
    }
    
    
}
