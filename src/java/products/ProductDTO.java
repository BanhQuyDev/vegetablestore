/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package products;

/**
 *
 * @author QUANG HUY
 */
public class ProductDTO {
    private int productID;
    private String productName;
    private double productPrice;
    private int producQuantity;
    private int productCategoryID;
    private String importDate;
    private String usingDate;
    private String producImage;
    private int quantityPurchased;

    public ProductDTO() {
        this.productID = 0;
        this.productName = "";
        this.productPrice = 0;
        this.producQuantity = 0;
        this.productCategoryID = 0;
        this.importDate = "";
        this.usingDate = "";
        this.producImage = "";
    }

    public ProductDTO(int productID, String productName, double productPrice, int producQuantity, int productCategoryID, String importDate, String usingDate, String producImage) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.producQuantity = producQuantity;
        this.productCategoryID = productCategoryID;
        this.importDate = importDate;
        this.usingDate = usingDate;
        this.producImage = producImage;
    }

    public ProductDTO(int productID, String productName, double productPrice, String producImage, int quantityPurchased) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.producImage = producImage;
        this.quantityPurchased = quantityPurchased;
    }
    

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getProducQuantity() {
        return producQuantity;
    }

    public void setProducQuantity(int producQuantity) {
        this.producQuantity = producQuantity;
    }

    public int getProductCategoryID() {
        return productCategoryID;
    }

    public void setProductCategoryID(int productCategoryID) {
        this.productCategoryID = productCategoryID;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public String getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(String usingDate) {
        this.usingDate = usingDate;
    }

    public String getProducImage() {
        return producImage;
    }

    public void setProducImage(String producImage) {
        this.producImage = producImage;
    }
        public int getQuantityPurchased() {
        return quantityPurchased;
    }

    public void setQuantityPurchased(int quantityPurchased) {
        this.quantityPurchased = quantityPurchased;
    }
    
}
