
package Dto;

import Modelo.Sucursal;

public class DtoReporteCinco {
    private Sucursal sucursal;
    private int canti;
    private String totCliente;
    private String totObrSoc;

    public DtoReporteCinco(Sucursal sucursal, int canti, String totCliente, String totObrSoc) {
        this.sucursal = sucursal;
        this.canti = canti;
        this.totCliente = totCliente;
        this.totObrSoc = totObrSoc;
    }

    public Sucursal getSucursal() {
        return sucursal;
    }

    public void setSucursal(Sucursal sucursal) {
        this.sucursal = sucursal;
    }

    public int getCanti() {
        return canti;
    }

    public void setCanti(int canti) {
        this.canti = canti;
    }

    public String getTotCliente() {
        return totCliente;
    }

    public void setTotCliente(String totCliente) {
        this.totCliente = totCliente;
    }

    public String getTotObrSoc() {
        return totObrSoc;
    }

    public void setTotObrSoc(String totObrSoc) {
        this.totObrSoc = totObrSoc;
    }
    
    
}
