/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author QUANG HUY
 */
public class ProductDAO {

    public static final String SEARCH = "SELECT productID,productName, price, quantity,categoryID,importDate,usingDate,image "
            + "FROM tblProduct WHERE productName like ? AND status = 1 "
            + "ORDER BY productID OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
    public static final String SEARCH_HOME_PAGE = "SELECT productID,productName, price, quantity,categoryID,importDate,usingDate,DATEDIFF(day, GETDATE(), usingDate) AS outofdate ,image\n"
            + "FROM tblProduct \n"
            + "WHERE productName like ? AND status = 1 AND quantity > 0 \n"
            + "AND DATEDIFF(day, GETDATE(), usingDate) >=0\n"
            + "ORDER BY productID OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
    public static final String DELETE = "UPDATE tblProduct SET status=0 WHERE productID= ?";
    public static final String GET_PRODUCT_DETAIL = "SELECT productID,productName, price, quantity,categoryID,importDate,usingDate,image "
            + "FROM tblProduct WHERE status = 1 AND productID=?";
    public static final String UPDATE = "UPDATE tblProduct "
            + "SET productName= ?,price= ?,quantity = ?,categoryID = ?,importDate = ?,usingDate = ?,image = ? WHERE productID = ?";
    public static final String COUNT_PRODUCT = "SELECT count(productID) FROM tblProduct WHERE productName like ? AND status = 1";

    public static final String COUNT_PRODUCT_CATEGORY = "SELECT count(productID) FROM tblProduct WHERE productName like ? AND status = 1 AND categoryID = ?";

    public static final String INSERT = "INSERT INTO tblProduct(productName,price,quantity,categoryID,usingDate,image,status) "
            + "VALUES(?,?,?,?,?,?,?)";
    public static final String SEARCH_HOME_PAGE_BY_CATEGORY = "SELECT productID,productName, price, quantity,categoryID,importDate,usingDate,DATEDIFF(day, GETDATE(), usingDate) AS outofdate ,image\n"
            + "FROM tblProduct \n"
            + "WHERE productName like ? AND status = 1 AND quantity > 0 \n"
            + "AND DATEDIFF(day, GETDATE(), usingDate) <= 15 AND DATEDIFF(day, GETDATE(), usingDate) >=0\n"
            + "AND DATEDIFF(YEAR, GETDATE(), usingDate) = 0 AND DATEDIFF(MONTH, GETDATE(), usingDate) = 0\n"
            + "AND categoryID = ? \n"
            + "ORDER BY productID OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";

    public static final String GET_PRODUCT_QUANTITY = "SELECT quantity FROM tblProduct "
            + "WHERE productID = ? AND status = 1";

    private static final String UPDATE_NEW_QUANTITY = "UPDATE tblProduct "
                                                    + "SET quantity = ? "
                                                    + "WHERE productID = ?";

    public List<ProductDTO> getListProductByName(String search, int index) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                ptm.setInt(2, (index - 1) * 10);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int categoryID = rs.getInt("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String image = rs.getString("image");
                    list.add(new ProductDTO(productID, productName, price, quantity, categoryID, importDate, usingDate, image));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean deleteProduct(int productID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setInt(1, productID);
                int value = ptm.executeUpdate();
                result = value > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public ProductDTO getProductDetail(int productID) throws SQLException {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_DETAIL);
                ptm.setInt(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int categoryID = rs.getInt("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String image = rs.getString("image");
                    product = new ProductDTO(productID, productName, price, quantity, categoryID, importDate, usingDate, image);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return product;
    }

    public boolean updateProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, product.getProductName());
                ptm.setDouble(2, product.getProductPrice());
                ptm.setInt(3, product.getProducQuantity());
                ptm.setInt(4, product.getProductCategoryID());
                ptm.setString(5, product.getImportDate());
                ptm.setString(6, product.getUsingDate());
                ptm.setString(7, product.getProducImage());
                ptm.setInt(8, product.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int getCountProduct(String search) throws SQLException, ClassNotFoundException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(COUNT_PRODUCT);
            ptm.setString(1, "%" + search + "%");
            rs = ptm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return count;
    }

    public int getCountProductCategory(String search, int categoryID) throws SQLException, ClassNotFoundException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(COUNT_PRODUCT_CATEGORY);
            ptm.setString(1, "%" + search + "%");
            ptm.setInt(2, categoryID);
            rs = ptm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return count;
    }

    public boolean insertProduct(ProductDTO product) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, product.getProductName());
                ptm.setDouble(2, product.getProductPrice());
                ptm.setInt(3, product.getProducQuantity());
                ptm.setInt(4, product.getProductCategoryID());
                ptm.setString(5, product.getUsingDate());
                ptm.setString(6, product.getProducImage());
                ptm.setBoolean(7, true);
                check = ptm.executeUpdate() > 0;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<ProductDTO> getListProductByCategoryHomePage(String search, int category, int index) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_HOME_PAGE_BY_CATEGORY);
                ptm.setString(1, "%" + search + "%");
                ptm.setInt(2, category);
                ptm.setInt(3, (index - 1) * 12);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int categoryID = rs.getInt("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String image = rs.getString("image");
                    list.add(new ProductDTO(productID, productName, price, quantity, categoryID, importDate, usingDate, image));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<ProductDTO> getListProductByNameHomePage(String search, int index) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_HOME_PAGE);
                ptm.setString(1, "%" + search + "%");
                ptm.setInt(2, (index - 1) * 12);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = rs.getInt("productID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int categoryID = rs.getInt("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String image = rs.getString("image");
                    list.add(new ProductDTO(productID, productName, price, quantity, categoryID, importDate, usingDate, image));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public int getProductQuantity(int productID) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_QUANTITY);
                ptm.setInt(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    quantity = rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return quantity;
    }

    public boolean updateProductQuantity(int productID, int newQuantity) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_NEW_QUANTITY);
                ptm.setInt(1, newQuantity);
                ptm.setInt(2, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
