<%-- 
    Document   : jspSession.jsp
    Created on : Apr 18, 2018, 9:04:10 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("name") == null) 
                session.setAttribute("name", "hy1");
        %>
        
        <% out.println(session.getAttribute("name")); %>
    </body>
</html>
