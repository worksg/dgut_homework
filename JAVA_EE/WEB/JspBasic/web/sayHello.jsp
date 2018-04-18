<%-- 
    Document   : sayHello
    Created on : Apr 18, 2018, 8:36:25 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>declarative method</title>
    </head>
    <body>
        <%!String sayHello(){return "Hello";}%>
        <%=sayHello()%>
    </body>
</html>
