<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DatabaseAccess.PostgresqlAccess"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="addRestaurantBean"  class="beans.AddRestaurantBean" scope="session"/>
<jsp:setProperty name="addRestaurantBean" property="*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Query</h1>
        
        <p>
        <h3>output</h3> <jsp:getProperty name="addRestaurantBean" property="result" /> <br>
        
        </p>
        
        
                
    </body>
</html>
