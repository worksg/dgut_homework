<%-- 
    Document   : param2
    Created on : Apr 18, 2018, 10:06:43 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jsp:forward example</title>
    </head>
    <body>
        <jsp:forward page="welcome.jsp">
            <jsp:param name="name" value="John"/>
        </jsp:forward>
    </body>
</html>
