
package Modelo;


public class Usuario {
    private String user;
    private int clave;

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public int getClave() {
        return clave;
    }

    public void setClave(int clave) {
        this.clave = clave;
    }

    public Usuario(String user, int clave) {
        this.user = user;
        this.clave = clave;
    }
    
    
}
