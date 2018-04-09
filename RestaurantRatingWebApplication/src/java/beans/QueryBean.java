
package beans;

import DatabaseAccess.PostgresqlAccess;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;


@Named(value = "queryBean")
@SessionScoped
public class QueryBean implements Serializable {
    private String query, output, queryA, queryAOutput;
    private PostgresqlAccess pg = new PostgresqlAccess();
    
    public QueryBean() {
    }
    
    public String getQuery()
    {
        return query;
    }
    public void setQuery(String query)
    {
        this.query = query;
    }
    
    public void setOutput(String output)
    {
        this.output = pg.generalQuery(output);
    }
    public String getOutput()
    {
        return pg.generalQuery(query);
    }
    
    public void setQueryA(String queryA)
    {
        this.queryA = String.format("SELECT DISTINCT * FROM RESTAURANT R , LOCATION L WHERE R.RESTAURANT_ID = '%s' AND L.RESTAURANT_ID=R.RESTAURANT_ID;", queryA);
    }
    public String getQueryA()
    {
        return queryA;
    }
    
    public void setQueryAOutput(String output)
    {
        this.queryAOutput = pg.generalQuery(queryA);
    }
    public String getQueryAOutput()
    {
        return pg.generalQuery(queryA);
    }
    
}
