
package Modelo;


public class TipoSuministro {
    private int idTipoSum;
    private String descripcionSum;

    public int getIdTipoSum() {
        return idTipoSum;
    }

    public void setIdTipoSum(int idTipoSum) {
        this.idTipoSum = idTipoSum;
    }

    public String getDescripcionSum() {
        return descripcionSum;
    }

    public void setDescripcionSum(String descripcionSum) {
        this.descripcionSum = descripcionSum;
    }

    public TipoSuministro(int idTipoSum, String descripcionSum) {
        this.idTipoSum = idTipoSum;
        this.descripcionSum = descripcionSum;
    }
    
}
