
package Modelo;

public class Sucursal {
    private int nroSucursal;
    private String calle;
    private int altura;
    private int telefono;
    private Localidad loc;

    public Sucursal(int nroSucursal, Localidad loc) {
        this.nroSucursal = nroSucursal;
        this.loc = loc;
    }

    
    public Sucursal(int nroSucursal, String calle, int altura, int telefono, Localidad loc) {
        this.nroSucursal = nroSucursal;
        this.calle = calle;
        this.altura = altura;
        this.telefono = telefono;
        this.loc = loc;
    }

    public Sucursal(String calle, int altura, int telefono, Localidad loc) {
        this.calle = calle;
        this.altura = altura;
        this.telefono = telefono;
        this.loc = loc;
    }

    public int getNroSucursal() {
        return nroSucursal;
    }

    public void setNroSucursal(int nroSucursal) {
        this.nroSucursal = nroSucursal;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public int getAltura() {
        return altura;
    }

    public void setAltura(int altura) {
        this.altura = altura;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public Localidad getLoc() {
        return loc;
    }

    public void setLoc(Localidad loc) {
        this.loc = loc;
    }
    
    
}
