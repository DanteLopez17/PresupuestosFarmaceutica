
package Modelo;

public class StockXSucursal {
    private int idStockxSucur;
    private Sucursal sucu;
    private Suministro sumi;
    private int stock;

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public StockXSucursal(int idStockxSucur, Sucursal sucu, Suministro sumi, int stock) {
        this.idStockxSucur = idStockxSucur;
        this.sucu = sucu;
        this.sumi = sumi;
        this.stock = stock;
    }

    public StockXSucursal(Sucursal sucu, Suministro sumi, int stock) {
        this.sucu = sucu;
        this.sumi = sumi;
        this.stock = stock;
    }

    public int getIdStockxSucur() {
        return idStockxSucur;
    }

    public void setIdStockxSucur(int idStockxSucur) {
        this.idStockxSucur = idStockxSucur;
    }

    public Sucursal getSucu() {
        return sucu;
    }

    public void setSucu(Sucursal sucu) {
        this.sucu = sucu;
    }

    public Suministro getSumi() {
        return sumi;
    }

    public void setSumi(Suministro sumi) {
        this.sumi = sumi;
    }
    
    
}
