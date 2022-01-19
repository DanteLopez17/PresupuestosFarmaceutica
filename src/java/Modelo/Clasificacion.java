
package Modelo;

public class Clasificacion {
    private int idClasifSum;
    private String descripcionClasif;

    public int getIdClasifSum() {
        return idClasifSum;
    }

    public void setIdClasifSum(int idClasifSum) {
        this.idClasifSum = idClasifSum;
    }

    public String getDescripcionClasif() {
        return descripcionClasif;
    }

    public void setDescripcionClasif(String descripcionClasif) {
        this.descripcionClasif = descripcionClasif;
    }

    public Clasificacion(int idClasifSum, String descripcionClasif) {
        this.idClasifSum = idClasifSum;
        this.descripcionClasif = descripcionClasif;
    }
    
    
}
