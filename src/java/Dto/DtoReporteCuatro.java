
package Dto;

import Modelo.Localidad;
import Modelo.Sucursal;
import Modelo.Suministro;

public class DtoReporteCuatro {
    private Suministro suministro;
    private Localidad localidad;
    private Sucursal sucursal;
    private int stock;

    public DtoReporteCuatro(Suministro suministro, Localidad localidad, Sucursal sucursal, int stock) {
        this.suministro = suministro;
        this.localidad = localidad;
        this.sucursal = sucursal;
        this.stock = stock;
    }

    public Suministro getSuministro() {
        return suministro;
    }

    public void setSuministro(Suministro suministro) {
        this.suministro = suministro;
    }

    public Localidad getLocalidad() {
        return localidad;
    }

    public void setLocalidad(Localidad localidad) {
        this.localidad = localidad;
    }

    public Sucursal getSucursal() {
        return sucursal;
    }

    public void setSucursal(Sucursal sucursal) {
        this.sucursal = sucursal;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    
}
