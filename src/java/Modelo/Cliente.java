
package Modelo;


public class Cliente {
    private int idCliente;
    private String nombre;
    private String apellido;
    private String fechaNacimiento;
    private int numDocumento;
    private tipoDoc tipoDocumento;

    public Cliente() {
    }

    
    public Cliente(int idCliente) {
        this.idCliente = idCliente;
    }

    
    public Cliente(int idCliente, String nombre, String apellido, String fechaNacimiento, int numDocumento, tipoDoc tipoDocumento) {
        this.idCliente = idCliente;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
        this.numDocumento = numDocumento;
        this.tipoDocumento = tipoDocumento;
    }

    public Cliente(String nombre, String apellido, String fechaNacimiento, int numDocumento, tipoDoc tipoDocumento) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
        this.numDocumento = numDocumento;
        this.tipoDocumento = tipoDocumento;
    }
    

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getNumDocumento() {
        return numDocumento;
    }

    public void setNumDocumento(int numDocumento) {
        this.numDocumento = numDocumento;
    }

    public tipoDoc getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(tipoDoc tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    @Override
    public String toString() {
        return "Cliente{" + "idCliente=" + idCliente + ", nombre=" + nombre + ", apellido=" + apellido + ", fechaNacimiento=" + fechaNacimiento + ", numDocumento=" + numDocumento + ", tipoDocumento=" + tipoDocumento + '}';
    }
    
    
}
