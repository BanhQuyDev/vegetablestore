<%-- 
    Document   : checkout
    Created on : Feb 26, 2022, 12:05:07 PM
    Author     : QUANG HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="shopping.Cart"%>
<%@page import="products.ProductDTO"%>
<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>CheckOut Pages</title>
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
            double totalPrice = 0;
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                response.sendRedirect("HomeController");
                return;
            }
            for (ProductDTO product : cart.getCart().values()) {
                totalPrice += product.getQuantityPurchased() * product.getProductPrice();
            }
        %>
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="#">Home</a></span> <span>Checkout</span></p>
                <h1 class="mb-0 bread">Checkout</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-7 ftco-animate">
                <form action="MainController" method="POST" class="billing-form">
                    <h3 class="mb-4 billing-heading">Billing Details</h3>
                    <div class="row align-items-end">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label >Email</label>
                                <input name="email" style="color: black !important;" type="email" class="form-control" placeholder="" value="${sessionScope.LOGIN_USER.email}" readonly="">
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div class="form-group">                                
                                <label>Full Name</label>
                                <c:choose>
                                    <c:when test="${sessionScope.LOGIN_USER.name != null}">
                                        <input name="name" style="color: black !important;" type="text" class="form-control" placeholder=""value="${sessionScope.LOGIN_USER.name}"readonly="">
                                    </c:when>
                                    <c:otherwise>
                                        <input name="name" style="color: black !important;" type="text" class="form-control" placeholder=""value="">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Street Address</label>
                                <c:choose>
                                    <c:when test="${sessionScope.LOGIN_USER.address != null}">
                                        <input name="address" style="color: black !important;" type="text" class="form-control" placeholder="House number and street name"value="${sessionScope.LOGIN_USER.address}"readonly="">
                                    </c:when>
                                    <c:otherwise>
                                        <input name="address" style="color: black !important;" type="text" class="form-control" placeholder="House number and street name">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Birthday</label>
                                <c:choose>
                                    <c:when test="${sessionScope.LOGIN_USER.birthday != null}">
                                        <input name="birthday" style="color: black !important;" type="date" class="form-control" placeholder="" value="${sessionScope.LOGIN_USER.birthday}" readonly="">
                                    </c:when>
                                    <c:otherwise>
                                        <input name="birthday" style="color: black !important;" type="date" class="form-control" placeholder="">
                                    </c:otherwise>
                                </c:choose>                               
                            </div>
                        </div>                         
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Phone</label>
                                <c:choose>
                                    <c:when test="${sessionScope.LOGIN_USER.phone != null}">
                                        <input name="phone" style="color: black !important;" type="text" class="form-control" placeholder="" value="${sessionScope.LOGIN_USER.phone}" readonly="">
                                    </c:when>
                                    <c:otherwise>
                                        <input name="phone" style="color: black !important;" type="text" class="form-control" placeholder="">
                                    </c:otherwise>
                                </c:choose> 
                            </div>
                        </div>
                    </div>
                    <input class="btn btn-success" type="submit" name="action" value="CheckOut">
                </form><!-- END -->
            </div>
            <div class="col-xl-5">
                <div class="row mt-5 pt-3">
                    <div class="col-md-12 d-flex mb-5">
                        <div class="cart-detail cart-total p-3 p-md-4">
                            <h3 class="billing-heading mb-4">Cart Total</h3>
                            <p class="d-flex total-price">
                                <span>Total</span>
                                <span><%= totalPrice%>VN??</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div> <!-- .col-md-8 -->
        </div>
    </div>
</section> <!-- .section -->

<jsp:include page="component/footer.jsp"></jsp:include>



<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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