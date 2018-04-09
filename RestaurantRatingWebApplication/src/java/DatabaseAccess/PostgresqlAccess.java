
package DatabaseAccess;


import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;


public class PostgresqlAccess {
    String password = "123", message = "Enter password";
    String username = "postgres";
    String url = "jdbc:postgresql://159.89.123.95/postgres";
    
    Connection c = null;
    Statement stmt = null;
    
    public String result = "";
    public boolean connected = false;
    
    public PostgresqlAccess()
    {
        
    }
    
    public void setCreds(String username, String password)
    {
        this.username = username;
        this.password = password;
    }
    
    public void getCreds() // remove later
    { 
        /*
        if( System.console() == null ) 
        { // inside IDE like Eclipse or NetBeans
            final JPasswordField pf = new JPasswordField(); 
            this.password = JOptionPane.showConfirmDialog( null, pf, message,
            JOptionPane.OK_CANCEL_OPTION,
            JOptionPane.QUESTION_MESSAGE ) == JOptionPane.OK_OPTION ? 
                new String( pf.getPassword() ) : "";
        }
        else 
            this.password = new String( System.console().readPassword( "%s> ", message ) );
        */
        //this.password = "";
    }
    
    public boolean setup()
    {
        try
        {
            Class.forName("org.postgresql.Driver");
            c = DriverManager.getConnection(url, username, password);
            c.setAutoCommit(false);
            System.out.println("Opened database successfully");

            stmt = c.createStatement(); 
        }
        catch ( Exception e ) {
            //System.err.println( e.getClass().getName()+": "+ e.getMessage() );
            //System.exit(0);
            return false;
        }
        connected = true;
        return true;
    }
    
    public void test()
    {
        try 
        {
            ResultSet rs = stmt.executeQuery( "SELECT * FROM RATER;" );
            while ( rs.next() ) {
                
                String name = rs.getString("name");
                String email = rs.getString("email");
             
                System.out.println("name: " + name);
                result += name;
                result += "\n";
                System.out.println("email: " + email);
                result += email;
                result += "<br>";
            }
            rs.close();
            

            
            rs = stmt.executeQuery( "SELECT * FROM RESTAURANT;" );
            while ( rs.next() ) {
                String name = rs.getString("name");
             
                System.out.println("name: " + name);
            }
            rs.close();
            

            stmt.close();
            c.close();
        } 
        catch ( Exception e ) {
            //System.err.println( e.getClass().getName()+": "+ e.getMessage() );
            //System.exit(0);
        }
        System.out.println("Query successful");
    }
    
    public String test2()
    {
        String retval = "";
        
        if (connected)
        {
            return retval;
        }
        /*
        
        try 
        {
            ResultSet rs = stmt.executeQuery( "SELECT * FROM RATER;" );
            while ( rs.next() ) {
                
                String name = rs.getString("name");
                String email = rs.getString("email");
             
                System.out.println("name: " + name);
                retval += name;
                System.out.println("email: " + email);
                retval += email;
            }
            rs.close();
            
            rs = stmt.executeQuery( "SELECT * FROM RESTAURANT;" );
            while ( rs.next() ) {
                String name = rs.getString("name");
             
                System.out.println("name: " + name);
                retval += name;
            }
            rs.close();
            
            stmt.close();
            c.close();
        } 
        catch ( Exception e ) {
            System.err.println( e.getClass().getName()+": "+ e.getMessage() );
            //System.exit(0);
        }
        */
        return retval;
    }
    
    public List<String> getRestaurantData(String restaurantquery)
    {
        //String restaurantquery = "SuzyQ";
        
        List<String> results = new ArrayList<String>();
        
        Connection c = null;
        Statement stmt = null;
        try 
        {
            Class.forName("org.postgresql.Driver");
            //c = DriverManager.getConnection("jdbc:postgresql://159.89.123.95/postgres", username, password);
            c = DriverManager.getConnection("jdbc:postgresql://localhost/postgres", username, password);
            c.setAutoCommit(false);

            stmt = c.createStatement();

            ResultSet rs = stmt.executeQuery( "SELECT * FROM RESTAURANT R WHERE R.NAME = '" + restaurantquery + "'");
            while ( rs.next() ) {
                results.add("restaurant_id: " + rs.getString("restaurant_id"));
                results.add("name: " + rs.getString("name"));
                results.add("type: " + rs.getString("type"));
                results.add("id: " + rs.getString("url"));
            }
            rs.close();

            
            stmt.close();
            c.close();
        } 
        catch ( Exception e ) {
                results.add("zero results");
        }
        return results;
    }
    
