<%-- 
    Document   : admin
    Created on : Feb 26, 2022, 3:42:55 PM
    Author     : QUANG HUY
--%>

<%@page import="products.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Admin Dashboard</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/styleadmin.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->
            <%
                UserDTO userLogin = (UserDTO) session.getAttribute("LOGIN_USER");
                if (userLogin == null) {
                    userLogin = new UserDTO();
                }
                List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LiST_USER");
                List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("LiST_PRODUCT_ADMIN");
                if (userLogin.getRoleID() != 1) {
                    response.sendRedirect("HomeController");
                    return;
                }
            %>


            <!-- Sidebar Start -->
            <div style="width: 16%;" class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="admin.jsp" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>DASHMIN</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="ms-3">
                            <h6 class="mb-0">${sessionScope.LOGIN_USER.name}</h6>
                            <span>ADMIN</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="MainController?action=SearchUser&search=&index=1" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>User Management</a>
                        <a href="MainController?action=SearchProduct&search=&index=1" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Product Management</a>  
                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                    <a href="#" class="navbar-brand d-flex d-lg-none me-4">
                        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                    </a>
                    <a href="#" class="sidebar-toggler flex-shrink-0">
                        <i class="fa fa-bars"></i>
                    </a>
                    <form action="MainController" class="d-none d-md-flex ms-4">
                        <input style="padding: 0.375rem 22.75rem;" class="form-control border-0" type="search" name="search" required="" value="${param.search}" placeholder="Search">
                        <%
                            if (listUser != null) {
                        %>
                        <input style="color: white" class="form-control bg-primary" type="submit" name="action" value="SearchUser">
                        <input type="hidden" name="index" value="${requestScope.INDEX_PAGE_USER}">
                        <%                        } else if (listProduct != null) {
                        %>
                        <input style="color: white" class="form-control bg-primary" type="submit" name="action" value="SearchProduct">
                        <input type="hidden" name="index" value="${requestScope.INDEX_PAGE_PRODUCT}">                      
                        <%
                        } else {
                        %>
                        <input style="color: white" class="form-control bg-primary" type="submit" value="Search"  disabled="">
                        <%
                            }
                        %>                       
                    </form>
                    <div class="navbar-nav align-items-center ms-auto">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-bell me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Notification</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Profile updated</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">New user added</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Password changed</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item text-center">See all notifications</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">                             
                                <span class="d-none d-lg-inline-flex">${sessionScope.LOGIN_USER.name}</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">My Profile</a>
                                <a href="#" class="dropdown-item">Settings</a>
                                <a href="MainController?action=Logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->


                <!--UserManagement-->
                <!-- Recent Sales Start -->
                <%
                    if (listUser != null) {
                        if (!listUser.isEmpty()) {
                %>
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h3 style="margin-left: 20px;" class="mb-0">List Users</h3>
                            <%
                                String error_message = (String) request.getAttribute("ERROR_MESSAGE");
                                String success_message = (String) request.getAttribute("SUCCESS_MESSAGE");
                                if (error_message == null && success_message == null) {
                                    success_message = "";
                            %>
                            <h3 class="text-success"><%= success_message%></h3>
                            <%
                            } else if (success_message == null) {
                                success_message = "";
                            %>
                            <h3 class="text-danger"><%= error_message%></h3>
                            <%
                            } else if (error_message == null) {
                                error_message = "";
                            %>
                            <h3 class="text-success"><%= success_message%></h3>
                            <%
                                }
                            %>
                        </div>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">                                      
                                        <th scope="col">No</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Password</th>
                                        <th scope="col">Role ID</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Birthday</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Update</th>
                                        <th scope="col">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int count = 1;
                                        for (UserDTO user : listUser) {
                                    %>
                                    <tr>
                                        <td><%= count++%></td>
                                        <td><%= user.getEmail()%> </td>
                                        <td><%= user.getName()%></td>
                                        <td><%= user.getPassword()%></td>
                                        <td>
                                            <%
                                                if (user.getRoleID() == 1) {
                                            %>
                                            ADMIN   
                                            <%
                                            } else {
                                            %>
                                            USER
                                            <%
                                                }
                                            %>
                                        </td>
                                        <td><%= user.getAddress()%></td>
                                        <td><%= user.getBirthday()%></td>
                                        <td><%= user.getPhone()%></td>
                                        <td>
                                            <a id="update" class="btn btn-primary text-white"href="MainController?action=Getuser&email=<%=user.getEmail()%>&search=${param.search}&index=${requestScope.INDEX_PAGE_USER}">Update</a>
                                        </td>
                                        <td>
                                            <a class="btn btn-danger text-white"href="MainController?action=DeleteUser&email=<%= user.getEmail()%>&search=${param.search}&index=${requestScope.INDEX_PAGE_USER}">Delete</a>
                                        </td>
                                    </tr>                               
                                    <%
                                            }
                                        }
                                    %>
                                </tbody>
                            </table> 
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-end">
                                    <li class="page-item disabled">
                                        <a class="page-link">Previous</a>
                                    </li>
                                    <%
                                        int endPage = (int) request.getAttribute("END_PAGE");
                                        for (int i = 1; i <= endPage; i++) {
                                    %> 
                                    <li class="page-item"> <a class="page-link" href="MainController?action=SearchUser&search=${param.search}&index=<%=i%>" ><%=i%></a></li>
                                        <%
                                            }
                                        %>
                                    <li>
                                        <a class="page-link" href="#">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <%
                            UserDTO userDetail = (UserDTO) request.getAttribute("USER_DETAIL");
                            if (userDetail == null) {
                                userDetail = new UserDTO();
                            } else {
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
                                <label for="Email" class="form-label">Email:</label>
                                <input type="text" class="form-control" name="email"  placeholder="Email" value="<%= userDetail.getEmail()%>" readonly=""/>
                            </div>
                            <div class="form-group">
                                <label for="FullName" class="form-label">FullName:</label>
                                <input type="text" class="form-control" name="fullName" placeholder="Full Name" value="<%= userDetail.getName()%>" required=""/>
                            </div>
                            <div class="form-group">
                                <label for="Password" class="form-label">Password</label>
                                <input type="password" class="form-control" name="password"  placeholder="Password" value="<%= userDetail.getPassword()%>" readonly=""/>
                            </div>
                            <div class="form-group">
                                <label for="RoleID" class="form-label">RoleID:</label>
                                <%
                                    if (userLogin.getEmail().equals(userDetail.getEmail())) {
                                %>
                                <select name="roleID">
                                    <option  class="form-control" value="<%= userDetail.getRoleID()%>">ADMIN</option>
                                </select>
                                <%
                                } else {
                                %>
                                <select name="roleID">
                                    <%
                                        if (userDetail.getRoleID() == 1) {
                                    %>
                                    <option value="1">ADMIN</option>
                                    <option value="2">USER</option>
                                    <%
                                    } else {
                                    %>
                                    <option value="2">USER</option>
                                    <option value="1">ADMIN</option>
                                    <%
                                        }
                                    %>
                                </select>
                                <%
                                    }
                                %>
                            </div>
                            <div class="form-group">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" name="address" placeholder="Address" required="" value="<%= userDetail.getAddress()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="birthday" class="form-label">Birthday</label>
                                <input type="date" pattern="\d{4}-\d{1,2}-\d{1,2}" class="form-control" name="birthday"  placeholder="Birthday" required="" value="<%= userDetail.getBirthday()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="text" pattern="\d*" class="form-control" name="phone" placeholder="Phone" required="" value="<%= userDetail.getPhone()%>"/>
                            </div>
                            <div class="form-group form-button">
                                <input class="btn btn-primary text-white" type="submit" name="action" value="UpdateUser"/>
                                <input  type="hidden" name="email" value="<%= userDetail.getEmail()%>"/>
                                <input  type="hidden" name="search" value="${param.search}"/>
                                <input  type="hidden" name="index" value="${requestScope.INDEX_PAGE_USER}"/>
                            </div>
                        </form>
                        <%
                            }
                        %>
                    </div>
                </div>
                <!-- Recent Sales End -->
            </div>
            <!--Product-->
            <%
            } else if (listProduct != null) {
                if (!listProduct.isEmpty()) {
            %>
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h3 style="margin-left: 20px;"style="margin-left: 20px;" class="mb-0">List Product<a style="margin-left: 5px" class="btn btn-warning" href="insertProduct.jsp">Insert Product</a></h3>
                        <%
                            String error_message = (String) request.getAttribute("ERROR_MESSAGE");
                            String success_message = (String) request.getAttribute("SUCCESS_MESSAGE");
                            if (error_message == null && success_message == null) {
                                success_message = "";
                        %>
                        <h3 class="text-success"><%= success_message%></h3>
                        <%
                        } else if (success_message == null) {
                            success_message = "";
                        %>
                        <h3 class="text-danger"><%= error_message%></h3>
                        <%
                        } else if (error_message == null) {
                            error_message = "";
                        %>
                        <h3 class="text-success"><%= success_message%></h3>
                        <%
                            }
                        %>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-dark">                                      
                                    <th scope="col">No</th>
                                    <th scope="col">Product ID</th>
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Category ID</th>
                                    <th scope="col">Import Date</th>
                                    <th scope="col">Using Date</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Update</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int count = 1;
                                    for (ProductDTO product : listProduct) {
                                %>
                                <tr>
                                    <td><%= count++%></td>
                                    <td><%= product.getProductID()%> </td>
                                    <td><%= product.getProductName()%></td>
                                    <td><%= product.getProductPrice()%></td>
                                    <td><%= product.getProducQuantity()%></td>
                                    <td>
                                        <%
                                            if (product.getProductCategoryID() == 1) {
                                        %>
                                        fruits  
                                        <%
                                        } else {
                                        %>
                                        vegetables
                                        <%
                                            }
                                        %>

                                    </td>
                                    <td><%= product.getImportDate()%></td>
                                    <td><%= product.getUsingDate()%></td>
                                    <td>                                     
                                        <img style="width: 40%" src="<%= product.getProducImage()%>" />
                                    </td>
                                    <td>
                                        <a id="update" class="btn btn-primary text-white"href="MainController?action=Getproduct&productID=<%=product.getProductID()%>&search=${param.search}&index=${requestScope.INDEX_PAGE_PRODUCT}">Update</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-danger text-white"href="MainController?action=DeleteProduct&productID=<%= product.getProductID()%>&search=${param.search}&index=${requestScope.INDEX_PAGE_PRODUCT}">Delete</a>
                                    </td>
                                </tr>                               
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>  
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-end">
                                <li class="page-item disabled">
                                    <a class="page-link">Previous</a>
                                </li>
                                <%
                                    int endPage = (int) request.getAttribute("END_PAGE");
                                    for (int i = 1; i <= endPage; i++) {
                                %> 
                                <li class="page-item"> <a class="page-link" href="MainController?action=SearchProduct&search=${param.search}&index=<%=i%>" ><%=i%></a></li>
                                    <%
                                        }
                                    %>
                                <li>
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <%
                        ProductDTO productDetail = (ProductDTO) request.getAttribute("PRODUCT_DETAIL");
                        if (productDetail == null) {
                            productDetail = new ProductDTO();
                        } else {
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
                            <label for="ProductID" class="form-label">Product ID:</label>
                            <input type="text" class="form-control" name="productID"  placeholder="ProductID" value="<%= productDetail.getProductID()%>" readonly=""/>
                        </div>
                        <div class="form-group">
                            <label for="ProductName" class="form-label">Product Name:</label>
                            <input type="text" class="form-control" name="productName" placeholder="Product Name" value="<%= productDetail.getProductName()%>" required=""/>
                        </div>
                        <div class="form-group">
                            <label for="Price" class="form-label">Price</label>
                            <input type="number" step="0.1" class="form-control" name="price"  placeholder="Price" value="<%= productDetail.getProductPrice()%>" required=""/>
                        </div>
                        <div class="form-group">
                            <label for="Quantity" class="form-label">Quantity</label>
                            <input type="text" pattern="\d*" class="form-control" name="quantity" placeholder="Quantity" required="" value="<%= productDetail.getProducQuantity()%>"/>
                        </div>
                        <div class="form-group">
                            <label for="CategoryID" class="form-label">Category ID</label>
                            <select name="categoryID">
                                <%
                                    if (productDetail.getProductCategoryID() == 1) {
                                %>
                                <option value="1">fruits</option>
                                <option value="2">vegetables</option>
                                <%
                                } else {
                                %>
                                <option value="2">vegetables</option>
                                <option value="1">fruits</option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="ImportDate" class="form-label">Import Date</label>
                            <input type="date" pattern="\d{4}-\d{1,2}-\d{1,2}" class="form-control" name="importDate" placeholder="Import Date" required="" value="<%= productDetail.getImportDate()%>"/>
                        </div>
                        <div class="form-group">
                            <label for="UsingDate" class="form-label">Using Date</label>
                            <input type="date" pattern="\d{4}-\d{1,2}-\d{1,2}" class="form-control" name="usingDate"  placeholder="Using Date" required="" value="<%= productDetail.getUsingDate()%>"/>
                        </div>
                        <div class="form-group">
                            <label for="Image" class="form-label">Image</label>
                            <input type="text" class="form-control" name="image" placeholder="Image" required="" value="<%= productDetail.getProducImage()%>"/>
                        </div>
                        <div class="form-group form-button">
                            <input class="btn btn-primary text-white" type="submit" name="action" value="UpdateProduct"/>
                            <input  type="hidden" name="productID" value="<%= productDetail.getProductID()%>"/>
                            <input  type="hidden" name="search" value="${param.search}"/>     
                            <input  type="hidden" name="index" value="${requestScope.INDEX_PAGE_PRODUCT}"/>
                        </div>
                    </form>
                    <%
                        }
                    %>          
                </div>
            </div>
            <!-- Content End -->
            <%
                }
            %>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <script src="js/main_admin.js"></script>
    </body>

</html>
