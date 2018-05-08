<%-- 
    Document   : Counter
    Created on : 2018-4-24, 15:31:38
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Counter</title>
    </head>
    <body>
        <jsp:useBean id="counter" scope="application" class="com.jsp.Counter"/>
        <jsp:getProperty name="counter" property="count" />
    </body>
</html>
