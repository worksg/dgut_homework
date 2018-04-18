<%-- 
    Document   : forward.jsp
    Created on : Apr 18, 2018, 9:36:15 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forward</title>
    </head>
    <body>
        <% double i = Math.random();
            if (i > 0.5) {
        %>
        <jsp:forward page="catalog1.html"></jsp:forward>
        <%
        } else {
        %>
        <jsp:forward page="catalog2.html"></jsp:forward>
        <%
        }
        %>
    </body>
</html>
