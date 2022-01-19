
package Modelo;

import java.text.DecimalFormat;

public class DetalleReceta {
    private int idDetalleReceta;
    private Receta receta;
    private int cantidad;
    private float precio;
    private Suministro suministro;
    private double descuento;
    private float preUnitSum;

    public float getPreUnitSum() {
        return preUnitSum;
    }

    public void setPreUnitSum(float preUnitSum) {
        this.preUnitSum = preUnitSum;
    }

    public DetalleReceta(int idDetalleReceta, Receta receta, int cantidad, float precio, Suministro suministro, double descuento, float preUnitSum) {
        this.idDetalleReceta = idDetalleReceta;
        this.receta = receta;
        this.cantidad = cantidad;
        this.precio = precio;
        this.suministro = suministro;
        this.descuento = descuento;
        this.preUnitSum = preUnitSum;
        
    }

    public DetalleReceta(Receta receta, int cantidad, float precio, Suministro suministro, double descuento) {
        this.receta = receta;
        this.cantidad = cantidad;
        this.precio = precio;
        this.suministro = suministro;
        this.descuento = descuento;
    }

    public double getDescuento() {
        return descuento;
    }
    
    public String descOb()
    {
        DecimalFormat df = new DecimalFormat("#.00");

        
        String descu = df.format(descuento);
        return descu;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }
    
    public float calcularSubTotal(){
        return (float) Math.round(((cantidad * precio) - descuento)*100f) /100f ;
    }

    public DetalleReceta(int idDetalleReceta, Receta receta, int cantidad, float precio, Suministro suministro) {
        this.idDetalleReceta = idDetalleReceta;
        this.receta = receta;
        this.cantidad = cantidad;
        this.precio = precio;
        this.suministro = suministro;
    }

    public DetalleReceta(int cantidad, float precio, Suministro suministro) {
        this.cantidad = cantidad;
        this.precio = precio;
        this.suministro = suministro;
    }

    public DetalleReceta(Receta receta, int cantidad, float precio, Suministro suministro) {
        this.receta = receta;
        this.cantidad = cantidad;
        this.precio = precio;
        this.suministro = suministro;
    }

    public int getIdDetalleReceta() {
        return idDetalleReceta;
    }

    public void setIdDetalleReceta(int idDetalleReceta) {
        this.idDetalleReceta = idDetalleReceta;
    }

    public Receta getReceta() {
        return receta;
    }

    public void setReceta(Receta receta) {
        this.receta = receta;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public Suministro getSuministro() {
        return suministro;
    }

    public void setSuministro(Suministro suministro) {
        this.suministro = suministro;
    }
    
    
    
}
