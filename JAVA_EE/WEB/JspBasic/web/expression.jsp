<%-- 
    Document   : expression
    Created on : Apr 18, 2018, 8:19:11 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP expression</title>
    </head>
    <body>
        <!--can see-->
        <% for(int i=1;i<=5;i++){ %>
    <h<%=i%>> hello </h<%=i%>><br>
        <%}%>
        <%-- can't see --%>
    </body>
</html>
