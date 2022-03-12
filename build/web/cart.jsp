<%-- 
    Document   : cart.jsp
    Created on : Feb 26, 2022, 12:04:40 PM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="shopping.Cart"%>
<%@page import="java.util.List"%>
<%@page import="products.ProductDTO"%>
<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Cart</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body class="goto-here">
        <jsp:include page="component/header.jsp"></jsp:include>
        <%
            UserDTO userLogin = (UserDTO) session.getAttribute("LOGIN_USER");
            if (userLogin == null) {
                userLogin = new UserDTO();
            }
            if (userLogin.getRoleID() == 1) {
                response.sendRedirect("admin.jsp");
                return;
            }
        %>
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="#">Home</a></span> <span>Cart</span></p>
                <h1 class="mb-0 bread">My Cart</h1>
            </div>
        </div>
        <section class="ftco-section ftco-cart">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ftco-animate">
                        <div class="cart-list">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr class="text-center">
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                        <th>Product name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        Cart cart = (Cart) session.getAttribute("CART");
                                        if (cart == null) {
                                    %>
                                <h1>Không có hàng ở đây </h1>
                                <%
                                } else {
                                %>
                                <c:if test="${sessionScope.LOGIN_USER != null}">
                                    <a class="btn btn-primary" href="checkOut.jsp">CheckOut</a>
                                </c:if>
                                <c:if test="${sessionScope.LOGIN_USER == null}">
                                    <a class="btn btn-primary" href="login.jsp">CheckOut</a>
                                </c:if>
                                <c:if test="${requestScope.SUCCESS_MESSAGE != null}">
                                    <div class="alert alert-success" role="alert">
                                        <center>
                                            <strong>Success!</strong> ${requestScope.SHOPPING_MESSAGE}
                                        </center>
                                    </div>
                                </c:if>
                                <c:if test="${requestScope.ERROR_MESSAGE != null}">
                                    <div " class="alert alert-danger">
                                        <center>
                                            <strong>Alert!</strong> ${requestScope.ERROR_MESSAGE}
                                        </center>
                                    </div>
                                </c:if> 
                                <%
                                    for (ProductDTO product : cart.getCart().values()) {
                                %> 
                                <form action="MainController" method="POST">
                                    <tr class="text-center">
                                        <td class="product-remove"><a href="MainController?action=Remove&productID=<%=product.getProductID()%>"><span class="ion-ios-close"></span></a></td>

                                        <td class="image-prod"><div class="img" style="background-image:url(<%= product.getProducImage()%>); width: 140px;
                                                                    height: 110px;"></div></td>

                                        <td class="product-name">
                                            <h3><%= product.getProductName()%></h3>
                                        </td>

                                        <td class="price"><%= product.getProductPrice()%> VNĐ</td>

                                        <td class="quantity">

                                            <div class="input-group mb-3">
                                                <input type="number" name="quantity" class="quantity form-control input-number" value="<%= product.getQuantityPurchased()%>" min="1" required="">
                                                <input type="hidden" name="action" value="Modify" >
                                                <input type="hidden" name="productID" value="<%=product.getProductID()%>" >
                                            </div>
                                        </td>

                                        <td class="total"><%=product.getQuantityPurchased() * product.getProductPrice()%> VNĐ</td>
                                    </tr>  
                                </form>

                                <%
                                        }

                                    }
                                %>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="component/footer.jsp"></jsp:include>



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
        <script>
            window.setTimeout(function () {
                $(".alert").fadeTo(500, 0).slideUp(500, function () {
                    $(this).remove();
                });
            }, 3000);
        </script>

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

        <script>
            $(document).ready(function () {

                var quantitiy = 0;
                $('.quantity-right-plus').click(function (e) {

                    // Stop acting like a button
                    e.preventDefault();
                    // Get the field name
                    var quantity = parseInt($('#quantity').val());

                    // If is not undefined

                    $('#quantity').val(quantity + 1);


                    // Increment

                });

                $('.quantity-left-minus').click(function (e) {
                    // Stop acting like a button
                    e.preventDefault();
                    // Get the field name
                    var quantity = parseInt($('#quantity').val());

                    // If is not undefined

                    // Increment
                    if (quantity > 0) {
                        $('#quantity').val(quantity - 1);
                    }
                });

            });
        </script>

    </body>
</html>