    public String query(String table, String col, String value)
    {
        List<Pair> KVList = new ArrayList<Pair>();
        
        String results = "";
        
        Connection c = null;
        Statement stmt = null;
        try 
        {
            Class.forName("org.postgresql.Driver");
            //c = DriverManager.getConnection("jdbc:postgresql://159.89.123.95/postgres", username, password);
            c = DriverManager.getConnection("jdbc:postgresql://localhost/postgres", username, password);
            c.setAutoCommit(false);

            
          
            
            
            stmt = c.createStatement();

            String dbquery = String.format("SELECT * FROM %s Q WHERE Q.%s = '%s';", table, col, value);
            
            ResultSet rs = stmt.executeQuery(dbquery);
            ResultSetMetaData rsmd = rs.getMetaData();
            
            int colCount = rsmd.getColumnCount();
            List<String> colNames = new ArrayList<String>();
            for (int i = 1; i <= colCount; ++i)
            {
                String n = rsmd.getColumnName(i);
                colNames.add(n);
            }
            
            int count = 0;
            while ( rs.next() ) {
                //String entry = "";
                for (int i = 0; i < colCount; ++i)
                {
                    String entry = String.format("[%s: %s]", colNames.get(i), rs.getString(colNames.get(i)));
                    results += entry;
                }
                
            }
            
            rs.close();
            
            stmt.close();
            c.close();
        } 
        catch ( Exception e ) {
            results += e;
            results += "No results";
        }
        return results;
    }
    
    
    public String generalQuery(String query)
    {
        String results = "";
        
        Connection c = null;
        Statement stmt = null;
        try 
        {
            Class.forName("org.postgresql.Driver");
            //c = DriverManager.getConnection("jdbc:postgresql://159.89.123.95/postgres", username, password);
            c = DriverManager.getConnection("jdbc:postgresql://localhost/postgres", username, password);
            c.setAutoCommit(false);

            
          
            
            
            stmt = c.createStatement();

            String dbquery = String.format(query);
            
            ResultSet rs = stmt.executeQuery(dbquery);
            ResultSetMetaData rsmd = rs.getMetaData();
            
            
            
           
            int columnsNumber = rsmd.getColumnCount();
            while (rs.next()) 
            {
                for (int i = 1; i <= columnsNumber; i++) 
                {
                    if (i > 1) System.out.print(",  ");
                        String columnValue = rs.getString(i);
                    results += (rsmd.getColumnName(i) + ":" + columnValue + " " );
                }
            }
            
            
            
            
            rs.close();
            
            stmt.close();
            c.close();
        } 
        catch ( Exception e ) {
            results += e;
            results += "No results";
        }
        return results;
    }
    
    
    
    public static void main( String args[] ) {
        
        
        /*
        final String password, message = "Enter password";
        final String username = "postgres";
        if( System.console() == null ) 
        { // inside IDE like Eclipse or NetBeans
            final JPasswordField pf = new JPasswordField(); 
            password = JOptionPane.showConfirmDialog( null, pf, message,
            JOptionPane.OK_CANCEL_OPTION,
            JOptionPane.QUESTION_MESSAGE ) == JOptionPane.OK_OPTION ? 
                new String( pf.getPassword() ) : "";
        }
        else 
            password = new String( System.console().readPassword( "%s> ", message ) );
       
       
        Connection c = null;
        Statement stmt = null;
        try 
        {
            Class.forName("org.postgresql.Driver");
            c = DriverManager.getConnection("jdbc:postgresql://159.89.123.95/postgres", username, password);
            c.setAutoCommit(false);
            System.out.println("Opened database successfully");

            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery( "SELECT * FROM RATER;" );
            while ( rs.next() ) {
                String name = rs.getString("name");
                String email = rs.getString("email");
             
                System.out.println("name: " + name);
                System.out.println("email: " + email);
            }
            rs.close();
            
            
            
            
            
            
            rs = stmt.executeQuery( "SELECT * FROM RESTAURANT;" );
            while ( rs.next() ) {
                String name = rs.getString("name");
             
                System.out.println("name: " + name);
            }
            rs.close();
            
            
            
            
            
            
            
            
            
            
            
            stmt.close();
            c.close();
        } 
        catch ( Exception e ) {
            System.err.println( e.getClass().getName()+": "+ e.getMessage() );
            System.exit(0);
        }
        System.out.println("Operation done successfully");
        */
    }
    
}
