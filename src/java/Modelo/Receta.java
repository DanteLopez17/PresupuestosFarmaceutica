
package Modelo;

import java.util.ArrayList;

public class Receta {
    private int idReceta;
    private Cliente cliente;
    private Profesional profesional;
    private String fecha;
    private ObraSocial obrasocial;
    private FormaPago formapago;
    private Sucursal sucursal;

    public Receta(int idReceta, Cliente cliente, Profesional profesional, String fecha, ObraSocial obrasocial, FormaPago formapago, Sucursal sucursal) {
        this.idReceta = idReceta;
        this.cliente = cliente;
        this.profesional = profesional;
        this.fecha = fecha;
        this.obrasocial = obrasocial;
        this.formapago = formapago;
        this.sucursal = sucursal;
    }

    public Receta(Cliente cliente, Profesional profesional, String fecha, ObraSocial obrasocial, FormaPago formapago, Sucursal sucursal) {
        this.cliente = cliente;
        this.profesional = profesional;
        this.fecha = fecha;
        this.obrasocial = obrasocial;
        this.formapago = formapago;
        this.sucursal = sucursal;
    }

    public Sucursal getSucursal() {
        return sucursal;
    }

    public void setSucursal(Sucursal sucursal) {
        this.sucursal = sucursal;
    }
    


  /*  private ArrayList<DetalleReceta> listadoDetalles;

    public ArrayList<DetalleReceta> getListadoDetalles() {
        return listadoDetalles;
    }

    public void setListadoDetalles(ArrayList<DetalleReceta> listadoDetalles) {
        this.listadoDetalles = listadoDetalles;
    }

    public Receta() {
        listadoDetalles = new ArrayList<>();
    }*/
    
    public Receta(int idReceta) {
        this.idReceta = idReceta;
    }

    public Receta(Cliente cliente, Profesional profesional, String fecha, ObraSocial obrasocial, FormaPago formapago) {
        this.cliente = cliente;
        this.profesional = profesional;
        this.fecha = fecha;
        this.obrasocial = obrasocial;
        this.formapago = formapago;
    }

    public Receta(int idReceta, Cliente cliente, Profesional profesional, String fecha, ObraSocial obrasocial, FormaPago formapago) {
        this.idReceta = idReceta;
        this.cliente = cliente;
        this.profesional = profesional;
        this.fecha = fecha;
        this.obrasocial = obrasocial;
        this.formapago = formapago;
    }

    public int getIdReceta() {
        return idReceta;
    }

    public void setIdReceta(int idReceta) {
        this.idReceta = idReceta;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Profesional getProfesional() {
        return profesional;
    }

    public void setProfesional(Profesional profesional) {
        this.profesional = profesional;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public ObraSocial getObrasocial() {
        return obrasocial;
    }

    public void setObrasocial(ObraSocial obrasocial) {
        this.obrasocial = obrasocial;
    }

    public FormaPago getFormapago() {
        return formapago;
    }

    public void setFormapago(FormaPago formapago) {
        this.formapago = formapago;
    }
    
    
}
