
package Modelo;


public class Profesional {
    private int idProf;
    private String nombreProf;
    private String apellidoProf;
    private int nroMatriculaProf;
    private String fecNacProf;
    private int numDocProf;
    private tipoDoc tipDocProf;
    private Especialidad espeProf;

    public Profesional(int idProf) {
        this.idProf = idProf;
    }

    public Profesional(int idProf, String nombreProf, String apellidoProf, int nroMatriculaProf, String fecNacProf, int numDocProf, tipoDoc tipDocProf, Especialidad espeProf) {
        this.idProf = idProf;
        this.nombreProf = nombreProf;
        this.apellidoProf = apellidoProf;
        this.nroMatriculaProf = nroMatriculaProf;
        this.fecNacProf = fecNacProf;
        this.numDocProf = numDocProf;
        this.tipDocProf = tipDocProf;
        this.espeProf = espeProf;
    }
    
    public Profesional(String nombreProf, String apellidoProf, int nroMatriculaProf, String fecNacProf, int numDocProf, tipoDoc tipDocProf, Especialidad espeProf) {
        this.nombreProf = nombreProf;
        this.apellidoProf = apellidoProf;
        this.nroMatriculaProf = nroMatriculaProf;
        this.fecNacProf = fecNacProf;
        this.numDocProf = numDocProf;
        this.tipDocProf = tipDocProf;
        this.espeProf = espeProf;
    }

    public int getIdProf() {
        return idProf;
    }

    public void setIdProf(int idProf) {
        this.idProf = idProf;
    }

    public String getNombreProf() {
        return nombreProf;
    }

    public void setNombreProf(String nombreProf) {
        this.nombreProf = nombreProf;
    }

    public String getApellidoProf() {
        return apellidoProf;
    }

    public void setApellidoProf(String apellidoProf) {
        this.apellidoProf = apellidoProf;
    }

    public int getNroMatriculaProf() {
        return nroMatriculaProf;
    }

    public void setNroMatriculaProf(int nroMatriculaProf) {
        this.nroMatriculaProf = nroMatriculaProf;
    }

    public String getFecNacProf() {
        return fecNacProf;
    }

    public void setFecNacProf(String fecNacProf) {
        this.fecNacProf = fecNacProf;
    }

    public int getNumDocProf() {
        return numDocProf;
    }

    public void setNumDocProf(int numDocProf) {
        this.numDocProf = numDocProf;
    }

    public tipoDoc getTipDocProf() {
        return tipDocProf;
    }

    public void setTipDocProf(tipoDoc tipDocProf) {
        this.tipDocProf = tipDocProf;
    }

    public Especialidad getEspeProf() {
        return espeProf;
    }

    public void setEspeProf(Especialidad espeProf) {
        this.espeProf = espeProf;
    }
    
    
}
