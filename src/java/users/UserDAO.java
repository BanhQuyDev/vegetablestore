/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sendEmail.UserEmailDTO;
import utils.DBUtils;

/**
 *
 * @author QUANG HUY
 */
public class UserDAO {

    public static final String LOGIN = "SELECT email,fullName,roleID,address,birthday,phone "
            + "FROM tblUsers WHERE email = ? AND password = ? AND status=1";
    public static final String SEARCH = "SELECT email,fullName, roleID, password,address,birthday,phone "
            + "FROM tblUsers WHERE fullName like ? AND status = 1 "
            + "ORDER BY email OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
    public static final String GET_USER_DETAIL = "SELECT email,fullName, roleID, password,address,birthday,phone "
            + "FROM tblUsers WHERE status = 1 AND email=?";
    public static final String DELETE = "UPDATE tblUsers SET status=0 WHERE email= ?";

    public static final String UPDATE = "UPDATE tblUsers"
            + " SET fullName= ?,roleID= ?,address = ?,birthday = ?,phone = ? WHERE email = ?";
    public static final String SIGN_UP = "INSERT INTO tblUsers(email,fullName,roleID,password,address,birthday,phone,status) VALUES(?,?,?,?,?,?,?,?)";

    public static final String COUNT_USER = "SELECT count(email) FROM tblUsers WHERE fullName like ? AND status = 1";

    public static final String CHECK_DUPLICATE = "SELECT email FROM tblUsers WHERE email=? AND status = 1";

    private static final String CHECK_EMAIL_LOGIN = "SELECT email,fullName,roleID,address,birthday,phone "
            + "FROM tblUsers "
            + "WHERE email = ? AND status = 1";

    public UserDTO checkLogin(String email, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, email);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    int roleID = rs.getInt("roleID");
                    String address = rs.getString("address");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    user = new UserDTO(email, "", roleID, address, fullName, birthday, phone);
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
        return user;
    }

    public List<UserDTO> getListUserByFullName(String search, int index) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
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
                    String email = rs.getString("email");
                    String fullName = rs.getString("fullName");
                    int roleID = rs.getInt("roleID");
                    String password = "***";
                    String address = rs.getString("address");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    list.add(new UserDTO(email, password, roleID, address, fullName, birthday, phone));
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

    public UserDTO getUserDetail(String email) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_USER_DETAIL);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    int roleID = rs.getInt("roleID");
                    String address = rs.getString("address");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    user = new UserDTO(email, "", roleID, address, fullName, birthday, phone);
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
        return user;
    }

    public boolean deleteUser(String email) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, email);
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

    public boolean updateUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getName());
                ptm.setInt(2, user.getRoleID());
                ptm.setString(3, user.getAddress());
                ptm.setString(4, user.getBirthday());
                ptm.setString(5, user.getPhone());
                ptm.setString(6, user.getEmail());
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

    public boolean signUpUser(UserEmailDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SIGN_UP);
                ptm.setString(1, user.getEmail());
                ptm.setString(2, user.getFullName());
                ptm.setInt(3, user.getRoleID());
                ptm.setString(4, user.getPassword());
                ptm.setString(5, user.getAddress());
                ptm.setString(6, user.getBirthday());
                ptm.setString(7, user.getPhone());
                ptm.setBoolean(8, true);
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

    public boolean createUser(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SIGN_UP);
                ptm.setString(1, user.getEmail());
                ptm.setString(2, user.getName());
                ptm.setInt(3, user.getRoleID());
                ptm.setString(4, user.getPassword());
                ptm.setString(5, user.getAddress());
                ptm.setString(6, user.getBirthday());
                ptm.setString(7, user.getPhone());
                ptm.setBoolean(8, true);
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

    public boolean checkDuplicate(String email) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
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

    public UserDTO getUserByEmail(String email) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_EMAIL_LOGIN);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    int roleID = rs.getInt("roleID");
                    String address = rs.getString("address");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    user = new UserDTO(email, "", roleID, address, fullName, birthday, phone);
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
        return user;
    }

    public int getCountUser(String search) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(COUNT_USER);
            ptm.setString(1, "%" + search + "%");
            rs = ptm.executeQuery();
            while (rs.next()) {
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
}
