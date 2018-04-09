<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DatabaseAccess.PostgresqlAccess"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="dBCreds"  class="beans.DBCreds" scope="session"/>
<jsp:setProperty name="dBCreds" property="*" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user inputs</title>
    </head>
    <body>
      
         <h1>Welcome</h1>
                
         
         
            <p>
                Username: <jsp:getProperty name="dBCreds" property="username" /> <br>
                Password: <jsp:getProperty name="dBCreds" property="password" />
            </p>
                
    
            <p>
                <%
                    
                    PostgresqlAccess testpgsql = new PostgresqlAccess(); // add creds to constructor
                    
                    testpgsql.setCreds(dBCreds.getUsername(), dBCreds.getPassword());
                    testpgsql.setup();
                    //testpgsql.test(); // causes a timeout with wrong creds
                    
                %>
                
                <% String queryresult = testpgsql.test2();%>
                <%=queryresult%>
                
            </p>
            
            
            <%--
            <c:if test="${not testpgsql.connected}">
                <b>invalid creds</b>
                
                <%response.sendRedirect("invalidcreds.jsp");%>
            
            </c:if>
            
            <b>connected</b>
            
            <% String queryresult = testpgsql.test2();%>
            <%=queryresult%>
            
            <%response.sendRedirect("welcome.jsp");%>
            --%>
            
          
        
            
        
    </body>
</html>