
package Modelo;

public class Localidad {
    private int idLocalidad;
    private String nombreLoc;

    public Localidad(int idLocalidad, String nombreLoc) {
        this.idLocalidad = idLocalidad;
        this.nombreLoc = nombreLoc;
    }

    public int getIdLocalidad() {
        return idLocalidad;
    }

    public void setIdLocalidad(int idLocalidad) {
        this.idLocalidad = idLocalidad;
    }

    public String getNombreLoc() {
        return nombreLoc;
    }

    public void setNombreLoc(String nombreLoc) {
        this.nombreLoc = nombreLoc;
    }
    
    
}
