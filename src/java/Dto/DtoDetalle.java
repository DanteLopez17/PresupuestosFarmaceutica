
package Dto;

public class DtoDetalle {
    private int idDetalle;
    private int idSumin;
    private String descripcionSumin;
    private float precio;
    private int cantidad;
    private int idTipoSumin;
    private String descripcionTipoSumin;
    private int idClasif;
    private String descripcionClasif;

    public DtoDetalle(float precio, int cantidad, int idTipoSumin) {
        this.precio = precio;
        this.cantidad = cantidad;
        this.idTipoSumin = idTipoSumin;
    }

    public int getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(int idDetalle) {
        this.idDetalle = idDetalle;
    }

    public int getIdSumin() {
        return idSumin;
    }

    public void setIdSumin(int idSumin) {
        this.idSumin = idSumin;
    }

    public String getDescripcionSumin() {
        return descripcionSumin;
    }

    public void setDescripcionSumin(String descripcionSumin) {
        this.descripcionSumin = descripcionSumin;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getIdTipoSumin() {
        return idTipoSumin;
    }

    public void setIdTipoSumin(int idTipoSumin) {
        this.idTipoSumin = idTipoSumin;
    }

    public String getDescripcionTipoSumin() {
        return descripcionTipoSumin;
    }

    public void setDescripcionTipoSumin(String descripcionTipoSumin) {
        this.descripcionTipoSumin = descripcionTipoSumin;
    }

    public int getIdClasif() {
        return idClasif;
    }

    public void setIdClasif(int idClasif) {
        this.idClasif = idClasif;
    }

    public String getDescripcionClasif() {
        return descripcionClasif;
    }

    public void setDescripcionClasif(String descripcionClasif) {
        this.descripcionClasif = descripcionClasif;
    }

    public DtoDetalle(int idDetalle, int idSumin, String descripcionSumin, float precio, int cantidad, int idTipoSumin, String descripcionTipoSumin, int idClasif, String descripcionClasif) {
        this.idDetalle = idDetalle;
        this.idSumin = idSumin;
        this.descripcionSumin = descripcionSumin;
        this.precio = precio;
        this.cantidad = cantidad;
        this.idTipoSumin = idTipoSumin;
        this.descripcionTipoSumin = descripcionTipoSumin;
        this.idClasif = idClasif;
        this.descripcionClasif = descripcionClasif;
    }

    public DtoDetalle(int idSumin, String descripcionSumin, float precio, int cantidad, int idTipoSumin, String descripcionTipoSumin, int idClasif, String descripcionClasif) {
        this.idSumin = idSumin;
        this.descripcionSumin = descripcionSumin;
        this.precio = precio;
        this.cantidad = cantidad;
        this.idTipoSumin = idTipoSumin;
        this.descripcionTipoSumin = descripcionTipoSumin;
        this.idClasif = idClasif;
        this.descripcionClasif = descripcionClasif;
    }
    
    
}
