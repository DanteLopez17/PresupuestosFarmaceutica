
package Modelo;


public class FormaPago {
    private int idFormaPago;
    private String descripcionFP;

    public FormaPago(int idFormaPago) {
        this.idFormaPago = idFormaPago;
    }

    public int getIdFormaPago() {
        return idFormaPago;
    }

    public void setIdFormaPago(int idFormaPago) {
        this.idFormaPago = idFormaPago;
    }

    public String getDescripcionFP() {
        return descripcionFP;
    }

    public void setDescripcionFP(String descripcionFP) {
        this.descripcionFP = descripcionFP;
    }

    public FormaPago(int idFormaPago, String descripcionFP) {
        this.idFormaPago = idFormaPago;
        this.descripcionFP = descripcionFP;
    }
    
    
}
