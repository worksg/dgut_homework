<%-- 
    Document   : welcome
    Created on : Apr 18, 2018, 10:13:19 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%request.setCharacterEncoding("utf-8");%>
        welcome !!
        <%= request.getParameter("name")%>
        <br>
    </body>
</html>
