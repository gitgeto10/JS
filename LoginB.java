
package gestion.mecanique.bean;
import java.io.Serializable;



public class LoginB implements Serializable {
   
    private static final long serialVersionUID = 1L;
    private String code;
    private String password;

    public String getUsername() {
        return code;
    }

    public void setUsername(String code) {
        this.code = code;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}