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
public class ProductError {
    private String productIdError;
    private String productNameError;
    private String priceError;
    private String quantityError;
    private String categoryIdError;
    private String importDateError;
    private String usingDateError;
    private String imageError;
    private String messageError;

    public ProductError() {
        this.productIdError = "";
        this.productNameError = "";
        this.priceError = "";
        this.quantityError = "";
        this.categoryIdError = "";
        this.importDateError = "";
        this.usingDateError = "";
        this.imageError = "";
        this.messageError = "";
    }

    public ProductError(String productIdError, String productNameError, String priceError, String quantityError, String categoryIdError, String importDateError, String usingDateError, String imageError,String messageError) {
        this.productIdError = productIdError;
        this.productNameError = productNameError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.categoryIdError = categoryIdError;
        this.importDateError = importDateError;
        this.usingDateError = usingDateError;
        this.imageError = imageError;
        this.messageError = messageError;
    }

    public String getProductIdError() {
        return productIdError;
    }

    public void setProductIdError(String productIdError) {
        this.productIdError = productIdError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public String getCategoryIdError() {
        return categoryIdError;
    }

    public void setCategoryIdError(String categoryIdError) {
        this.categoryIdError = categoryIdError;
    }

    public String getImportDateError() {
        return importDateError;
    }

    public void setImportDateError(String importDateError) {
        this.importDateError = importDateError;
    }

    public String getUsingDateError() {
        return usingDateError;
    }

    public void setUsingDateError(String usingDateError) {
        this.usingDateError = usingDateError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getMessageError() {
        return messageError;
    }

    public void setMessageError(String messageError) {
        this.messageError = messageError;
    }
    
    
}
