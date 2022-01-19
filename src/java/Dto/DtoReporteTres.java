
package Dto;

import Modelo.Cliente;

public class DtoReporteTres {
    private Cliente cliente; 
    private String total;

    public DtoReporteTres(Cliente cliente, String total) {
        this.cliente = cliente;
        this.total = total;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
    
    
    
    
}
