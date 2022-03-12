<%-- 
    Document   : insertproduct
    Created on : Mar 1, 2022, 1:44:33 PM
    Author     : QUANG HUY
--%>

<%@page import="products.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
</head>
<body>
    <%
        ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
        if (productError == null) {
            productError = new ProductError();
        }
    %>
    <form action="MainController" 
          method="POST" 
          style="
          width: 30%;
          border: 1px solid;
          border-radius: 30px;
          margin: auto;
          padding: 50px;" 
          id="update-form"
          >
        <div class="form-group">
            <label for="ProductName" class="form-label">Product Name:</label>
            <input type="text" class="form-control" name="productName" placeholder="Product Name" required=""/>
            <span style="color: red"><%= productError.getProductNameError()%></span>
        </div>
        <div class="form-group">
            <label for="Price" class="form-label">Price</label>
            <input type="text" pattern="\d*" step="0.1" class="form-control" name="price"  placeholder="Price" required=""/>
            <span style="color: red"><%= productError.getPriceError()%></span>
        </div>
        <div class="form-group">
            <label for="Quantity" class="form-label">Quantity</label>
            <input type="number" min="1" max="1000" class="form-control" name="quantity" placeholder="Quantity" required=""/>
            <span style="color: red"><%= productError.getQuantityError()%></span>
        </div>
        <div class="form-group">
            <label for="CategoryID" class="form-label">Category ID</label>
            <select name="categoryID">
                <option value="1">fruits</option>
                <option value="2">vegetables</option>                            
            </select>
        </div>
        <div class="form-group">
            <label for="UsingDate" class="form-label">Using Date</label>
            <input type="date" pattern="\d{4}-\d{1,2}-\d{1,2}" class="form-control" name="usingDate"  placeholder="Using Date" required=""/>
            <span style="color: red"><%= productError.getUsingDateError()%></span>
        </div>
        <div class="form-group">
            <label for="Image" class="form-label">Image</label>
            <input type="text" class="form-control" name="image" placeholder="Image" required="" />
            <span style="color: red"><%= productError.getImageError()%></span>
        </div>
        <div class="form-group form-button">
            <input class="btn btn-primary text-white" type="submit" name="action" value="InsertProduct"/>
        </div>
    </form>
</body>
</html>
