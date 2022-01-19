
package Modelo;

public class Cobertura {
    private ObraSocial obrasocial;
    private Suministro suministro;
    private Localidad localidad;
    private int descuento;
    private Descuento descu;

    public Descuento getDescu() {
        return descu;
    }

    public void setDescu(Descuento descu) {
        this.descu = descu;
    }
    
    public ObraSocial getObrasocial() {
        return obrasocial;
    }

    public void setObrasocial(ObraSocial obrasocial) {
        this.obrasocial = obrasocial;
    }

    public Suministro getSuministro() {
        return suministro;
    }

    public void setSuministro(Suministro suministro) {
        this.suministro = suministro;
    }

    public Localidad getLocalidad() {
        return localidad;
    }

    public void setLocalidad(Localidad localidad) {
        this.localidad = localidad;
    }

    public int getDescuento() {
        return descuento;
    }

    public void setDescuento(int descuento) {
        this.descuento = descuento;
    }

    public Cobertura(ObraSocial obrasocial, Suministro suministro, Localidad localidad, int descuento, Descuento descu) {
        this.obrasocial = obrasocial;
        this.suministro = suministro;
        this.localidad = localidad;
        this.descuento = descuento;
        this.descu = descu;

    }

    public Cobertura(ObraSocial obrasocial, Suministro suministro, Localidad localidad, int descuento) {
        this.obrasocial = obrasocial;
        this.suministro = suministro;
        this.localidad = localidad;
        this.descuento = descuento;
    }
    
    
}
