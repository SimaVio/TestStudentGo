package student.StudentGo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "Accounts")
public class Account implements Serializable {

    public static final String ROLE_ADMINISTRATOR = "ADMINISTRATOR";
    public static final String ROLE_ANGAJAT = "ANGAJAT";
    public static final String ROLE_STUDENT = "STUDENT";
    private static final long serialVersionUID = -2054386655979281969L;
    private String userName;
    private String password;
    private boolean active;
    private String userRole;

    @Id
    @Column(name = "User_Name", length = 20, nullable = false)
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Column(name = "Password", length = 20, nullable = false)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "Active", length = 1, nullable = false)
    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    @Column(name = "User_Role", length = 20, nullable = false)
    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    @Override
    public String toString() {
        return "[" + this.userName + "," + this.password + "," + this.userRole + "]";
    }

}
