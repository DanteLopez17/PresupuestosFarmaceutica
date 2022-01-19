
package Modelo;

public class Suministro {
    private int idSuministro;
    private String descSum;
    private float precSum;
    private Clasificacion clasifSum;
    private TipoSuministro tipoSum;

    public Suministro(int idSuministro) {
        this.idSuministro = idSuministro;
    }

    public int getIdSuministro() {
        return idSuministro;
    }

    public void setIdSuministro(int idSuministro) {
        this.idSuministro = idSuministro;
    }

    public String getDescSum() {
        return descSum;
    }

    public void setDescSum(String descSum) {
        this.descSum = descSum;
    }

    public float getPrecSum() {
        return precSum;
    }

    public void setPrecSum(float precSum) {
        this.precSum = precSum;
    }

    public Clasificacion getClasifSum() {
        return clasifSum;
    }

    public void setClasifSum(Clasificacion clasifSum) {
        this.clasifSum = clasifSum;
    }

    public TipoSuministro getTipoSum() {
        return tipoSum;
    }

    public void setTipoSum(TipoSuministro tipoSum) {
        this.tipoSum = tipoSum;
    }

    public Suministro(int idSuministro, String descSum, float precSum, Clasificacion clasifSum, TipoSuministro tipoSum) {
        this.idSuministro = idSuministro;
        this.descSum = descSum;
        this.precSum = precSum;
        this.clasifSum = clasifSum;
        this.tipoSum = tipoSum;
    }

    public Suministro(String descSum, float precSum, Clasificacion clasifSum, TipoSuministro tipoSum) {
        this.descSum = descSum;
        this.precSum = precSum;
        this.clasifSum = clasifSum;
        this.tipoSum = tipoSum;
    }
    
    
}
