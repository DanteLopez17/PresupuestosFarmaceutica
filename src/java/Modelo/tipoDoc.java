
package Modelo;

public class tipoDoc {
    private int idTipoDoc;
    private String descripcion;

    public tipoDoc(int idTipoDoc, String descripcion) {
        this.idTipoDoc = idTipoDoc;
        this.descripcion = descripcion;
    }

    public tipoDoc() {
        
    }

    public int getIdTipoDoc() {
        return idTipoDoc;
    }

    public void setIdTipoDoc(int idTipoDoc) {
        this.idTipoDoc = idTipoDoc;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return descripcion;
    }
    
    
}
