
package Dto;


public class DtoReceta {
    private int nroReceta;
    private String fecha;
    private String nomCompCliente;
    private String nomFormaPago;

    public DtoReceta(int nroReceta, String fecha, String nomCompCliente, String nomFormaPago) {
        this.nroReceta = nroReceta;
        this.fecha = fecha;
        this.nomCompCliente = nomCompCliente;
        this.nomFormaPago = nomFormaPago;
    }

    public int getNroReceta() {
        return nroReceta;
    }

    public void setNroReceta(int nroReceta) {
        this.nroReceta = nroReceta;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNomCompCliente() {
        return nomCompCliente;
    }

    public void setNomCompCliente(String nomCompCliente) {
        this.nomCompCliente = nomCompCliente;
    }

    public String getNomFormaPago() {
        return nomFormaPago;
    }

    public void setNomFormaPago(String nomFormaPago) {
        this.nomFormaPago = nomFormaPago;
    }
    
}
