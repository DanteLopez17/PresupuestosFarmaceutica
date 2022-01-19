/*
Receta rec = new Receta(idReceta, cliente, profesional, fecha, obrasocial, formapago);
*/
package Dto;

import Modelo.Cliente;
import Modelo.FormaPago;
import Modelo.ObraSocial;
import Modelo.Profesional;
import Modelo.Receta;


public class DtoReporteUno {
    private Receta receta;
    private Cliente cliente;
    private Profesional profesional;
    private String fecha;
    private ObraSocial obrasocial;
    private FormaPago formapago;
    private String total;

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public DtoReporteUno(Receta receta, Cliente cliente, Profesional profesional, String fecha, ObraSocial obrasocial, FormaPago formapago, String total) {
        this.receta = receta;
        this.cliente = cliente;
        this.profesional = profesional;
        this.fecha = fecha;
        this.obrasocial = obrasocial;
        this.formapago = formapago;
        this.total = total;
    }
    
    

    

    public Receta getReceta() {
        return receta;
    }

    public void setReceta(Receta receta) {
        this.receta = receta;
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
