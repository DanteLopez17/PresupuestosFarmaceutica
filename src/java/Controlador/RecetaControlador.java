package Controlador;

import Dto.DtoDetalle;
import Modelo.Clasificacion;
import Modelo.Cliente;
import Modelo.Cobertura;
import Modelo.Descuento;
import Modelo.DetalleReceta;
import Modelo.FormaPago;
import Modelo.Localidad;
import Modelo.ObraSocial;
import Modelo.Profesional;
import Modelo.Receta;
import Modelo.Sucursal;
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

public class RecetaControlador {

    Connection con;
    /*  private String cadena = "jdbc:sqlserver://localhost;databaseName=Farmaceutica";
    private String usuario = "sa";
    private String clave = "123456";*/

    GestorConexionBD gestor = new GestorConexionBD();

    public RecetaControlador() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RecetaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void abrirCon() {
        try {
            con = DriverManager.getConnection(gestor.getCadena(), gestor.getUsuario(), gestor.getClave());
            System.out.println("Conexion Abierta");
        } catch (SQLException ex) {
            Logger.getLogger(RecetaControlador.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error en la Conexion!");
        }
    }

    public void cerrarCon() {
        try {
            if (!con.isClosed() && con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(RecetaControlador.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al cerrar la Conexion!");
        }
    }

    public ArrayList<ObraSocial> getObrasSociales() {
        ArrayList<ObraSocial> lista = new ArrayList<>();
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select * from ObraSocial");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idOs = rs.getInt("idObraSocial");
                String desOs = rs.getString("descripcion");
                String calle = rs.getString("calle");
                int alt = rs.getInt("altura");
                int tel = rs.getInt("telefono");

                ObraSocial os = new ObraSocial(idOs, desOs, calle, alt, tel);
                lista.add(os);
            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
            System.out.println("Error en método getObras Sociales");
        }

        return lista;
    }

    public ArrayList<FormaPago> getFormasDePago() {
        ArrayList<FormaPago> lista = new ArrayList<>();
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select * from FormaPago");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idFp = rs.getInt("idFormaPago");
                String desFp = rs.getString("descripcion");

                FormaPago fp = new FormaPago(idFp, desFp);
                lista.add(fp);
            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
            System.out.println("Error en método get Formas de Pago");
        }

        return lista;
    }

    public ObraSocial getObraSocialxId(int id) {
        ObraSocial obrasocial = null;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select * from ObraSocial where idObraSocial = ? ");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int idObS = rs.getInt("idObraSocial");
                String descObs = rs.getString("descripcion");
                String calle = rs.getString("calle");
                int alt = rs.getInt("altura");
                int tel = rs.getInt("telefono");

                obrasocial = new ObraSocial(idObS, descObs, calle, alt, tel);
            }
            rs.close();
            ps.close();
            cerrarCon();

        } catch (SQLException ex) {
            System.out.println("Error en metodo getobrasocial x ID");

        }
        return obrasocial;
    }

    public FormaPago getFormaPagoxId(int id) {
        FormaPago formapago = null;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select * from FormaPago where idFormaPago = ? ");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int idFP = rs.getInt("idFormaPago");
                String descFP = rs.getString("descripcion");

                formapago = new FormaPago(idFP, descFP);
            }
            rs.close();
            ps.close();
            cerrarCon();

        } catch (SQLException ex) {
            System.out.println("Error en metodo get formapago x ID");

        }
        return formapago;
    }

    public ArrayList<DtoDetalle> getListadoDetallesDto() {
        ArrayList<DtoDetalle> lista = new ArrayList<>();
        try {
            abrirCon();

            String consultaSQL = "Select dt.idDetalle as 'idDetalle', dt.idSum as 'idSum',\n"
                    + "		s.descripcion as 'descSum', dt.prec as 'prec', dt.cant as 'cant', s.idTipoSum as 'idTipoSum',\n"
                    + "		ts.descripcion as 'descTipoSumi', s.idClasificacion as 'idClasificacion',\n"
                    + "		c.descripcion as 'descClasi'\n"
                    + "From DetallesTran dt join Suministro s on dt.idSum = s.idSuministro\n"
                    + "				join TipoSum ts on s.idTipoSum = ts.idTipoSum\n"
                    + "				join Clasificacion c on s.idClasificacion = c.idClasificacion";

            PreparedStatement ps = con.prepareStatement(consultaSQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idDetalle = rs.getInt("idDetalle");
                int idSumin = rs.getInt("idSum");
                String descSumin = rs.getString("descSum");
                float preUn = rs.getFloat("prec");
                int cant = rs.getInt("cant");
                int idTipSum = rs.getInt("idTipoSum");
                String descTipSum = rs.getString("descTipoSumi");
                int idClas = rs.getInt("idClasificacion");
                String descClas = rs.getString("descClasi");

                DtoDetalle dd = new DtoDetalle(idDetalle, idSumin, descSumin, preUn, cant, idTipSum, descTipSum, idClas, descClas);
                lista.add(dd);
            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
            System.out.println("Error en método getListado de Detalles Dto");
        }

        return lista;
    }

    public void insertarDtoDetalle(DtoDetalle nvo) {
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("insert into DetallesTran (idSum, prec, cant) values(?,?,?)");
            ps.setInt(1, nvo.getIdSumin());
            ps.setFloat(2, nvo.getPrecio());
            ps.setInt(3, nvo.getCantidad());

            ps.executeUpdate();
            ps.close();
            cerrarCon();
        } catch (SQLException e) {

        }
    }

    public void insertarCabeceraReceta(Receta nvo) {
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Insert into Receta (idCliente, idProfesional, fecha, idObraSocial, idFormaPago, nroSucursal) values(?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, nvo.getCliente().getIdCliente());
            ps.setInt(2, nvo.getProfesional().getIdProf());
            ps.setString(3, nvo.getFecha());
            ps.setInt(4, nvo.getObrasocial().getIdObraSocial());
            ps.setInt(5, nvo.getFormapago().getIdFormaPago());
            ps.setInt(6, nvo.getSucursal().getNroSucursal());

            ps.executeUpdate();
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    nvo.setIdReceta((int) generatedKeys.getLong(1));
                } else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
            ps.close();
            cerrarCon();
        } catch (SQLException e) {
            System.out.println("Error en método insertarCabeceraReceta");
        }
    }

    public void insertarDetalles(DetalleReceta nvo) {
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("insert into DetalleReceta(idReceta,cantidad, precio, idSuministro, descuento) values(?,?, ?, ?, ?)");
            ps.setInt(1, nvo.getReceta().getIdReceta());
            ps.setInt(2, nvo.getCantidad());
            ps.setFloat(3, nvo.getPrecio());
            ps.setInt(4, nvo.getSuministro().getIdSuministro());
            ps.setDouble(5, nvo.getDescuento());

            ps.executeUpdate();
            ps.close();
            cerrarCon();
        } catch (SQLException e) {
            System.out.println("Error en el insertarDetalles");
        }
    }
    
    

    public ArrayList<DetalleReceta> getDetallesReceta(int idRec) {
        ArrayList<DetalleReceta> lista = new ArrayList<>();
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select dr.idDetalleReceta as 'idDetalleReceta', dr.idReceta as 'idReceta', dr.cantidad as 'cantidad',\n"
                    + "  dr.precio as 'precio', dr.idSuministro as 'idSuministro', s.precioUnitario as 'preUnit',\n"
                    + "   s.descripcion as 'descSumin', s.idClasificacion as 'idClasificacion',\n"
                    + "    s.idTipoSum as 'idTipoSum', dr.descuento,  ts.descripcion as 'descTipoSum',\n"
                    + "    c.descripcion as 'descClasif'\n"
                    + "from DetalleReceta dr join Suministro s on dr.idSuministro = s.idSuministro\n"
                    + "   join TipoSum ts on s.idTipoSum = ts.idTipoSum\n"
                    + "   join Clasificacion c on s.idClasificacion = c.idClasificacion\n"
                    + "where idReceta = ?");
            ps.setInt(1, idRec);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idDr = rs.getInt("idDetalleReceta");
                int idReceta = rs.getInt("idReceta");
                int cant = rs.getInt("cantidad");
                float pre = rs.getFloat("precio");
                int idSum = rs.getInt("idSuministro");
                float preUnit = rs.getFloat("preUnit");
                String descSum = rs.getString("descSumin");
                int idClas = rs.getInt("idClasificacion");
                int tipoSum = rs.getInt("idTipoSum");
                float descu = rs.getFloat("descuento");
                String descTipSum = rs.getString("descTipoSum");
                String descClas = rs.getString("descClasif");
                
                TipoSuministro ts = new TipoSuministro(tipoSum, descTipSum);
                Clasificacion c = new Clasificacion(idClas, descClas);
                Suministro s = new Suministro(idSum, descSum, pre, c, ts);

                Receta receta = this.getRectaXId(idReceta);

                DetalleReceta dr = new DetalleReceta(idDr, receta, cant, pre, s, descu, preUnit);

                lista.add(dr);
            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
            System.out.println("Error en método getDetallesReceta");
        }

        return lista;
    }

    public ArrayList<Receta> getListadoReceta() {
        ArrayList<Receta> listado = new ArrayList<>();
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("select * from listadoRecetas order by idReceta desc");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int idReceta = rs.getInt("idReceta");
                int idCliente = rs.getInt("idCliente");
                String apellidoCliente = rs.getString("apeCliente");
                String nombreCliente = rs.getString("nomCliente");
                int idProfesional = rs.getInt("idProfesional");
                String apellidoProfesional = rs.getString("apeProf");
                String nombreProfesional = rs.getString("nomProf");
                String fec = rs.getString("fecha");
                int idObraSocial = rs.getInt("idObraSocial");
                String descObraSocial = rs.getString("ObraSocial");
                int idForPa = rs.getInt("idFormaPago");
                String descForPa = rs.getString("FormaPago");
                float descTiS = rs.getFloat("Total");

                ClienteControlador cliCon = new ClienteControlador();
                Cliente c = cliCon.getClientexId(idCliente);
                ProfesionalControlador proCon = new ProfesionalControlador();
                Profesional p = proCon.getProfesionalxID(idProfesional);
                ObraSocial o = this.getObraSocialxId(idObraSocial);
                FormaPago f = this.getFormaPagoxId(idForPa);

                Receta receta = new Receta(idReceta, c, p, fec, o, f);

                listado.add(receta);

            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
        }
        return listado;
    }

    public Receta getRectaXId(int idRece) {
        Receta receta = null;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select * From Receta where idReceta = ?");
            ps.setInt(1, idRece);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int idRecet = rs.getInt("idReceta");
                int idCli = rs.getInt("idCliente");
                int idPro = rs.getInt("idProfesional");
                String fec = rs.getString("fecha");
                int idObs = rs.getInt("idObraSocial");
                int idFormp = rs.getInt("idFormaPago");
                int nroSuc = rs.getInt("nroSucursal");

                ClienteControlador cliCon = new ClienteControlador();
                Cliente cliente = cliCon.getClientexId(idCli);
                ProfesionalControlador proCon = new ProfesionalControlador();
                Profesional profesional = proCon.getProfesionalxID(idPro);
                ObraSocial obrasocial = this.getObraSocialxId(idObs);
                FormaPago formapago = this.getFormaPagoxId(idFormp);
                StockxSucControlador sxs = new StockxSucControlador();
                Sucursal sucursal = sxs.getSucursalxId(nroSuc);

                receta = new Receta(idRecet, cliente, profesional, fec, obrasocial, formapago, sucursal);
            }
            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
        }
        return receta;
    }

    public DetalleReceta getDetalleRecetaXId(int idDetalle) {
        DetalleReceta detallereceta = null;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select * from DetalleReceta where idDetalleReceta = ?");
            ps.setInt(1, idDetalle);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int idDeta = rs.getInt("idDetalleReceta");
                int idRece = rs.getInt("idReceta");
                int cant = rs.getInt("cantidad");
                float pre = rs.getFloat("precio");
                int idSum = rs.getInt("idSuministro");

                Receta receta = this.getRectaXId(idRece);
                SuministroControlador sumCon = new SuministroControlador();
                Suministro suministro = sumCon.getSuministroxID(idSum);

                detallereceta = new DetalleReceta(idDetalle, receta, cant, pre, suministro);
            }
            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
        }
        return detallereceta;
    }

    public Cobertura tieneDescuento(int idLocal, int idObr, int idSum) {
        Cobertura cobertura = null;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select * from Cobertura where idObraSocial = ? and idSuministro = ? and idLocalidad = ?");
            ps.setInt(1, idObr);
            ps.setInt(2, idSum);
            ps.setInt(3, idLocal);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int idOB = rs.getInt("idObraSocial");
                int idSU = rs.getInt("idSuministro");
                int idLoca = rs.getInt("idLocalidad");
                int descu = rs.getInt("descuento");
                int idDescuento = rs.getInt("idDescuento");

                ObraSocial obrasocial = this.getObraSocialxId(idOB);
                SuministroControlador sumCon = new SuministroControlador();
                Suministro suministro = sumCon.getSuministroxID(idSU);
                StockxSucControlador sxs = new StockxSucControlador();
                Localidad localidad = sxs.getLocalidadxId(idLoca);
                Descuento descuento = this.getDescuentosXId(idDescuento);
                
                cobertura = new Cobertura(obrasocial, suministro, localidad, descu, descuento);
                
            }
            rs.close();
            ps.close();
            cerrarCon();

        } catch (Exception e) {
            System.out.println("ERROR EN EL TIENE DESCUENTO RECETA CONTROLADOR");
        }

        return cobertura;
    }

    public ArrayList<Localidad> getListadoLocalidades() {
        ArrayList<Localidad> listado = new ArrayList<>();
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("select * from Localidad");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int idLoca = rs.getInt("idLocalidad");
                String nom = rs.getString("nombre");

                Localidad loc = new Localidad(idLoca, nom);

                listado.add(loc);

            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
        }
        return listado;
    }

    public void insertarCobertura(Cobertura nvo) {
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("insert into Cobertura (idObraSocial, idSuministro, idLocalidad, descuento, idDescuento) values(?,?,?,?,?)");
            ps.setInt(1, nvo.getObrasocial().getIdObraSocial());
            ps.setInt(2, nvo.getSuministro().getIdSuministro());
            ps.setInt(3, nvo.getLocalidad().getIdLocalidad());
            ps.setInt(4, nvo.getDescuento());
            ps.setInt(5, nvo.getDescu().getIdDescuento());
            ps.executeUpdate();
            ps.close();
            cerrarCon();

        } catch (Exception e) {
            
        }
    }

    public void editarCobertura(Cobertura nvo) {
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("update Cobertura set idDescuento = ?, descuento = ? where idObraSocial = ? and idSuministro = ? and idLocalidad = ?");
            ps.setInt(1, nvo.getDescu().getIdDescuento());
            ps.setInt(2, nvo.getDescuento());
            ps.setInt(3, nvo.getObrasocial().getIdObraSocial());
            ps.setInt(4, nvo.getSuministro().getIdSuministro());
            ps.setInt(5, nvo.getLocalidad().getIdLocalidad());

            ps.executeUpdate();
            ps.close();
            cerrarCon();

        } catch (Exception e) {
            System.out.println("ERROR EN EDITAR COBERTURA CONTROLADOR RECETA");
        }
    }
    
    public Descuento getDescuentosXId(int id) {
        Descuento descuento = null;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select * from Descuento where idDescuento = ? ");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int idDesc = rs.getInt("idDescuento");
                float val = rs.getFloat("valor");
                int porc = rs.getInt("porcentaje");

                descuento = new Descuento(idDesc, val, porc);
            }
            rs.close();
            ps.close();
            cerrarCon();

        } catch (SQLException ex) {
            System.out.println("Error en metodo get Descuentos x ID");

        }
        return descuento;
    }

    public ArrayList<Cobertura> getListadoCoberturas() {
        ArrayList<Cobertura> listado = new ArrayList<>();
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("select * from Cobertura where descuento = 1");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int idObrS = rs.getInt("idObraSocial");
                int idSumin = rs.getInt("idSuministro");
                int idLoc = rs.getInt("idLocalidad");
                int desc = rs.getInt("descuento");
                int idDesc = rs.getInt("idDescuento");

                RecetaControlador recCon = new RecetaControlador();
                ObraSocial obrasocial = recCon.getObraSocialxId(idObrS);

                SuministroControlador sumCon = new SuministroControlador();
                Suministro suministro = sumCon.getSuministroxID(idSumin);
                StockxSucControlador sxs = new StockxSucControlador();
                Localidad localidad = sxs.getLocalidadxId(idLoc);
                
                Descuento descuento = this.getDescuentosXId(idDesc);

                Cobertura loc = new Cobertura(obrasocial, suministro, localidad, desc, descuento);

                listado.add(loc);

            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
            System.out.println("ERROR EN GET LISTADO COBERTURAS ");
        }
        return listado;
    }
    public ArrayList<Descuento> getDescuentos() {
        ArrayList<Descuento> lista = new ArrayList<>();
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select * from Descuento ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idDesc = rs.getInt("idDescuento");
                float val = rs.getFloat("valor");
                int porc = rs.getInt("porcentaje");

                Descuento descuento = new Descuento(idDesc, val, porc);
                lista.add(descuento);
            }

            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
            System.out.println("Error en método get Descuentos RecetaControlador");
        }
        return lista;
    }

    public double mostrarTotalReceta(int idRece) {
        double total = 0;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select SUM((cantidad * precio)- descuento) as 'Total' from DetalleReceta where idReceta = ?");
            ps.setInt(1, idRece);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("Total");
            }
            rs.close();
            ps.close();
            cerrarCon();
        } catch (Exception e) {
            System.out.println("ERROR EN EL METODO MOSTRAR TOTAL DE LA RECETA");
        }
        return total;
    }

    public void eliminarDetalle(int idDetRec) {
        try {
            abrirCon();

            PreparedStatement ps;
            ps = con.prepareStatement("delete DetalleReceta where idDetalleReceta = ?");
            ps.setInt(1, idDetRec);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("Error en el eliminarDetalle");
        } finally {
            cerrarCon();
        }
    }

    public int existe(int idRec, int idSum) {
        int exist = 0;
        try {
            abrirCon();
            PreparedStatement ps = con.prepareStatement("Select idSuministro from DetalleReceta where idReceta = ? and idSuministro = ?");
            ps.setInt(1, idRec);
            ps.setInt(2, idSum);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                exist = rs.getInt("idSuministro");

            }
            rs.close();
            ps.close();
            cerrarCon();

        } catch (Exception e) {
            System.out.println("ERROR EN EL METODO EXISTE RECETA CONTROLADOR");
        }

        return exist;
    }

}
