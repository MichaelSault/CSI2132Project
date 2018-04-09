
package beans;

import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;


@Named(value = "searchBean")
@SessionScoped
public class SearchBean implements Serializable {

    /**
     * Creates a new instance of SearchBean
     */
    public SearchBean() {
    }
    
}
