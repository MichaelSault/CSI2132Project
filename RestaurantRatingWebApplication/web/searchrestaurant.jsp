<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DatabaseAccess.PostgresqlAccess"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="restaurantBean"  class="beans.RestaurantBean" scope="session"/>
<jsp:setProperty name="restaurantBean" property="*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Restaurant Data</h1>
        
        <p>
        Restaurant ID: <jsp:getProperty name="restaurantBean" property="restaurant_id" /> <br>
        Name: <jsp:getProperty name="restaurantBean" property="name" /> <br>
        Type: <jsp:getProperty name="restaurantBean" property="type" /> <br>
        URL: <jsp:getProperty name="restaurantBean" property="url" /> <br>
        </p>
        
        <h1>Reviews</h1>
                
    </body>
</html>
