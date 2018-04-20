<%-- 
    Document   : exception
    Created on : 2018-4-18, 21:46:09
    Author     : rmb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#FFFFFF">
        <h1>错误信息显示</h1>
        <br>An error occured in the bean.Error Message is:</br>
        <%=exception.getMessage()%>
        <%=exception.toString()%>
    </body>
</html>
