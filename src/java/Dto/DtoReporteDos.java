
package Dto;

public class DtoReporteDos {
    private String profesional;
    private int cantidadRecetas;

    public String getProfesional() {
        return profesional;
    }

    public void setProfesional(String profesional) {
        this.profesional = profesional;
    }

    public int getCantidadRecetas() {
        return cantidadRecetas;
    }

    public void setCantidadRecetas(int cantidadRecetas) {
        this.cantidadRecetas = cantidadRecetas;
    }

    public DtoReporteDos(String profesional, int cantidadRecetas) {
        this.profesional = profesional;
        this.cantidadRecetas = cantidadRecetas;
    }
    
    
}
