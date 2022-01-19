
package Modelo;

public class Descuento {
    private int idDescuento;
    private float valorDesc;
    private int porcDesc;

    public Descuento(int idDescuento, float valorDesc, int porcDesc) {
        this.idDescuento = idDescuento;
        this.valorDesc = valorDesc;
        this.porcDesc = porcDesc;
    }

    public int getIdDescuento() {
        return idDescuento;
    }

    public void setIdDescuento(int idDescuento) {
        this.idDescuento = idDescuento;
    }

    public float getValorDesc() {
        return valorDesc;
    }

    public void setValorDesc(float valorDesc) {
        this.valorDesc = valorDesc;
    }

    public int getPorcDesc() {
        return porcDesc;
    }

    public void setPorcDesc(int porcDesc) {
        this.porcDesc = porcDesc;
    }

    public Descuento(float valorDesc, int porcDesc) {
        this.valorDesc = valorDesc;
        this.porcDesc = porcDesc;
    }
    
    
}
