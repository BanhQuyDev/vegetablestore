/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String SEARCH_USER = "SearchUser";
    private static final String SEARCH_USER_CONTROLLER = "SearchUserController";
    private static final String SEARCH_PRODUCT = "SearchProduct";
    private static final String SEARCH_PRODUCT_CONTROLLER = "SearchProductController";
    private static final String DELETE_USER = "DeleteUser";
    private static final String DELETE_USER_CONTROLLER = "DeleteUserController";
    private static final String DELETE_PRODUCT = "DeleteProduct";
    private static final String DELETE_PRODUCT_CONTROLLER = "DeleteProductController";
    private static final String UPDATE_USER = "UpdateUser";
    private static final String UPDATE_USER_CONTROLLER = "UpdateUserController";
    private static final String UPDATE_PRODUCT = "UpdateProduct";
    private static final String UPDATE_PRODUCT_CONTROLLER = "UpdateProductController";
    private static final String GET_USER_DETAIL = "Getuser";
    private static final String GET_USER_DETAIL_CONTROLLER = "GetDetailUserController";
    private static final String GET_PRODUCT_DETAIL = "Getproduct";
    private static final String GET_PRODUCT_DETAIL_CONTROLLER = "GetDetailProductController";
    private static final String SIGN_UP = "SignUp";
    private static final String SIGN_UP_CONTROLLER = "SignUpController";
    private static final String INSERT_PRODUCT = "InsertProduct";
    private static final String INSERT_PRODUCT_CONTROLLER = "InsertProductController";
    private static final String SHOW_PRODUCT = "Show";
    private static final String SHOW_PRODUCT_CONTROLLER = "ShowProductController";
    private static final String SHOW_PRODUCT_CATEGORY = "SearchCategory";
    private static final String SHOW_PRODUCT_CATEGORY_CONTROLLER = "SearchCategoryController";
    private static final String ADD_TO_CART = "AddToCart";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String REMOVE_CART = "Remove";
    private static final String REMOVE_CART_CONTROLLER = "RemoveCartController";
    private static final String UPDATE_CART = "Modify";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String SEND_MAIL = "Verify";
    private static final String SEND_MAIL_CONTROLLER = "VerifyController";
    private static final String CHECKOUT = "CheckOut";
    private static final String CHECKOUT_CONTROLLER = "CheckoutController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (null != action) {
                switch (action) {
                    case LOGIN:
                        url = LOGIN_CONTROLLER;
                        break;
                    case LOGOUT:
                        url = LOGOUT_CONTROLLER;
                        break;
                    case SEARCH_USER:
                        url = SEARCH_USER_CONTROLLER;
                        break;
                    case DELETE_USER:
                        url = DELETE_USER_CONTROLLER;
                        break;
                    case UPDATE_USER:
                        url = UPDATE_USER_CONTROLLER;
                        break;
                    case GET_USER_DETAIL:
                        url = GET_USER_DETAIL_CONTROLLER;
                        break;
                    case SIGN_UP:
                        url = SIGN_UP_CONTROLLER;
                        break;
                    case SEARCH_PRODUCT:
                        url = SEARCH_PRODUCT_CONTROLLER;
                        break;
                    case DELETE_PRODUCT:
                        url = DELETE_PRODUCT_CONTROLLER;
                        break;
                    case GET_PRODUCT_DETAIL:
                        url = GET_PRODUCT_DETAIL_CONTROLLER;
                        break;
                    case UPDATE_PRODUCT:
                        url = UPDATE_PRODUCT_CONTROLLER;
                        break;
                    case INSERT_PRODUCT:
                        url = INSERT_PRODUCT_CONTROLLER;
                        break;
                    case SHOW_PRODUCT:
                        url = SHOW_PRODUCT_CONTROLLER;
                        break;
                    case SHOW_PRODUCT_CATEGORY:
                        url = SHOW_PRODUCT_CATEGORY_CONTROLLER;
                        break;
                    case ADD_TO_CART:
                        url = ADD_TO_CART_CONTROLLER;
                        break;
                    case REMOVE_CART:
                        url = REMOVE_CART_CONTROLLER;
                        break;
                    case UPDATE_CART:
                        url = UPDATE_CART_CONTROLLER;
                        break;
                    case SEND_MAIL:
                        url = SEND_MAIL_CONTROLLER;
                        break;
                    case CHECKOUT:
                        url = CHECKOUT_CONTROLLER;
                        break;
                    default:
                        break;
                }
            }
        } catch (Exception e) {
            log("Error at MainController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
