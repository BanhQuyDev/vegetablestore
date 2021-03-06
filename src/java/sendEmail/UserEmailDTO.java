/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sendEmail;

/**
 *
 * @author QUANG HUY
 */
public class UserEmailDTO {

    private String email;
    private String fullName;
    private String password;
    private int roleID;
    private String address;
    private String birthday;
    private String phone;
    private String code;

    public UserEmailDTO() {
        this.email = "";
        this.fullName = "";
        this.password = "";
        this.roleID = 0;
        this.address = "";
        this.birthday = "";
        this.phone = "";
        this.code = "";
    }

    public UserEmailDTO(String email, String fullName, String password, int roleID, String address, String birthday, String phone, String code) {
        this.email = email;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.address = address;
        this.birthday = birthday;
        this.phone = phone;
        this.code = code;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
