
package beans;

import DatabaseAccess.PostgresqlAccess;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;


@Named(value = "dBCreds")
@SessionScoped
public class DBCreds implements Serializable {

    private String username;
    private String password;
    
    public DBCreds()
    {
    }
    
    public String getUsername()
    {
        return username;
    }
    public void setUsername(String username)
    {
        this.username = username;
    }
    
    public String getPassword()
    {
        return password;
    }
    public void setPassword(String password)
    {
        this.password = password;
    }
    
}
