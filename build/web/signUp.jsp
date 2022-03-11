<%-- 
    Document   : signup
    Created on : Feb 27, 2022, 8:27:17 PM
    Author     : QUANG HUY
--%>

<%@page import="users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
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
        <form action="MainController" 
              method="POST" 
              style="
              width: 30%;
              border: 1px solid;
              border-radius: 30px;
              margin: auto;
              padding: 50px;" 
              id="sign-up-form"
              >
            <h1 class="text-center text-primary">Sign Up</h1>
            <div class="form-group">
                <label for="Email" class="form-label">Email:</label>
                <input type="email" class="form-control" name="email"  placeholder="Email" required=""/>
                <span style="color: red">${requestScope.USER_ERROR.emailError}</span>
            </div>
            <div class="form-group">
                <label for="FullName" class="form-label">FullName:</label>
                <input type="text" class="form-control" name="fullName" placeholder="Full Name" required=""/>
                <span style="color: red">${requestScope.USER_ERROR.fullNameError}</span>
            </div>
            <div class="form-group">
                <label for="Password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password"  placeholder="Password" required=""/>
                <span style="color: red">${requestScope.USER_ERROR.passwordError}</span>
            </div>
            <div class="form-group">
                <label for="Confirm" class="form-label">Confirm password</label>
                <input type="password" class="form-control" name="confirm"  placeholder="Confirm password" required=""/>
                <span style="color: red">${requestScope.USER_ERROR.confirmError}</span>
            </div>
            <div class="form-group">
                <label for="RoleID" class="form-label">RoleID:</label>
                <select name="roleID">
                    <option  class="form-control" value="2">USER</option>
                </select>
                <span style="color: red">${requestScope.USER_ERROR.roleIDError}</span>
            </div>
            <div class="form-group">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" name="address" placeholder="Address" required=""/>
                <span style="color: red">${requestScope.USER_ERROR.addressError}</span>
            </div>
            <div class="form-group">
                <label for="birthday" class="form-label">Birthday</label>
                <input type="date" pattern="\d{4}-\d{1,2}-\d{1,2}" class="form-control" name="birthday"  placeholder="Birthday" required="" />
                <span style="color: red">${requestScope.USER_ERROR.birthdayError}</span>
            </div>
            <div class="form-group">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" pattern="\d*" class="form-control" name="phone" placeholder="Phone" required="" />
                <span style="color: red">${requestScope.USER_ERROR.phoneError}</span>
            </div>
            <div style="width: 13%;padding-top:10px " class="m-auto form-group form-button">
                <input class="btn btn-primary text-white" type="submit" name="action" value="SignUp"/>
            </div>
        </form>
        <script src="https://www.google.com/recaptcha/api.js"></script>
    </body>
</html>
