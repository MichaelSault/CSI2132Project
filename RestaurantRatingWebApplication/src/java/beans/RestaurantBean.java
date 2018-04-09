
package beans;

import DatabaseAccess.PostgresqlAccess;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;


@Named(value = "restaurantBean")
@SessionScoped
public class RestaurantBean implements Serializable {
    private String restaurant_id, name, type, url, restaurantnamequery;
    
    
    
    
    private PostgresqlAccess pg = new PostgresqlAccess();
    
    
    public RestaurantBean() {
    }
    
    public String getRestaurant_id()
    {
        return this.restaurant_id;
    }
    public void setRestaurant_id(String rid)
    {
        this.restaurant_id = rid;
    }
    
     public String getName()
    {
        return this.name;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    
     public String getType()
    {
        return type;
    }
    public void setType(String type)
    {
        this.type = type;
    }
    
     public String getUrl()
    {
        return url;
    }
    public void setUrl(String url)
    {
        this.url = url;
    }
    
    public void getData(String query)
    {
        List<String> ret = pg.getRestaurantData(query);
        try
        {
            this.restaurant_id = ret.get(0);
            this.name = ret.get(1);
            this.type = ret.get(2);
            this.url = ret.get(3);
        }
        catch(Exception e)
        {
            this.restaurant_id = "no results";
            this.name = "no results";
            this.type = "no results";
            this.url = "no results";
        }
        
        
    }
    
    public String getRestaurantnamequery()
    {
        return this.restaurantnamequery;
    }
    public void setRestaurantnamequery(String rnq)
    {
        this.restaurantnamequery = rnq;
        getData(rnq);        
    }
    
}
