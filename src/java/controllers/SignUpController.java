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
import users.UserError;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/SignUpController"})
public class SignUpController extends HttpServlet {

    private static final String ERROR = "signUp.jsp";
    private static final String SUCCESS = "SendEmailController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            String fullName = request.getParameter("fullName");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            boolean check = true;
            if (fullName.length() > 50 || fullName.length() < 5) {
                userError.setFullNameError("Full Name length must be [5,50]");
                check = false;
            }
            if (!password.equals(confirm)) {
                userError.setConfirmError("Password not same");
                check = false;
            }
            if (address.length() > 50 || fullName.length() < 5) {
                userError.setAddressError("Address length must be [5,50]");
                check = false;
            }
            if (phone.length() != 10) {
                userError.setPhoneError("Phone length must be 10 number");
                check = false;
            }
            if (check) {
                url = SUCCESS;
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            if (e.toString().contains("duplicate")) {
                userError.setEmailError("Email is duplicated!!!");
                request.setAttribute("USER_ERROR", userError);
            }
            log("Error at CreateController:" + e.toString());
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
