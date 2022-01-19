
package Modelo;

public class ObraSocial {
    private int idObraSocial;
    private String descripcionOS;
    private String calle;
    private int altura;
    private int telefono;

    public ObraSocial(int idObraSocial) {
        this.idObraSocial = idObraSocial;
    }

    public int getIdObraSocial() {
        return idObraSocial;
    }

    public void setIdObraSocial(int idObraSocial) {
        this.idObraSocial = idObraSocial;
    }

    public String getDescripcionOS() {
        return descripcionOS;
    }

    public void setDescripcionOS(String descripcionOS) {
        this.descripcionOS = descripcionOS;
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

    public ObraSocial(int idObraSocial, String descripcionOS, String calle, int altura, int telefono) {
        this.idObraSocial = idObraSocial;
        this.descripcionOS = descripcionOS;
        this.calle = calle;
        this.altura = altura;
        this.telefono = telefono;
    }
    
    
}
