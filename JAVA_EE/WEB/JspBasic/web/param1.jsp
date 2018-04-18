<%-- 
    Document   : param1
    Created on : Apr 18, 2018, 9:48:18 PM
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
        <p>loading file</p>
        <jsp:include page="add.jsp">
            <jsp:param name="start" value="0"/>
            <jsp:param name="end" value="100"/>
        </jsp:include>
    </body>
</html>
