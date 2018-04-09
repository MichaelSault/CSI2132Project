package beans;

import DatabaseAccess.PostgresqlAccess;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;


@Named(value = "addRestaurnantBean")
@SessionScoped
public class AddRestaurantBean implements Serializable {
    private String rid, name, type, url;
    private String result = "";
    private PostgresqlAccess pg = new PostgresqlAccess();
    
    public AddRestaurantBean() {
    }
    
    public void setRid(String rid)
    {
        this.rid = rid;
    }
    public String getRid()
    {
        return rid;
    }
    
    public void setName(String name)
    {
        this.name = name;
    }
    public String getName()
    {
        return name;
    }
    
    public void setType(String type)
    {
        this.type = type;
    }
    public String getType()
    {
        return type;
    }
    
    public void setUrl(String url)
    {
        this.url = url;
    }
    public String getUrl()
    {
        return url;
    }
    
    public String getResult()
    {
        result = pg.generalQuery(String.format("INSERT INTO RESTAURANT VALUES ('%s', '%s', '%s', '%s');", rid, name, type, url));
        return result;
    }
}
