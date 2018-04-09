<%@page import="DatabaseAccess.PostgresqlAccess"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
        </style>
        
        <title>Part 3</title>
   
    </head>
    
  
    
    
    <body>
        <h2>Add data to Restaurant</h2>
        <%--
            add data to restaurant
        --%>
        <p>
            <form action="AddRestaurant.jsp">
                RESTAURANT_ID: <input type="text" name="rid" size="30" value=""/> <br>
                NAME: <input type="text" name="name" size="30" value=""/> <br>
                TYPE: <input type="text" name="type" size="30" value=""/> <br>
                URL: <input type="text" name="url" size="30" value=""/> <br>

                <input type="submit" value="Submit" name="submitaddrestaurant"/>
            
            </form>
            
        </p>

        <h2>Delete data from Restaurant</h2>
        <%--
            delete data from restaurant
        --%>
        <p>
            <form action="RemoveRestaurant.jsp">
                RESTAURANT_ID: <input type="text" name="rid" size="30" value=""/> <br>

                <input type="submit" value="Submit" name="submitremoverestaurant"/>
            
            </form>
            
        </p>
        
        <h2>Add data to Rater</h2>
        <%--
            add data to rater
        --%>
        <p>
            <form action="AddRater.jsp">
                USER_ID: <input type="text" name="uid" size="30" value=""/> <br>
                EMAIL: <input type="text" name="email" size="30" value=""/> <br>
                NAME: <input type="text" name="name" size="30" value=""/> <br>
                JOINDATE: <input type="text" name="joindate" size="30" value=""/> <br>
                TYPE: <input type="text" name="type" size="30" value=""/> <br>
                REPUTATION: <input type="text" name="reputation" size="30" value=""/> <br>

                <input type="submit" value="Submit" name="submitaddrater"/>
            
            </form>
            
        </p>
        
        <h2>Delete data from Rater</h2>
        <%--
            delete data from rater
        --%>
        <p>
            <form action="RemoveRater.jsp">
                USER_ID: <input type="text" name="uid" size="30" value=""/> <br>

                <input type="submit" value="Submit" name="submitremoverater"/>
            
            </form>
            
        </p>
        
        <h2>Add data to MenuItems</h2>
        <%--
            add data to menuitems
        --%>
        <p>
            <form action="AddMenuItem.jsp">
                ITEM_ID: <input type="text" name="iid" size="30" value=""/> <br>
                ITEM_NAME: <input type="text" name="name" size="30" value=""/> <br>
                ITEM_TYPE: <input type="text" name="type" size="30" value=""/> <br>
                ITEM_CATEGORY: <input type="text" name="category" size="30" value=""/> <br>
                ITEM_DESCRIPTION: <input type="text" name="description" size="30" value=""/> <br>
                PRICE: <input type="text" name="price" size="30" value=""/> <br>
                RESTAURANT_ID: <input type="text" name="rid" size="30" value=""/> <br>
                
                <input type="submit" value="Submit" name="submitaddmenuitem"/>
            
            </form>
            
        </p>
        
        <h2>Delete data from MenuItems</h2>
        <%--
            delete data from menuitems
        --%>
        <p>
            <form action="RemoveMenuItem.jsp">
                ITEM_ID: <input type="text" name="iid" size="30" value=""/> <br>

                <input type="submit" value="Submit" name="submitremovemenuitem"/>
            
            </form>
            
        </p>
        
        
        
        <%
            PostgresqlAccess ps = new PostgresqlAccess();
            String ret = ps.query("RESTAURANT", "NAME", "SuzyQ");
        %>
        
        <%=ret%>
        
        
        
    </body>
</html>
