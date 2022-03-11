/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import categories.CategoryDAO;
import categories.CategoryDTO;
import javax.servlet.http.HttpSession;
import products.ProductDAO;
import products.ProductDTO;
import users.UserDTO;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {

    private final static String ERROR = "error.jsp";
    private final static String SUCCESS = "shop.jsp";
    private final static String AUTHENTICATION = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String search = "";
            int index = 1;
            int categoryID = 0;
            ProductDAO dao = new ProductDAO();
            int count = dao.getCountProduct(search);
            int endPage = count / 12;
            if (count % 12 != 0) {
                endPage++;
            }
            HttpSession session = request.getSession();
            UserDTO userLogin = (UserDTO) session.getAttribute("LOGIN_USER");
            if (userLogin != null) {
                if (userLogin.getRoleID() != 2) {
                    url = AUTHENTICATION;
                    return;
                }
            }
            request.setAttribute("END_PAGE", endPage);
            request.setAttribute("INDEX_PAGE_PRODUCT", index);
            request.setAttribute("TAG", categoryID);
            List<ProductDTO> listProduct = dao.getListProductByNameHomePage(search, index);
            List<CategoryDTO> listCategory = new CategoryDAO().getListCategory();
            if (listProduct.size() > 0 && listCategory.size() > 0) {
                request.setAttribute("LiST_PRODUCT", listProduct);
                request.setAttribute("LiST_CATEGORY", listCategory);
                url = SUCCESS;
            }

        } catch (Exception e) {
            log("Error at HomeController:" + e.toString());
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
